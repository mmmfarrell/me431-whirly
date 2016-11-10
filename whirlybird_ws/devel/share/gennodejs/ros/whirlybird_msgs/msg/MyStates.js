// Auto-generated. Do not edit!

// (in-package whirlybird_msgs.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');

//-----------------------------------------------------------

class MyStates {
  constructor() {
    this.roll = 0.0;
    this.pitch = 0.0;
    this.yaw = 0.0;
    this.roll_d = 0.0;
    this.pitch_d = 0.0;
    this.yaw_d = 0.0;
    this.Force = 0.0;
    this.Tau = 0.0;
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type MyStates
    // Serialize message field [roll]
    bufferInfo = _serializer.float32(obj.roll, bufferInfo);
    // Serialize message field [pitch]
    bufferInfo = _serializer.float32(obj.pitch, bufferInfo);
    // Serialize message field [yaw]
    bufferInfo = _serializer.float32(obj.yaw, bufferInfo);
    // Serialize message field [roll_d]
    bufferInfo = _serializer.float32(obj.roll_d, bufferInfo);
    // Serialize message field [pitch_d]
    bufferInfo = _serializer.float32(obj.pitch_d, bufferInfo);
    // Serialize message field [yaw_d]
    bufferInfo = _serializer.float32(obj.yaw_d, bufferInfo);
    // Serialize message field [Force]
    bufferInfo = _serializer.float32(obj.Force, bufferInfo);
    // Serialize message field [Tau]
    bufferInfo = _serializer.float32(obj.Tau, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type MyStates
    let tmp;
    let len;
    let data = new MyStates();
    // Deserialize message field [roll]
    tmp = _deserializer.float32(buffer);
    data.roll = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [pitch]
    tmp = _deserializer.float32(buffer);
    data.pitch = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [yaw]
    tmp = _deserializer.float32(buffer);
    data.yaw = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [roll_d]
    tmp = _deserializer.float32(buffer);
    data.roll_d = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [pitch_d]
    tmp = _deserializer.float32(buffer);
    data.pitch_d = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [yaw_d]
    tmp = _deserializer.float32(buffer);
    data.yaw_d = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [Force]
    tmp = _deserializer.float32(buffer);
    data.Force = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [Tau]
    tmp = _deserializer.float32(buffer);
    data.Tau = tmp.data;
    buffer = tmp.buffer;
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'whirlybird_msgs/MyStates';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f79d089f0886dd740744563939a637fd';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Whirlybird.msg
    
    float32 roll
    float32 pitch
    float32 yaw
    
    float32 roll_d
    float32 pitch_d
    float32 yaw_d
    
    float32 Force
    float32 Tau
    
    `;
  }

};

module.exports = MyStates;
