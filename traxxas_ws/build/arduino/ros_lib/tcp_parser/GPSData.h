#ifndef _ROS_tcp_parser_GPSData_h
#define _ROS_tcp_parser_GPSData_h

#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include "ros/msg.h"

namespace tcp_parser
{

  class GPSData : public ros::Msg
  {
    public:
      typedef float _latitude_type;
      _latitude_type latitude;
      typedef float _longitude_type;
      _longitude_type longitude;
      typedef float _height_type;
      _height_type height;
      typedef int8_t _fix_type_type;
      _fix_type_type fix_type;
      typedef int16_t _num_satellites_type;
      _num_satellites_type num_satellites;
      typedef float _sdn_type;
      _sdn_type sdn;
      typedef float _sde_type;
      _sde_type sde;
      typedef float _sdu_type;
      _sdu_type sdu;
      typedef float _sdne_type;
      _sdne_type sdne;
      typedef float _sdeu_type;
      _sdeu_type sdeu;
      typedef float _sdun_type;
      _sdun_type sdun;

    GPSData():
      latitude(0),
      longitude(0),
      height(0),
      fix_type(0),
      num_satellites(0),
      sdn(0),
      sde(0),
      sdu(0),
      sdne(0),
      sdeu(0),
      sdun(0)
    {
    }

    virtual int serialize(unsigned char *outbuffer) const override
    {
      int offset = 0;
      offset += serializeAvrFloat64(outbuffer + offset, this->latitude);
      offset += serializeAvrFloat64(outbuffer + offset, this->longitude);
      offset += serializeAvrFloat64(outbuffer + offset, this->height);
      union {
        int8_t real;
        uint8_t base;
      } u_fix_type;
      u_fix_type.real = this->fix_type;
      *(outbuffer + offset + 0) = (u_fix_type.base >> (8 * 0)) & 0xFF;
      offset += sizeof(this->fix_type);
      union {
        int16_t real;
        uint16_t base;
      } u_num_satellites;
      u_num_satellites.real = this->num_satellites;
      *(outbuffer + offset + 0) = (u_num_satellites.base >> (8 * 0)) & 0xFF;
      *(outbuffer + offset + 1) = (u_num_satellites.base >> (8 * 1)) & 0xFF;
      offset += sizeof(this->num_satellites);
      offset += serializeAvrFloat64(outbuffer + offset, this->sdn);
      offset += serializeAvrFloat64(outbuffer + offset, this->sde);
      offset += serializeAvrFloat64(outbuffer + offset, this->sdu);
      offset += serializeAvrFloat64(outbuffer + offset, this->sdne);
      offset += serializeAvrFloat64(outbuffer + offset, this->sdeu);
      offset += serializeAvrFloat64(outbuffer + offset, this->sdun);
      return offset;
    }

    virtual int deserialize(unsigned char *inbuffer) override
    {
      int offset = 0;
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->latitude));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->longitude));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->height));
      union {
        int8_t real;
        uint8_t base;
      } u_fix_type;
      u_fix_type.base = 0;
      u_fix_type.base |= ((uint8_t) (*(inbuffer + offset + 0))) << (8 * 0);
      this->fix_type = u_fix_type.real;
      offset += sizeof(this->fix_type);
      union {
        int16_t real;
        uint16_t base;
      } u_num_satellites;
      u_num_satellites.base = 0;
      u_num_satellites.base |= ((uint16_t) (*(inbuffer + offset + 0))) << (8 * 0);
      u_num_satellites.base |= ((uint16_t) (*(inbuffer + offset + 1))) << (8 * 1);
      this->num_satellites = u_num_satellites.real;
      offset += sizeof(this->num_satellites);
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->sdn));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->sde));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->sdu));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->sdne));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->sdeu));
      offset += deserializeAvrFloat64(inbuffer + offset, &(this->sdun));
     return offset;
    }

    virtual const char * getType() override { return "tcp_parser/GPSData"; };
    virtual const char * getMD5() override { return "86b1eb9857008b5f82c5d04d35566ae5"; };

  };

}
#endif
