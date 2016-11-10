;; Auto-generated. Do not edit!


(when (boundp 'whirlybird_msgs::MyStates)
  (if (not (find-package "WHIRLYBIRD_MSGS"))
    (make-package "WHIRLYBIRD_MSGS"))
  (shadow 'MyStates (find-package "WHIRLYBIRD_MSGS")))
(unless (find-package "WHIRLYBIRD_MSGS::MYSTATES")
  (make-package "WHIRLYBIRD_MSGS::MYSTATES"))

(in-package "ROS")
;;//! \htmlinclude MyStates.msg.html


(defclass whirlybird_msgs::MyStates
  :super ros::object
  :slots (_roll _pitch _yaw _roll_d _pitch_d _yaw_d _Force _Tau ))

(defmethod whirlybird_msgs::MyStates
  (:init
   (&key
    ((:roll __roll) 0.0)
    ((:pitch __pitch) 0.0)
    ((:yaw __yaw) 0.0)
    ((:roll_d __roll_d) 0.0)
    ((:pitch_d __pitch_d) 0.0)
    ((:yaw_d __yaw_d) 0.0)
    ((:Force __Force) 0.0)
    ((:Tau __Tau) 0.0)
    )
   (send-super :init)
   (setq _roll (float __roll))
   (setq _pitch (float __pitch))
   (setq _yaw (float __yaw))
   (setq _roll_d (float __roll_d))
   (setq _pitch_d (float __pitch_d))
   (setq _yaw_d (float __yaw_d))
   (setq _Force (float __Force))
   (setq _Tau (float __Tau))
   self)
  (:roll
   (&optional __roll)
   (if __roll (setq _roll __roll)) _roll)
  (:pitch
   (&optional __pitch)
   (if __pitch (setq _pitch __pitch)) _pitch)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:roll_d
   (&optional __roll_d)
   (if __roll_d (setq _roll_d __roll_d)) _roll_d)
  (:pitch_d
   (&optional __pitch_d)
   (if __pitch_d (setq _pitch_d __pitch_d)) _pitch_d)
  (:yaw_d
   (&optional __yaw_d)
   (if __yaw_d (setq _yaw_d __yaw_d)) _yaw_d)
  (:Force
   (&optional __Force)
   (if __Force (setq _Force __Force)) _Force)
  (:Tau
   (&optional __Tau)
   (if __Tau (setq _Tau __Tau)) _Tau)
  (:serialization-length
   ()
   (+
    ;; float32 _roll
    4
    ;; float32 _pitch
    4
    ;; float32 _yaw
    4
    ;; float32 _roll_d
    4
    ;; float32 _pitch_d
    4
    ;; float32 _yaw_d
    4
    ;; float32 _Force
    4
    ;; float32 _Tau
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _roll
       (sys::poke _roll (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pitch
       (sys::poke _pitch (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _roll_d
       (sys::poke _roll_d (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _pitch_d
       (sys::poke _pitch_d (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _yaw_d
       (sys::poke _yaw_d (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Force
       (sys::poke _Force (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _Tau
       (sys::poke _Tau (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _roll
     (setq _roll (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pitch
     (setq _pitch (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _roll_d
     (setq _roll_d (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _pitch_d
     (setq _pitch_d (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _yaw_d
     (setq _yaw_d (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Force
     (setq _Force (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _Tau
     (setq _Tau (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get whirlybird_msgs::MyStates :md5sum-) "f79d089f0886dd740744563939a637fd")
(setf (get whirlybird_msgs::MyStates :datatype-) "whirlybird_msgs/MyStates")
(setf (get whirlybird_msgs::MyStates :definition-)
      "# Whirlybird.msg

float32 roll
float32 pitch
float32 yaw

float32 roll_d
float32 pitch_d
float32 yaw_d

float32 Force
float32 Tau

")



(provide :whirlybird_msgs/MyStates "f79d089f0886dd740744563939a637fd")


