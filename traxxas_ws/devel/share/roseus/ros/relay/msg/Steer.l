;; Auto-generated. Do not edit!


(when (boundp 'relay::Steer)
  (if (not (find-package "RELAY"))
    (make-package "RELAY"))
  (shadow 'Steer (find-package "RELAY")))
(unless (find-package "RELAY::STEER")
  (make-package "RELAY::STEER"))

(in-package "ROS")
;;//! \htmlinclude Steer.msg.html


(defclass relay::Steer
  :super ros::object
  :slots (_steer _speed ))

(defmethod relay::Steer
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

(setf (get relay::Steer :md5sum-) "9fdd80fb67c06e0f36269df15172b228")
(setf (get relay::Steer :datatype-) "relay/Steer")
(setf (get relay::Steer :definition-)
      "int8 steer
int8 speed
")



(provide :relay/Steer "9fdd80fb67c06e0f36269df15172b228")


