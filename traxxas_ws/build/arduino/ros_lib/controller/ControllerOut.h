#ifndef _ROS_controller_ControllerOut_h
#define _ROS_controller_ControllerOut_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace controller
{

  class ControllerOut : public ros::Msg
  {
    public:
      typedef int8_t _steer_type;
      _steer_type steer;
      typedef int8_t _speed_type;
      _speed_type speed;

    ControllerOut():
      steer(0),
      speed(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      union {
        int8_t real;
        uint8_t base;
      } u_steer;
      u_steer.real = this->steer;
      *(outbuffer + offset + 0) = (u_steer.base >> (8 * 0)) & 0xFF;
      offset += sizeof(this->steer);
      union {
        int8_t real;
        uint8_t base;
      } u_speed;
      u_speed.real = this->speed;
      *(outbuffer + offset + 0) = (u_speed.base >> (8 * 0)) & 0xFF;
      offset += sizeof(this->speed);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      union {
        int8_t real;
        uint8_t base;
      } u_steer;
      u_steer.base = 0;
      u_steer.base |= ((uint8_t) (*(inbuffer + offset + 0))) << (8 * 0);
      this->steer = u_steer.real;
      offset += sizeof(this->steer);
      union {
        int8_t real;
        uint8_t base;
      } u_speed;
      u_speed.base = 0;
      u_speed.base |= ((uint8_t) (*(inbuffer + offset + 0))) << (8 * 0);
      this->speed = u_speed.real;
      offset += sizeof(this->speed);
     return offset;
    }

    virtual const char * getType() override { return "controller/ControllerOut"; };
    virtual const char * getMD5() override { return "9fdd80fb67c06e0f36269df15172b228"; };

  };

}
#endif
