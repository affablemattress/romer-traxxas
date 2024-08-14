;; Auto-generated. Do not edit!


(when (boundp 'controller::ControllerOut)
  (if (not (find-package "CONTROLLER"))
    (make-package "CONTROLLER"))
  (shadow 'ControllerOut (find-package "CONTROLLER")))
(unless (find-package "CONTROLLER::CONTROLLEROUT")
  (make-package "CONTROLLER::CONTROLLEROUT"))

(in-package "ROS")
;;//! \htmlinclude ControllerOut.msg.html


(defclass controller::ControllerOut
  :super ros::object
  :slots (_steer _speed ))

(defmethod controller::ControllerOut
  (:init
   (&key
    ((:steer __steer) 0)
    ((:speed __speed) 0)
    )
   (send-super :init)
   (setq _steer (round __steer))
   (setq _speed (round __speed))
   self)
  (:steer
   (&optional __steer)
   (if __steer (setq _steer __steer)) _steer)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:serialization-length
   ()
   (+
    ;; int8 _steer
    1
    ;; int8 _speed
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int8 _steer
       (write-byte _steer s)
     ;; int8 _speed
       (write-byte _speed s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int8 _steer
     (setq _steer (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _steer 127) (setq _steer (- _steer 256)))
   ;; int8 _speed
     (setq _speed (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _speed 127) (setq _speed (- _speed 256)))
   ;;
   self)
  )

(setf (get controller::ControllerOut :md5sum-) "9fdd80fb67c06e0f36269df15172b228")
(setf (get controller::ControllerOut :datatype-) "controller/ControllerOut")
(setf (get controller::ControllerOut :definition-)
      "int8 steer
int8 speed
")



(provide :controller/ControllerOut "9fdd80fb67c06e0f36269df15172b228")


