; Auto-generated. Do not edit!


(cl:in-package imu_parser-msg)


;//! \htmlinclude IMURaw.msg.html

(cl:defclass <IMURaw> (roslisp-msg-protocol:ros-message)
  ((heading
    :reader heading
    :initarg :heading
    :type cl:float
    :initform 0.0))
)

(cl:defclass IMURaw (<IMURaw>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <IMURaw>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'IMURaw)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name imu_parser-msg:<IMURaw> is deprecated: use imu_parser-msg:IMURaw instead.")))

(cl:ensure-generic-function 'heading-val :lambda-list '(m))
(cl:defmethod heading-val ((m <IMURaw>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader imu_parser-msg:heading-val is deprecated.  Use imu_parser-msg:heading instead.")
  (heading m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <IMURaw>) ostream)
  "Serializes a message object of type '<IMURaw>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'heading))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <IMURaw>) istream)
  "Deserializes a message object of type '<IMURaw>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'heading) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<IMURaw>)))
  "Returns string type for a message object of type '<IMURaw>"
  "imu_parser/IMURaw")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'IMURaw)))
  "Returns string type for a message object of type 'IMURaw"
  "imu_parser/IMURaw")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<IMURaw>)))
  "Returns md5sum for a message object of type '<IMURaw>"
  "22eeef76ab4645786a2d92bcfbc4c574")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'IMURaw)))
  "Returns md5sum for a message object of type 'IMURaw"
  "22eeef76ab4645786a2d92bcfbc4c574")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<IMURaw>)))
  "Returns full string definition for message of type '<IMURaw>"
  (cl:format cl:nil "float32 heading~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'IMURaw)))
  "Returns full string definition for message of type 'IMURaw"
  (cl:format cl:nil "float32 heading~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <IMURaw>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <IMURaw>))
  "Converts a ROS message object to a list"
  (cl:list 'IMURaw
    (cl:cons ':heading (heading msg))
))
