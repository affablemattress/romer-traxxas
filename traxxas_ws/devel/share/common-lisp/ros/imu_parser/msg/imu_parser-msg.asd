
(cl:in-package :asdf)

(defsystem "imu_parser-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "IMUData" :depends-on ("_package_IMUData"))
    (:file "_package_IMUData" :depends-on ("_package"))
    (:file "IMURaw" :depends-on ("_package_IMURaw"))
    (:file "_package_IMURaw" :depends-on ("_package"))
  ))