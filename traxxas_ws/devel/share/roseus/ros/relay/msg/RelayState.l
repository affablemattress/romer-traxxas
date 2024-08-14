;; Auto-generated. Do not edit!


(when (boundp 'relay::RelayState)
  (if (not (find-package "RELAY"))
    (make-package "RELAY"))
  (shadow 'RelayState (find-package "RELAY")))
(unless (find-package "RELAY::RELAYSTATE")
  (make-package "RELAY::RELAYSTATE"))

(in-package "ROS")
;;//! \htmlinclude RelayState.msg.html


(defclass relay::RelayState
  :super ros::object
  :slots (_control_mode _is_emergency ))

(defmethod relay::RelayState
  (:init
   (&key
    ((:control_mode __control_mode) 0)
    ((:is_emergency __is_emergency) nil)
    )
   (send-super :init)
   (setq _control_mode (round __control_mode))
   (setq _is_emergency __is_emergency)
   self)
  (:control_mode
   (&optional __control_mode)
   (if __control_mode (setq _control_mode __control_mode)) _control_mode)
  (:is_emergency
   (&optional (__is_emergency :null))
   (if (not (eq __is_emergency :null)) (setq _is_emergency __is_emergency)) _is_emergency)
  (:serialization-length
   ()
   (+
    ;; int8 _control_mode
    1
    ;; bool _is_emergency
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _control_mode
       (write-byte _control_mode s)
     ;; bool _is_emergency
       (if _is_emergency (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _control_mode
     (setq _control_mode (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _control_mode 127) (setq _control_mode (- _control_mode 256)))
   ;; bool _is_emergency
     (setq _is_emergency (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get relay::RelayState :md5sum-) "d728a4fc76a5171e38c2c4900549dece")
(setf (get relay::RelayState :datatype-) "relay/RelayState")
(setf (get relay::RelayState :definition-)
      "#0 for manual 1 for auto mode
int8 control_mode
bool is_emergency
")



(provide :relay/RelayState "d728a4fc76a5171e38c2c4900549dece")


