
(cl:in-package :asdf)

(defsystem "whirlybird_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Whirlybird" :depends-on ("_package_Whirlybird"))
    (:file "_package_Whirlybird" :depends-on ("_package"))
    (:file "Command" :depends-on ("_package_Command"))
    (:file "_package_Command" :depends-on ("_package"))
    (:file "MyStates" :depends-on ("_package_MyStates"))
    (:file "_package_MyStates" :depends-on ("_package"))
  ))