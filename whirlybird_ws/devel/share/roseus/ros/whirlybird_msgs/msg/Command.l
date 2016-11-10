;; Auto-generated. Do not edit!


(when (boundp 'whirlybird_msgs::Command)
  (if (not (find-package "WHIRLYBIRD_MSGS"))
    (make-package "WHIRLYBIRD_MSGS"))
  (shadow 'Command (find-package "WHIRLYBIRD_MSGS")))
(unless (find-package "WHIRLYBIRD_MSGS::COMMAND")
  (make-package "WHIRLYBIRD_MSGS::COMMAND"))

(in-package "ROS")
;;//! \htmlinclude Command.msg.html


(defclass whirlybird_msgs::Command
  :super ros::object
  :slots (_left_motor _right_motor ))

(defmethod whirlybird_msgs::Command
  (:init
   (&key
    ((:left_motor __left_motor) 0.0)
    ((:right_motor __right_motor) 0.0)
    )
   (send-super :init)
   (setq _left_motor (float __left_motor))
   (setq _right_motor (float __right_motor))
   self)
  (:left_motor
   (&optional __left_motor)
   (if __left_motor (setq _left_motor __left_motor)) _left_motor)
  (:right_motor
   (&optional __right_motor)
   (if __right_motor (setq _right_motor __right_motor)) _right_motor)
  (:serialization-length
   ()
   (+
    ;; float32 _left_motor
    4
    ;; float32 _right_motor
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _left_motor
       (sys::poke _left_motor (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _right_motor
       (sys::poke _right_motor (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _left_motor
     (setq _left_motor (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _right_motor
     (setq _right_motor (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get whirlybird_msgs::Command :md5sum-) "3e3717ac8e9443aa62d7102a5860f5e7")
(setf (get whirlybird_msgs::Command :datatype-) "whirlybird_msgs/Command")
(setf (get whirlybird_msgs::Command :definition-)
      "# Whirlybird.msg

float32 left_motor
float32 right_motor

")



(provide :whirlybird_msgs/Command "3e3717ac8e9443aa62d7102a5860f5e7")


