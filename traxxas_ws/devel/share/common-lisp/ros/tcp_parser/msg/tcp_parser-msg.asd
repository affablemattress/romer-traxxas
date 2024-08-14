
(cl:in-package :asdf)

(defsystem "tcp_parser-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "GPSData" :depends-on ("_package_GPSData"))
    (:file "_package_GPSData" :depends-on ("_package"))
  ))