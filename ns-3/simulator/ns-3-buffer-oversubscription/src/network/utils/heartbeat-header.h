#ifndef HEARTBEAT_HEADER_H
#define HEARTBEAT_HEADER_H

#include "ns3/header.h"
#include <cstdint>

namespace ns3 {

class HeartbeatHeader : public Header
{
public:
    HeartbeatHeader();
    ~HeartbeatHeader() override;

    static TypeId GetTypeId();
    TypeId GetInstanceTypeId() const override;

    void SetHasRecycled(bool hasRecycled);
    bool GetHasRecycled() const;

    void SetCredit(uint32_t credit);
    uint32_t GetCredit() const;

    void SetFccl(uint32_t fccl);
    uint32_t GetFccl() const;

    void Print(std::ostream& os) const override;

    static uint32_t GetHeaderSize();
    uint32_t GetSerializedSize() const override;

    void Serialize(Buffer::Iterator start) const override;
    uint32_t Deserialize(Buffer::Iterator start) override;

private:
    bool m_hasRecycled;
    uint32_t m_parkedCredit;
    uint32_t m_fccl;
};

} // namespace ns3

#endif /* HEARTBEAT_HEADER_H */