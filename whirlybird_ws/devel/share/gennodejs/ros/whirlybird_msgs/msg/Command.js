// Auto-generated. Do not edit!

// (in-package whirlybird_msgs.msg)


"use strict";

let _serializer = require('../base_serialize.js');
let _deserializer = require('../base_deserialize.js');
let _finder = require('../find.js');

//-----------------------------------------------------------

class Command {
  constructor() {
    this.left_motor = 0.0;
    this.right_motor = 0.0;
  }

  static serialize(obj, bufferInfo) {
    // Serializes a message object of type Command
    // Serialize message field [left_motor]
    bufferInfo = _serializer.float32(obj.left_motor, bufferInfo);
    // Serialize message field [right_motor]
    bufferInfo = _serializer.float32(obj.right_motor, bufferInfo);
    return bufferInfo;
  }

  static deserialize(buffer) {
    //deserializes a message object of type Command
    let tmp;
    let len;
    let data = new Command();
    // Deserialize message field [left_motor]
    tmp = _deserializer.float32(buffer);
    data.left_motor = tmp.data;
    buffer = tmp.buffer;
    // Deserialize message field [right_motor]
    tmp = _deserializer.float32(buffer);
    data.right_motor = tmp.data;
    buffer = tmp.buffer;
    return {
      data: data,
      buffer: buffer
    }
  }

  static datatype() {
    // Returns string type for a message object
    return 'whirlybird_msgs/Command';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3e3717ac8e9443aa62d7102a5860f5e7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Whirlybird.msg
    
    float32 left_motor
    float32 right_motor
    
    `;
  }

};

module.exports = Command;
