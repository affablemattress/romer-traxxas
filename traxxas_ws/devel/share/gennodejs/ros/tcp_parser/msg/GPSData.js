// Auto-generated. Do not edit!

// (in-package tcp_parser.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class GPSData {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.latitude = null;
      this.longitude = null;
      this.height = null;
      this.fix_type = null;
      this.num_satellites = null;
      this.sdn = null;
      this.sde = null;
      this.sdu = null;
      this.sdne = null;
      this.sdeu = null;
      this.sdun = null;
    }
    else {
      if (initObj.hasOwnProperty('latitude')) {
        this.latitude = initObj.latitude
      }
      else {
        this.latitude = 0.0;
      }
      if (initObj.hasOwnProperty('longitude')) {
        this.longitude = initObj.longitude
      }
      else {
        this.longitude = 0.0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0.0;
      }
      if (initObj.hasOwnProperty('fix_type')) {
        this.fix_type = initObj.fix_type
      }
      else {
        this.fix_type = 0;
      }
      if (initObj.hasOwnProperty('num_satellites')) {
        this.num_satellites = initObj.num_satellites
      }
      else {
        this.num_satellites = 0;
      }
      if (initObj.hasOwnProperty('sdn')) {
        this.sdn = initObj.sdn
      }
      else {
        this.sdn = 0.0;
      }
      if (initObj.hasOwnProperty('sde')) {
        this.sde = initObj.sde
      }
      else {
        this.sde = 0.0;
      }
      if (initObj.hasOwnProperty('sdu')) {
        this.sdu = initObj.sdu
      }
      else {
        this.sdu = 0.0;
      }
      if (initObj.hasOwnProperty('sdne')) {
        this.sdne = initObj.sdne
      }
      else {
        this.sdne = 0.0;
      }
      if (initObj.hasOwnProperty('sdeu')) {
        this.sdeu = initObj.sdeu
      }
      else {
        this.sdeu = 0.0;
      }
      if (initObj.hasOwnProperty('sdun')) {
        this.sdun = initObj.sdun
      }
      else {
        this.sdun = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GPSData
    // Serialize message field [latitude]
    bufferOffset = _serializer.float64(obj.latitude, buffer, bufferOffset);
    // Serialize message field [longitude]
    bufferOffset = _serializer.float64(obj.longitude, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.float64(obj.height, buffer, bufferOffset);
    // Serialize message field [fix_type]
    bufferOffset = _serializer.int8(obj.fix_type, buffer, bufferOffset);
    // Serialize message field [num_satellites]
    bufferOffset = _serializer.int16(obj.num_satellites, buffer, bufferOffset);
    // Serialize message field [sdn]
    bufferOffset = _serializer.float64(obj.sdn, buffer, bufferOffset);
    // Serialize message field [sde]
    bufferOffset = _serializer.float64(obj.sde, buffer, bufferOffset);
    // Serialize message field [sdu]
    bufferOffset = _serializer.float64(obj.sdu, buffer, bufferOffset);
    // Serialize message field [sdne]
    bufferOffset = _serializer.float64(obj.sdne, buffer, bufferOffset);
    // Serialize message field [sdeu]
    bufferOffset = _serializer.float64(obj.sdeu, buffer, bufferOffset);
    // Serialize message field [sdun]
    bufferOffset = _serializer.float64(obj.sdun, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GPSData
    let len;
    let data = new GPSData(null);
    // Deserialize message field [latitude]
    data.latitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [longitude]
    data.longitude = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [fix_type]
    data.fix_type = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [num_satellites]
    data.num_satellites = _deserializer.int16(buffer, bufferOffset);
    // Deserialize message field [sdn]
    data.sdn = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [sde]
    data.sde = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [sdu]
    data.sdu = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [sdne]
    data.sdne = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [sdeu]
    data.sdeu = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [sdun]
    data.sdun = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 75;
  }

  static datatype() {
    // Returns string type for a message object
    return 'tcp_parser/GPSData';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '86b1eb9857008b5f82c5d04d35566ae5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 latitude
    float64 longitude
    float64 height
    
    #1=fix; 2=float; 3=sbas; 4=dgps; 5=single; 6=ppp
    int8 fix_type
    int16 num_satellites
    
    float64 sdn
    float64 sde
    float64 sdu
    float64 sdne
    float64 sdeu
    float64 sdun
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GPSData(null);
    if (msg.latitude !== undefined) {
      resolved.latitude = msg.latitude;
    }
    else {
      resolved.latitude = 0.0
    }

    if (msg.longitude !== undefined) {
      resolved.longitude = msg.longitude;
    }
    else {
      resolved.longitude = 0.0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0.0
    }

    if (msg.fix_type !== undefined) {
      resolved.fix_type = msg.fix_type;
    }
    else {
      resolved.fix_type = 0
    }

    if (msg.num_satellites !== undefined) {
      resolved.num_satellites = msg.num_satellites;
    }
    else {
      resolved.num_satellites = 0
    }

    if (msg.sdn !== undefined) {
      resolved.sdn = msg.sdn;
    }
    else {
      resolved.sdn = 0.0
    }

    if (msg.sde !== undefined) {
      resolved.sde = msg.sde;
    }
    else {
      resolved.sde = 0.0
    }

    if (msg.sdu !== undefined) {
      resolved.sdu = msg.sdu;
    }
    else {
      resolved.sdu = 0.0
    }

    if (msg.sdne !== undefined) {
      resolved.sdne = msg.sdne;
    }
    else {
      resolved.sdne = 0.0
    }

    if (msg.sdeu !== undefined) {
      resolved.sdeu = msg.sdeu;
    }
    else {
      resolved.sdeu = 0.0
    }

    if (msg.sdun !== undefined) {
      resolved.sdun = msg.sdun;
    }
    else {
      resolved.sdun = 0.0
    }

    return resolved;
    }
};

module.exports = GPSData;
