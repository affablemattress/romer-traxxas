#ifndef _ROS_imu_parser_IMUData_h
#define _ROS_imu_parser_IMUData_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace imu_parser
{

  class IMUData : public ros::Msg
  {
    public:
      typedef float _heading_type;
      _heading_type heading;

    IMUData():
      heading(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      offset += serializeAvrFloat64(outbuffer + offset, this->heading);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->heading));
     return offset;
    }

    virtual const char * getType() override { return "imu_parser/IMUData"; };
    virtual const char * getMD5() override { return "9635d0d9f52c085a5bcd934107785851"; };

  };

}
#endif
