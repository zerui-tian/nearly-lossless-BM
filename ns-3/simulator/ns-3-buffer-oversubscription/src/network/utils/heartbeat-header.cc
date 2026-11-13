#include "heartbeat-header.h"
#include "ns3/log.h"

NS_LOG_COMPONENT_DEFINE("HeartbeatHeader");

namespace ns3 {

NS_OBJECT_ENSURE_REGISTERED(HeartbeatHeader);

HeartbeatHeader::HeartbeatHeader()
    : m_hasRecycled(false),
      m_parkedCredit(0),
      m_fccl(0)
{
}

HeartbeatHeader::~HeartbeatHeader() = default;

TypeId HeartbeatHeader::GetTypeId()
{
    static TypeId tid = TypeId("ns3::HeartbeatHeader")
        .SetParent<Header>()
        .AddConstructor<HeartbeatHeader>();

    return tid;
}

TypeId HeartbeatHeader::GetInstanceTypeId() const
{
    return GetTypeId();
}

void HeartbeatHeader::SetHasRecycled(bool hasRecycled)
{
    m_hasRecycled = hasRecycled;
}

bool HeartbeatHeader::GetHasRecycled() const
{
    return m_hasRecycled;
}

void HeartbeatHeader::SetCredit(uint32_t credit)
{
    m_parkedCredit = credit;
}

uint32_t HeartbeatHeader::GetCredit() const
{
    return m_parkedCredit;
}

void HeartbeatHeader::SetFccl(uint32_t fccl)
{
    m_fccl = fccl;
}

uint32_t HeartbeatHeader::GetFccl() const
{
    return m_fccl;
}

void HeartbeatHeader::Print(std::ostream& os) const
{
    os << "hasRecycled=" << m_hasRecycled
       << " parkedCredit=" << m_parkedCredit
       << " fccl=" << m_fccl;
}

uint32_t HeartbeatHeader::GetHeaderSize()
{
    return 1 + 4 + 4;
}

uint32_t HeartbeatHeader::GetSerializedSize() const
{
    return GetHeaderSize();
}

void HeartbeatHeader::Serialize(Buffer::Iterator start) const
{
    // 只使用 bit 0，其余位写 0。
    start.WriteU8(m_hasRecycled ? 0x01 : 0x00);
    start.WriteHtonU32(m_parkedCredit);
    start.WriteHtonU32(m_fccl);
}

uint32_t HeartbeatHeader::Deserialize(Buffer::Iterator start)
{
    m_hasRecycled = (start.ReadU8() & 0x01) != 0;
    m_parkedCredit = start.ReadNtohU32();
    m_fccl = start.ReadNtohU32();

    return GetSerializedSize();
}

} // namespace ns3