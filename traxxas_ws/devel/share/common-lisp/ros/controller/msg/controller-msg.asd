
(cl:in-package :asdf)

(defsystem "controller-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ControllerOut" :depends-on ("_package_ControllerOut"))
    (:file "_package_ControllerOut" :depends-on ("_package"))
  ))