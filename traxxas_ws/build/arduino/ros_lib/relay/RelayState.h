#ifndef _ROS_relay_RelayState_h
#define _ROS_relay_RelayState_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace relay
{

  class RelayState : public ros::Msg
  {
    public:
      typedef int8_t _control_mode_type;
      _control_mode_type control_mode;
      typedef bool _is_emergency_type;
      _is_emergency_type is_emergency;

    RelayState():
      control_mode(0),
      is_emergency(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      union {
        int8_t real;
        uint8_t base;
      } u_control_mode;
      u_control_mode.real = this->control_mode;
      *(outbuffer + offset + 0) = (u_control_mode.base >> (8 * 0)) & 0xFF;
      offset += sizeof(this->control_mode);
      union {
        bool real;
        uint8_t base;
      } u_is_emergency;
      u_is_emergency.real = this->is_emergency;
      *(outbuffer + offset + 0) = (u_is_emergency.base >> (8 * 0)) & 0xFF;
      offset += sizeof(this->is_emergency);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      union {
        int8_t real;
        uint8_t base;
      } u_control_mode;
      u_control_mode.base = 0;
      u_control_mode.base |= ((uint8_t) (*(inbuffer + offset + 0))) << (8 * 0);
      this->control_mode = u_control_mode.real;
      offset += sizeof(this->control_mode);
      union {
        bool real;
        uint8_t base;
      } u_is_emergency;
      u_is_emergency.base = 0;
      u_is_emergency.base |= ((uint8_t) (*(inbuffer + offset + 0))) << (8 * 0);
      this->is_emergency = u_is_emergency.real;
      offset += sizeof(this->is_emergency);
     return offset;
    }

    virtual const char * getType() override { return "relay/RelayState"; };
    virtual const char * getMD5() override { return "d728a4fc76a5171e38c2c4900549dece"; };

  };

}
#endif
