;; Auto-generated. Do not edit!


(when (boundp 'imu_parser::IMUData)
  (if (not (find-package "IMU_PARSER"))
    (make-package "IMU_PARSER"))
  (shadow 'IMUData (find-package "IMU_PARSER")))
(unless (find-package "IMU_PARSER::IMUDATA")
  (make-package "IMU_PARSER::IMUDATA"))

(in-package "ROS")
;;//! \htmlinclude IMUData.msg.html


(defclass imu_parser::IMUData
  :super ros::object
  :slots (_heading ))

(defmethod imu_parser::IMUData
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
    ;; float64 _heading
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _heading
       (sys::poke _heading (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _heading
     (setq _heading (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get imu_parser::IMUData :md5sum-) "9635d0d9f52c085a5bcd934107785851")
(setf (get imu_parser::IMUData :datatype-) "imu_parser/IMUData")
(setf (get imu_parser::IMUData :definition-)
      "float64 heading

")



(provide :imu_parser/IMUData "9635d0d9f52c085a5bcd934107785851")


