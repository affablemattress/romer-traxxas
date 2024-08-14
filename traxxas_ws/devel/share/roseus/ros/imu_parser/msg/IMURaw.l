;; Auto-generated. Do not edit!


(when (boundp 'imu_parser::IMURaw)
  (if (not (find-package "IMU_PARSER"))
    (make-package "IMU_PARSER"))
  (shadow 'IMURaw (find-package "IMU_PARSER")))
(unless (find-package "IMU_PARSER::IMURAW")
  (make-package "IMU_PARSER::IMURAW"))

(in-package "ROS")
;;//! \htmlinclude IMURaw.msg.html


(defclass imu_parser::IMURaw
  :super ros::object
  :slots (_heading ))

(defmethod imu_parser::IMURaw
  (:init
   (&key
    ((:heading __heading) 0.0)
    )
   (send-super :init)
   (setq _heading (float __heading))
   self)
  (:heading
   (&optional __heading)
   (if __heading (setq _heading __heading)) _heading)
  (:serialization-length
   ()
   (+
    ;; float32 _heading
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _heading
       (sys::poke _heading (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _heading
     (setq _heading (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get imu_parser::IMURaw :md5sum-) "22eeef76ab4645786a2d92bcfbc4c574")
(setf (get imu_parser::IMURaw :datatype-) "imu_parser/IMURaw")
(setf (get imu_parser::IMURaw :definition-)
      "float32 heading
")



(provide :imu_parser/IMURaw "22eeef76ab4645786a2d92bcfbc4c574")


