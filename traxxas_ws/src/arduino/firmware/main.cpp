#define NDEV

#define FOWD_PIN 6   //MOTOR ESC
#define STER_PIN 9   //STEERING SERVO
#define GEAR_PIN 11  //WEIRD SERVO

#define ESC_MIN   1100
#define ESC_MAX   1900
#define STEER_MIN 1100
#define STEER_MAX 1900
#define GEAR_MIN  1100
#define GEAR_MAX  1900

#define TAKE_OFF_SPEED 26
#define MAX_SPEED      50

#define LEAN_CORRECTION -25

#ifdef DEV
    #define ARDUINO 100 //resolve include error caused by Wprogram.h
    #include "arduino/ros_lib/ros.h"
    #include "arduino/ros_lib/relay/Steer.h"
    #include "arduino/ros_lib/imu_parser/IMURaw.h"
#else
    #include "ros.h"
    #include "relay/Steer.h"
    #include "imu_parser/IMURaw.h"
#endif

#include "Arduino.h"
#include <Servo.h>
#include "Adafruit_Sensor.h"
#include "Adafruit_BNO055.h"

#ifdef DEV
    extern HardwareSerial Serial; //resolve pre-processor 'error' by defining Serial manually
#endif

//message definitions
imu_parser::IMURaw imu_raw_msg;
void steerCallback(const relay::Steer& steer);

//node definition
ros::NodeHandle node;
ros::Subscriber<relay::Steer> steer_sub("steer", &steerCallback);
ros::Publisher imu_raw_pub("imu_raw", &imu_raw_msg);

//servo related definitons
Servo servo_esc;
Servo servo_steer;
Servo servo_gear;

void driveESC(const int8_t ESCSpeed);
void driveSteer(const int8_t steerAngle);
void driveGear(const int8_t gearPos);

struct ServoStates {
    uint32_t send_time; //set send time to 0 on input receive

    int8_t esc_speed;   //INT8_MIN ~ INT8_MAX
    int8_t steer_angle; //INT8_MIN ~ INT8_MAX
    int8_t gear_pos;    //0 ~ 1
} static servo_states = { .send_time = 0, .esc_speed = 0, .steer_angle = 0, .gear_pos = 1 };

//bno related definitions
Adafruit_BNO055 bno = Adafruit_BNO055(55, 0x28);

struct BNOState {
    uint32_t recv_time; //set recv time to 0 on input receive

    float roll;         //-180.0 ~ 180.0
    float yaw;          //0.0 ~ 360.0
    float pitch;        //-90.0 ~ 90.0

    int32_t calibration_quality;
} static bno_state = { .recv_time = 0, .roll = 0.0, .yaw = 0.0, .pitch = 0.0 };

void setup() {
    pinMode(FOWD_PIN, OUTPUT);
    pinMode(STER_PIN, OUTPUT);
    pinMode(GEAR_PIN, OUTPUT);

    servo_esc.attach(FOWD_PIN, ESC_MIN, ESC_MAX);   //1000 REVERSE FULL THROTTLE, 1500 NEUTRAL, 2000 FULL THROTTLE
    servo_steer.attach(STER_PIN, STEER_MIN, STEER_MAX); //1000 STEER_MIN DEGREES LEFT             , 2000 STEER_MAX DEGREES RIGHT
    servo_gear.attach(GEAR_PIN, GEAR_MIN, GEAR_MAX);  //1000 FULL OUT                           , 2000 FULL IN

    //bring all servos to neutral
    servo_esc.writeMicroseconds((ESC_MIN + ESC_MAX) / 2);
    servo_steer.writeMicroseconds((STEER_MIN + STEER_MAX) / 2);
    servo_gear.writeMicroseconds(GEAR_MIN);

    //init ros node
    Serial.begin(57600);
    node.getHardware()->setBaud(57600);
    node.initNode();
    node.subscribe(steer_sub);
    node.advertise(imu_raw_pub);

    //init bno
    bno.begin();
    bno.setMode(OPERATION_MODE_NDOF);
    delay(1000);
    bno.setExtCrystalUse(1);
}

void loop() {
    uint32_t current_time = millis();

    if((current_time - servo_states.send_time) > 23) {
        driveESC(servo_states.esc_speed);
        driveSteer(servo_states.steer_angle);

        servo_states.send_time = millis();
    }

    if((current_time - bno_state.recv_time) > 53) {
        sensors_event_t bno_event;
        bno.getEvent(&bno_event, Adafruit_BNO055::adafruit_vector_type_t::VECTOR_EULER);

        if(bno_state.roll != bno_event.orientation.z || bno_state.yaw != bno_event.orientation.x || bno_state.pitch != bno_event.orientation.y) {
            //update the buffer and send msg if any of the values have changed
            bno_state.roll    = bno_event.orientation.z;
            bno_state.yaw     = bno_event.orientation.x; //left handed
            bno_state.pitch   = bno_event.orientation.y;

            imu_raw_msg.roll  = bno_state.roll;
            imu_raw_msg.yaw   = bno_state.yaw;
            imu_raw_msg.pitch = bno_state.pitch;
            imu_raw_pub.publish(&imu_raw_msg);
        }
        bno_state.recv_time = millis();
    }

    static uint32_t calibration_recv_time = 0;
    if((current_time - calibration_recv_time) > 211) {
        uint8_t sys, gyro, accel, mag;
        bno.getCalibration(&sys, &gyro, &accel, &mag);

        bno_state.calibration_quality = sys;
        calibration_recv_time = millis();
    }

    node.spinOnce();
    delay(13);
}

void steerCallback(const relay::Steer& steer) {
    servo_states.esc_speed   = steer.speed;
    servo_states.steer_angle = steer.steer;

    servo_states.send_time   = 0;
}

void driveESC(const int8_t ESC_speed) {
    int8_t clamped_speed;

    //clamp speed to areas where esc does not stall and the speed is managable
    if(ESC_speed == 0) clamped_speed = 0;
    else if(ESC_speed < 0) clamped_speed = map(ESC_speed, -128, -1, -MAX_SPEED, -TAKE_OFF_SPEED);
    else clamped_speed = map(ESC_speed, 1, 128, TAKE_OFF_SPEED, MAX_SPEED);

    int16_t period = map(clamped_speed, -128, 127, ESC_MIN, ESC_MAX);
    servo_esc.writeMicroseconds(period);
}

void driveSteer(const int8_t steer_angle) {
    int16_t period = map(steer_angle, -128, 127, STEER_MIN, STEER_MAX);
    period += LEAN_CORRECTION; //fix right lean?
    servo_steer.writeMicroseconds(period);
}

void driveGear(const int8_t gearPos) {
    int16_t period = (gearPos == 1) ? GEAR_MIN : GEAR_MAX;
    servo_gear.writeMicroseconds(period);
}
