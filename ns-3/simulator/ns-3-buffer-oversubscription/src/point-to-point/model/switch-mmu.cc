#include <iostream>
#include <fstream>
#include "ns3/packet.h"
#include "ns3/simulator.h"
#include "ns3/object-vector.h"
#include "ns3/uinteger.h"
#include "ns3/log.h"
#include "ns3/assert.h"
#include "ns3/global-value.h"
#include "ns3/boolean.h"
#include "ns3/simulator.h"
#include "ns3/random-variable.h"
#include "switch-mmu.h"
#include "point-to-point-net-device.h"
#include "point-to-point-channel.h"
#include "ns3/fcp-header.h"
#include "ns3/ethernet-header.h"
#include "ppp-header.h"
#include "ns3/interface-tag.h"

NS_LOG_COMPONENT_DEFINE("SwitchMmu");

namespace ns3 {
TypeId SwitchMmu::GetTypeId(void) {
	static TypeId tid = TypeId("ns3::SwitchMmu")
	                    .SetParent<Object>()
	                    .AddConstructor<SwitchMmu>();
	return tid;
}


SwitchMmu::SwitchMmu(void) {

	// Here we just initialize some default values.
	// The buffer can be configured using Set functions through the simulation file later.

	memset(ingress_bytes, 0, sizeof(ingress_bytes));
	memset(egress_bytes, 0, sizeof(egress_bytes));
	memset(egress_bytes_pt, 0, sizeof(egress_bytes_pt));
	total_used_buffer = 0;
	memset(fctbs, 0, sizeof(fctbs));
	memset(abr, 0, sizeof(abr));
	memset(used_bytes, 0, sizeof(used_bytes));
	memset(accumu_drained_bytes, 0, sizeof(accumu_drained_bytes));
	memset(accumu_used_credit, 0, sizeof(accumu_used_credit));
	memset(accumu_recycled_credit, 0, sizeof(accumu_recycled_credit));
	memset(need_set_tap, 0, sizeof(need_set_tap));
	memset(need_ret_tap, 0, sizeof(need_ret_tap));
	memset(rate_adjusting, 0, sizeof(rate_adjusting));
	
	memset(fccl, 0, sizeof(fccl));
	credit_pool = 0;
	total_parked_credit = 0;
	memset(granted_credit, 0, sizeof(granted_credit));
	memset(parked_credit, 0, sizeof(parked_credit));
	memset(buffer_size, 0, sizeof(buffer_size));
}

bool SwitchMmu::CheckIngressAdmission(uint32_t port, uint32_t qIndex, uint32_t psize) {
	//使用总buffer去判断是否溢出
	if(total_buffer - total_used_buffer < psize){
		std::cout << "Buffer overflow, packet size is larger than buffer size!" << std::endl;
		return false;
	}
	else{
		return true;
	}
}

bool SwitchMmu::CheckEgressAdmission(uint32_t port, uint32_t qIndex, uint32_t psize) {
	return true;
}

void SwitchMmu::UpdateIngressAdmission(uint32_t port, uint32_t qIndex, uint32_t psize) {
	ingress_bytes[port][qIndex] += psize;
	#if OUTPUT_1
	std::cout << "Time " << Simulator::Now().GetNanoSeconds() << " abr " << abr[port] <<
				 " remainBS " << buffer_size[port] - used_bytes[port] << 
				 " node " << node_id << " port " << port << " qIndex " << qIndex << std::endl;
	std::cout << "Time " << Simulator::Now().GetNanoSeconds() << " ingress_bytes " << ingress_bytes[port][qIndex] <<
				 " node " << node_id << " port " << port << " qIndex " << qIndex << std::endl;
	#endif
	total_used_buffer += psize; // IMPORTANT: total_used_buffer is only updated in the ingress. No need to update in egress. Avoid double counting.
	used_bytes[port] += psize; // IMPORTANT: used_bytes is only updated in the ingress. No need to update in egress. Avoid double counting.
}

void SwitchMmu::UpdateEgressAdmission(uint32_t port, uint32_t qIndex, uint32_t psize) {
	egress_bytes[port][qIndex] += psize;
	egress_bytes_pt[port] += psize; //统计出口端口的信息
	#if OUTPUT_1
	std::cout << "Time " << Simulator::Now().GetNanoSeconds() << " egress_bytes " << egress_bytes[port][qIndex] <<
				 " node " << node_id << " port " << port << " qIndex " << qIndex << std::endl;
	#endif
}

void SwitchMmu::RemoveFromIngressAdmission(uint32_t port, uint32_t qIndex, uint32_t psize) {
	// If else are simply unnecessary but its a safety check to avoid magic scenarios (if a packet vanishes in the buffer) where we
	// might assign negative value to unsigned intergers.
	if (ingress_bytes[port][qIndex] >= psize)
		ingress_bytes[port][qIndex] -= psize;
	else
		ingress_bytes[port][qIndex] = 0;

	if (total_used_buffer >= psize) // IMPORTANT: total_used_buffer is only updated in the ingress. No need to update in egress. Avoid double counting.
		total_used_buffer -= psize;
	else
		total_used_buffer = 0;

	if (used_bytes[port] >= psize){
		used_bytes[port] -= psize; // IMPORTANT: used_bytes is only updated in the ingress. No need to update in egress. Avoid double counting.
	}
	else{
		used_bytes[port] = 0;
	}

	accumu_drained_bytes[port][qIndex] += psize;
	credit_pool += psize; // IMPORTANT: credit_pool is only updated in the ingress. No need to update in egress. Avoid double counting.
	granted_credit[port] -= psize; // IMPORTANT: granted_credit is only updated in the ingress. No need to update in egress. Avoid double counting.
    // std::cout << Simulator::Now().GetNanoSeconds() << " node " << node_id << " port " << port << " event CREDIT_RETURN" << std::endl;

	#if OUTPUT_1
	std::cout << "Time " << Simulator::Now().GetNanoSeconds() 
		<< " node " << node_id
		<< " port " << port 
		<< " qIndex " << qIndex 
		<< " event DATA_CREDIT_RECYCLE"
		<< " credit_pool " << credit_pool
		<< " granted_credit " << granted_credit[port]
		<< " parked_credit " << parked_credit[port]
		<< " total_parked_credit " << total_parked_credit
		<< " abr " << abr[port] 
		<< " remainBS " << buffer_size[port] - used_bytes[port]  
		<< " ingress_bytes " << ingress_bytes[port][qIndex]
		
		<< std::endl;
	#endif
}

void SwitchMmu::RemoveFromEgressAdmission(uint32_t port, uint32_t qIndex, uint32_t psize) {
	fctbs[port] += psize;
	accumu_used_credit[port][qIndex] += psize;
	if (egress_bytes[port][qIndex] >= psize) {
		egress_bytes[port][qIndex] -= psize;
		egress_bytes_pt[port] -= psize; //统计出口端口的信息
	}
		
	else{
		egress_bytes[port][qIndex] = 0;
		egress_bytes_pt[port] = 0; 
	}
		
	#if OUTPUT_1
	std::cout << "Time " << Simulator::Now().GetNanoSeconds() 
		<< " fccl " << fccl[port] 
		<< " fctbs " << fctbs[port]
		<< " inflight " << accumu_used_credit[port][qIndex] - accumu_recycled_credit[port][qIndex]
		<< " egress_bytes " << egress_bytes[port][qIndex]
		<< " node " << node_id 
		<< " port " << port 
		<< " qIndex " << qIndex 
		<< std::endl;
	#endif
}

Ptr<Packet> SwitchMmu::ConstructFcp(uint32_t inDev, uint32_t qIndex){
	FcpHeader fcph = FcpHeader();
	fcph.SetVl(qIndex);
	
	// uint32_t fccl_ =  abr[inDev] + (buffer_size[inDev] - used_bytes[inDev]);
	fcph.SetFccl(GetAdvertisedFccl(inDev));
	fcph.SetQlen(ingress_bytes[inDev][qIndex]);
	fcph.SetFccr(accumu_drained_bytes[inDev][qIndex]);
	if(need_ret_tap[inDev][qIndex]){
		fcph.SetTap();
		need_ret_tap[inDev][qIndex] = false;
	}
	else{
		fcph.ResetTap();
	}
	Ptr<Packet> p = Create<Packet> (0);
	p->AddHeader(fcph);
	// std::cout << "Construct FCP at node " << node_id << " port " << inDev << " qIndex " << qIndex <<
	// 			 " fccl " << fccl_ <<
	// 			 " qlen " << ingress_bytes[inDev][qIndex] <<
	// 			 " fccr " << accumu_drained_bytes[inDev][qIndex] <<
	// 			 std::endl;
	return p;
}

bool SwitchMmu::ShouldSendCN(uint32_t ifindex, uint32_t qIndex) {
	if (qIndex == 0)
		return false;
	if (egress_bytes[ifindex][qIndex] > kmax[ifindex])
		return true;
	if (egress_bytes[ifindex][qIndex] > kmin[ifindex]) {
		double p = pmax[ifindex] * double(egress_bytes[ifindex][qIndex] - kmin[ifindex]) / (kmax[ifindex] - kmin[ifindex]);
		if (UniformVariable(0, 1).GetValue() < p)
			return true;
	}
	return false;
}
void SwitchMmu::ConfigEcn(uint32_t port, uint32_t _kmin, uint32_t _kmax, double _pmax) {
	kmin[port] = _kmin * 1000;
	kmax[port] = _kmax * 1000;
	pmax[port] = _pmax;
}

void SwitchMmu::SetBufferPool(uint64_t b) {
	total_buffer = b;
	credit_pool = b;
	// uint32_t per_port_buffer_size = b / pCnt;
	for(int p = 0; p < pCnt; p++){
		// buffer_size[p] = per_port_buffer_size;
		// fccl[p] = buffer_size[p]; 
		granted_credit[p] = 0;
	}
}

void SwitchMmu::SetInflightThreshold(u_int32_t port, uint32_t qIndex, uint32_t threshold){
	inflight_threshold[port][qIndex] = threshold;
}

void SwitchMmu::SetQlenMax(u_int32_t value){
	qlen_max = value;
}

void SwitchMmu::SetQlenMin(u_int32_t value){
	qlen_min = value;
}

uint32_t SwitchMmu::GetAdvertisedFccl(uint32_t port) const
{
    NS_ASSERT(port < pCnt);

    return abr[port]
         - used_bytes[port]
         + granted_credit[port];
}

void SwitchMmu::SetAiStep(u_int32_t value){
	ai_step = value;
}

}
