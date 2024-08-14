; Auto-generated. Do not edit!


(cl:in-package relay-msg)


;//! \htmlinclude RelayState.msg.html

(cl:defclass <RelayState> (roslisp-msg-protocol:ros-message)
  ((control_mode
    :reader control_mode
    :initarg :control_mode
    :type cl:fixnum
    :initform 0)
   (is_emergency
    :reader is_emergency
    :initarg :is_emergency
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass RelayState (<RelayState>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RelayState>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RelayState)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name relay-msg:<RelayState> is deprecated: use relay-msg:RelayState instead.")))

(cl:ensure-generic-function 'control_mode-val :lambda-list '(m))
(cl:defmethod control_mode-val ((m <RelayState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader relay-msg:control_mode-val is deprecated.  Use relay-msg:control_mode instead.")
  (control_mode m))

(cl:ensure-generic-function 'is_emergency-val :lambda-list '(m))
(cl:defmethod is_emergency-val ((m <RelayState>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader relay-msg:is_emergency-val is deprecated.  Use relay-msg:is_emergency instead.")
  (is_emergency m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RelayState>) ostream)
  "Serializes a message object of type '<RelayState>"
  (cl:let* ((signed (cl:slot-value msg 'control_mode)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 256) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    )
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_emergency) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RelayState>) istream)
  "Deserializes a message object of type '<RelayState>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'control_mode) (cl:if (cl:< unsigned 128) unsigned (cl:- unsigned 256))))
    (cl:setf (cl:slot-value msg 'is_emergency) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RelayState>)))
  "Returns string type for a message object of type '<RelayState>"
  "relay/RelayState")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RelayState)))
  "Returns string type for a message object of type 'RelayState"
  "relay/RelayState")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RelayState>)))
  "Returns md5sum for a message object of type '<RelayState>"
  "d728a4fc76a5171e38c2c4900549dece")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RelayState)))
  "Returns md5sum for a message object of type 'RelayState"
  "d728a4fc76a5171e38c2c4900549dece")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RelayState>)))
  "Returns full string definition for message of type '<RelayState>"
  (cl:format cl:nil "#0 for manual 1 for auto mode~%int8 control_mode~%bool is_emergency~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RelayState)))
  "Returns full string definition for message of type 'RelayState"
  (cl:format cl:nil "#0 for manual 1 for auto mode~%int8 control_mode~%bool is_emergency~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RelayState>))
  (cl:+ 0
     1
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RelayState>))
  "Converts a ROS message object to a list"
  (cl:list 'RelayState
    (cl:cons ':control_mode (control_mode msg))
    (cl:cons ':is_emergency (is_emergency msg))
))
