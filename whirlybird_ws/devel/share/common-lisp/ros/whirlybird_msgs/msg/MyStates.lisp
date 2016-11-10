; Auto-generated. Do not edit!


(cl:in-package whirlybird_msgs-msg)


;//! \htmlinclude MyStates.msg.html

(cl:defclass <MyStates> (roslisp-msg-protocol:ros-message)
  ((roll
    :reader roll
    :initarg :roll
    :type cl:float
    :initform 0.0)
   (pitch
    :reader pitch
    :initarg :pitch
    :type cl:float
    :initform 0.0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0)
   (roll_d
    :reader roll_d
    :initarg :roll_d
    :type cl:float
    :initform 0.0)
   (pitch_d
    :reader pitch_d
    :initarg :pitch_d
    :type cl:float
    :initform 0.0)
   (yaw_d
    :reader yaw_d
    :initarg :yaw_d
    :type cl:float
    :initform 0.0)
   (Force
    :reader Force
    :initarg :Force
    :type cl:float
    :initform 0.0)
   (Tau
    :reader Tau
    :initarg :Tau
    :type cl:float
    :initform 0.0))
)

(cl:defclass MyStates (<MyStates>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MyStates>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MyStates)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name whirlybird_msgs-msg:<MyStates> is deprecated: use whirlybird_msgs-msg:MyStates instead.")))

(cl:ensure-generic-function 'roll-val :lambda-list '(m))
(cl:defmethod roll-val ((m <MyStates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whirlybird_msgs-msg:roll-val is deprecated.  Use whirlybird_msgs-msg:roll instead.")
  (roll m))

(cl:ensure-generic-function 'pitch-val :lambda-list '(m))
(cl:defmethod pitch-val ((m <MyStates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whirlybird_msgs-msg:pitch-val is deprecated.  Use whirlybird_msgs-msg:pitch instead.")
  (pitch m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <MyStates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whirlybird_msgs-msg:yaw-val is deprecated.  Use whirlybird_msgs-msg:yaw instead.")
  (yaw m))

(cl:ensure-generic-function 'roll_d-val :lambda-list '(m))
(cl:defmethod roll_d-val ((m <MyStates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whirlybird_msgs-msg:roll_d-val is deprecated.  Use whirlybird_msgs-msg:roll_d instead.")
  (roll_d m))

(cl:ensure-generic-function 'pitch_d-val :lambda-list '(m))
(cl:defmethod pitch_d-val ((m <MyStates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whirlybird_msgs-msg:pitch_d-val is deprecated.  Use whirlybird_msgs-msg:pitch_d instead.")
  (pitch_d m))

(cl:ensure-generic-function 'yaw_d-val :lambda-list '(m))
(cl:defmethod yaw_d-val ((m <MyStates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whirlybird_msgs-msg:yaw_d-val is deprecated.  Use whirlybird_msgs-msg:yaw_d instead.")
  (yaw_d m))

(cl:ensure-generic-function 'Force-val :lambda-list '(m))
(cl:defmethod Force-val ((m <MyStates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whirlybird_msgs-msg:Force-val is deprecated.  Use whirlybird_msgs-msg:Force instead.")
  (Force m))

(cl:ensure-generic-function 'Tau-val :lambda-list '(m))
(cl:defmethod Tau-val ((m <MyStates>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader whirlybird_msgs-msg:Tau-val is deprecated.  Use whirlybird_msgs-msg:Tau instead.")
  (Tau m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MyStates>) ostream)
  "Serializes a message object of type '<MyStates>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'roll))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'roll_d))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'pitch_d))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw_d))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Force))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'Tau))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MyStates>) istream)
  "Deserializes a message object of type '<MyStates>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'roll) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'roll_d) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'pitch_d) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw_d) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Force) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'Tau) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MyStates>)))
  "Returns string type for a message object of type '<MyStates>"
  "whirlybird_msgs/MyStates")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MyStates)))
  "Returns string type for a message object of type 'MyStates"
  "whirlybird_msgs/MyStates")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MyStates>)))
  "Returns md5sum for a message object of type '<MyStates>"
  "f79d089f0886dd740744563939a637fd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MyStates)))
  "Returns md5sum for a message object of type 'MyStates"
  "f79d089f0886dd740744563939a637fd")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MyStates>)))
  "Returns full string definition for message of type '<MyStates>"
  (cl:format cl:nil "# Whirlybird.msg~%~%float32 roll~%float32 pitch~%float32 yaw~%~%float32 roll_d~%float32 pitch_d~%float32 yaw_d~%~%float32 Force~%float32 Tau~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MyStates)))
  "Returns full string definition for message of type 'MyStates"
  (cl:format cl:nil "# Whirlybird.msg~%~%float32 roll~%float32 pitch~%float32 yaw~%~%float32 roll_d~%float32 pitch_d~%float32 yaw_d~%~%float32 Force~%float32 Tau~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MyStates>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MyStates>))
  "Converts a ROS message object to a list"
  (cl:list 'MyStates
    (cl:cons ':roll (roll msg))
    (cl:cons ':pitch (pitch msg))
    (cl:cons ':yaw (yaw msg))
    (cl:cons ':roll_d (roll_d msg))
    (cl:cons ':pitch_d (pitch_d msg))
    (cl:cons ':yaw_d (yaw_d msg))
    (cl:cons ':Force (Force msg))
    (cl:cons ':Tau (Tau msg))
))
