; Auto-generated. Do not edit!


(cl:in-package controller-msg)


;//! \htmlinclude ControllerOut.msg.html

(cl:defclass <ControllerOut> (roslisp-msg-protocol:ros-message)
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

(cl:defclass ControllerOut (<ControllerOut>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ControllerOut>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ControllerOut)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name controller-msg:<ControllerOut> is deprecated: use controller-msg:ControllerOut instead.")))

(cl:ensure-generic-function 'steer-val :lambda-list '(m))
(cl:defmethod steer-val ((m <ControllerOut>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controller-msg:steer-val is deprecated.  Use controller-msg:steer instead.")
  (steer m))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <ControllerOut>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader controller-msg:speed-val is deprecated.  Use controller-msg:speed instead.")
  (speed m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ControllerOut>) ostream)
  "Serializes a message object of type '<ControllerOut>"
  (cl:let* ((signed (cl:slot-value msg 'steer)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ControllerOut>) istream)
  "Deserializes a message object of type '<ControllerOut>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'steer) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speed) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ControllerOut>)))
  "Returns string type for a message object of type '<ControllerOut>"
  "controller/ControllerOut")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ControllerOut)))
  "Returns string type for a message object of type 'ControllerOut"
  "controller/ControllerOut")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ControllerOut>)))
  "Returns md5sum for a message object of type '<ControllerOut>"
  "9fdd80fb67c06e0f36269df15172b228")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ControllerOut)))
  "Returns md5sum for a message object of type 'ControllerOut"
  "9fdd80fb67c06e0f36269df15172b228")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ControllerOut>)))
  "Returns full string definition for message of type '<ControllerOut>"
  (cl:format cl:nil "int8 steer~%int8 speed~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ControllerOut)))
  "Returns full string definition for message of type 'ControllerOut"
  (cl:format cl:nil "int8 steer~%int8 speed~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ControllerOut>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ControllerOut>))
  "Converts a ROS message object to a list"
  (cl:list 'ControllerOut
    (cl:cons ':steer (steer msg))
    (cl:cons ':speed (speed msg))
))
