
(cl:in-package :asdf)

(defsystem "relay-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "RelayState" :depends-on ("_package_RelayState"))
    (:file "_package_RelayState" :depends-on ("_package"))
    (:file "Steer" :depends-on ("_package_Steer"))
    (:file "_package_Steer" :depends-on ("_package"))
  ))