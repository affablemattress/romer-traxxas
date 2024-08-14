; Auto-generated. Do not edit!


(cl:in-package relay-msg)


;//! \htmlinclude Steer.msg.html

(cl:defclass <Steer> (roslisp-msg-protocol:ros-message)
  ((steer
    :reader steer
    :initarg :steer
    :type cl:fixnum
    :initform 0)
   (speed
    :reader speed
    :initarg :speed
    :type cl:fixnum
    :initform 0))
)

(cl:defclass Steer (<Steer>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Steer>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Steer)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name relay-msg:<Steer> is deprecated: use relay-msg:Steer instead.")))

(cl:ensure-generic-function 'steer-val :lambda-list '(m))
(cl:defmethod steer-val ((m <Steer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader relay-msg:steer-val is deprecated.  Use relay-msg:steer instead.")
  (steer m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <Steer>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader relay-msg:speed-val is deprecated.  Use relay-msg:speed instead.")
  (speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Steer>) ostream)
  "Serializes a message object of type '<Steer>"
  (cl:let* ((signed (cl:slot-value msg 'steer)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Steer>) istream)
  "Deserializes a message object of type '<Steer>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'steer) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speed) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Steer>)))
  "Returns string type for a message object of type '<Steer>"
  "relay/Steer")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Steer)))
  "Returns string type for a message object of type 'Steer"
  "relay/Steer")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Steer>)))
  "Returns md5sum for a message object of type '<Steer>"
  "9fdd80fb67c06e0f36269df15172b228")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Steer)))
  "Returns md5sum for a message object of type 'Steer"
  "9fdd80fb67c06e0f36269df15172b228")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Steer>)))
  "Returns full string definition for message of type '<Steer>"
  (cl:format cl:nil "int8 steer~%int8 speed~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Steer)))
  "Returns full string definition for message of type 'Steer"
  (cl:format cl:nil "int8 steer~%int8 speed~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Steer>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Steer>))
  "Converts a ROS message object to a list"
  (cl:list 'Steer
    (cl:cons ':steer (steer msg))
    (cl:cons ':speed (speed msg))
))
