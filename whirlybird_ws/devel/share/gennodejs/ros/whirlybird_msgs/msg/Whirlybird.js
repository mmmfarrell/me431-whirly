// Auto-generated. Do not edit!

// (in-package whirlybird_msgs.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');

//-----------------------------------------------------------

class Whirlybird {
  constructor() {
    this.roll = 0.0;
    this.pitch = 0.0;
    this.yaw = 0.0;
    this.accel_x = 0.0;
    this.accel_y = 0.0;
    this.accel_z = 0.0;
    this.gyro_x = 0.0;
    this.gyro_y = 0.0;
    this.gyro_z = 0.0;
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type Whirlybird
    // Serialize message field [roll]
    bufferInfo = _serializer.float32(obj.roll, bufferInfo);
    // Serialize message field [pitch]
    bufferInfo = _serializer.float32(obj.pitch, bufferInfo);
    // Serialize message field [yaw]
    bufferInfo = _serializer.float32(obj.yaw, bufferInfo);
    // Serialize message field [accel_x]
    bufferInfo = _serializer.float32(obj.accel_x, bufferInfo);
    // Serialize message field [accel_y]
    bufferInfo = _serializer.float32(obj.accel_y, bufferInfo);
    // Serialize message field [accel_z]
    bufferInfo = _serializer.float32(obj.accel_z, bufferInfo);
    // Serialize message field [gyro_x]
    bufferInfo = _serializer.float32(obj.gyro_x, bufferInfo);
    // Serialize message field [gyro_y]
    bufferInfo = _serializer.float32(obj.gyro_y, bufferInfo);
    // Serialize message field [gyro_z]
    bufferInfo = _serializer.float32(obj.gyro_z, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type Whirlybird
    let tmp;
    let len;
    let data = new Whirlybird();
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
    // Deserialize message field [accel_x]
    tmp = _deserializer.float32(buffer);
    data.accel_x = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [accel_y]
    tmp = _deserializer.float32(buffer);
    data.accel_y = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [accel_z]
    tmp = _deserializer.float32(buffer);
    data.accel_z = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [gyro_x]
    tmp = _deserializer.float32(buffer);
    data.gyro_x = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [gyro_y]
    tmp = _deserializer.float32(buffer);
    data.gyro_y = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [gyro_z]
    tmp = _deserializer.float32(buffer);
    data.gyro_z = tmp.data;
    buffer = tmp.buffer;
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'whirlybird_msgs/Whirlybird';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a058255bc42da20a874152da8fe20c12';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Whirlybird.msg
    
    float32 roll
    float32 pitch
    float32 yaw
    
    float32 accel_x
    float32 accel_y
    float32 accel_z
    
    float32 gyro_x
    float32 gyro_y
    float32 gyro_z
    
    `;
  }

};

module.exports = Whirlybird;
