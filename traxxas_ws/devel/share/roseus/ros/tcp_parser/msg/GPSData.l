;; Auto-generated. Do not edit!


(when (boundp 'tcp_parser::GPSData)
  (if (not (find-package "TCP_PARSER"))
    (make-package "TCP_PARSER"))
  (shadow 'GPSData (find-package "TCP_PARSER")))
(unless (find-package "TCP_PARSER::GPSDATA")
  (make-package "TCP_PARSER::GPSDATA"))

(in-package "ROS")
;;//! \htmlinclude GPSData.msg.html


(defclass tcp_parser::GPSData
  :super ros::object
  :slots (_latitude _longitude _height _fix_type _num_satellites _sdn _sde _sdu _sdne _sdeu _sdun ))

(defmethod tcp_parser::GPSData
  (:init
   (&key
    ((:latitude __latitude) 0.0)
    ((:longitude __longitude) 0.0)
    ((:height __height) 0.0)
    ((:fix_type __fix_type) 0)
    ((:num_satellites __num_satellites) 0)
    ((:sdn __sdn) 0.0)
    ((:sde __sde) 0.0)
    ((:sdu __sdu) 0.0)
    ((:sdne __sdne) 0.0)
    ((:sdeu __sdeu) 0.0)
    ((:sdun __sdun) 0.0)
    )
   (send-super :init)
   (setq _latitude (float __latitude))
   (setq _longitude (float __longitude))
   (setq _height (float __height))
   (setq _fix_type (round __fix_type))
   (setq _num_satellites (round __num_satellites))
   (setq _sdn (float __sdn))
   (setq _sde (float __sde))
   (setq _sdu (float __sdu))
   (setq _sdne (float __sdne))
   (setq _sdeu (float __sdeu))
   (setq _sdun (float __sdun))
   self)
  (:latitude
   (&optional __latitude)
   (if __latitude (setq _latitude __latitude)) _latitude)
  (:longitude
   (&optional __longitude)
   (if __longitude (setq _longitude __longitude)) _longitude)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:fix_type
   (&optional __fix_type)
   (if __fix_type (setq _fix_type __fix_type)) _fix_type)
  (:num_satellites
   (&optional __num_satellites)
   (if __num_satellites (setq _num_satellites __num_satellites)) _num_satellites)
  (:sdn
   (&optional __sdn)
   (if __sdn (setq _sdn __sdn)) _sdn)
  (:sde
   (&optional __sde)
   (if __sde (setq _sde __sde)) _sde)
  (:sdu
   (&optional __sdu)
   (if __sdu (setq _sdu __sdu)) _sdu)
  (:sdne
   (&optional __sdne)
   (if __sdne (setq _sdne __sdne)) _sdne)
  (:sdeu
   (&optional __sdeu)
   (if __sdeu (setq _sdeu __sdeu)) _sdeu)
  (:sdun
   (&optional __sdun)
   (if __sdun (setq _sdun __sdun)) _sdun)
  (:serialization-length
   ()
   (+
    ;; float64 _latitude
    8
    ;; float64 _longitude
    8
    ;; float64 _height
    8
    ;; int8 _fix_type
    1
    ;; int16 _num_satellites
    2
    ;; float64 _sdn
    8
    ;; float64 _sde
    8
    ;; float64 _sdu
    8
    ;; float64 _sdne
    8
    ;; float64 _sdeu
    8
    ;; float64 _sdun
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _latitude
       (sys::poke _latitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _longitude
       (sys::poke _longitude (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _height
       (sys::poke _height (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; int8 _fix_type
       (write-byte _fix_type s)
     ;; int16 _num_satellites
       (write-word _num_satellites s)
     ;; float64 _sdn
       (sys::poke _sdn (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _sde
       (sys::poke _sde (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _sdu
       (sys::poke _sdu (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _sdne
       (sys::poke _sdne (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _sdeu
       (sys::poke _sdeu (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _sdun
       (sys::poke _sdun (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _latitude
     (setq _latitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _longitude
     (setq _longitude (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _height
     (setq _height (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; int8 _fix_type
     (setq _fix_type (sys::peek buf ptr- :char)) (incf ptr- 1)
     (if (> _fix_type 127) (setq _fix_type (- _fix_type 256)))
   ;; int16 _num_satellites
     (setq _num_satellites (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;; float64 _sdn
     (setq _sdn (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _sde
     (setq _sde (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _sdu
     (setq _sdu (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _sdne
     (setq _sdne (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _sdeu
     (setq _sdeu (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _sdun
     (setq _sdun (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get tcp_parser::GPSData :md5sum-) "86b1eb9857008b5f82c5d04d35566ae5")
(setf (get tcp_parser::GPSData :datatype-) "tcp_parser/GPSData")
(setf (get tcp_parser::GPSData :definition-)
      "float64 latitude
float64 longitude
float64 height

#1=fix; 2=float; 3=sbas; 4=dgps; 5=single; 6=ppp
int8 fix_type
int16 num_satellites

float64 sdn
float64 sde
float64 sdu
float64 sdne
float64 sdeu
float64 sdun
")



(provide :tcp_parser/GPSData "86b1eb9857008b5f82c5d04d35566ae5")


