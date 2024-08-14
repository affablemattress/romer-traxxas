#define NDEV

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

#ifdef DEV
    extern HardwareSerial Serial; //resolve pre-processor 'error' by defining Serial manually
#endif

#define FOWD_PIN 6   //MOTOR ESC
#define STER_PIN 9   //STEERING SERVO
#define GEAR_PIN 11  //WEIRD SERVO

//ros message definitions
imu_parser::IMURaw imu_raw_msg;
void steerCallback(const relay::Steer& steer);

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
} static servo_states = { .send_time = 0, .esc_speed = 0, .steer_angle = 0, .gear_pos= 1 };

void setup() {
    pinMode(FOWD_PIN, OUTPUT);
    pinMode(STER_PIN, OUTPUT);
    pinMode(GEAR_PIN, OUTPUT);

    servo_esc.attach(FOWD_PIN, 1000, 3000);   //1000 REVERSE FULL THROTTLE, 2000 NEUTRAL, 3000 FULL THROTTLE
    servo_steer.attach(STER_PIN, 1000, 2000); //1000 STEER_MIN DEGREES LEFT             , 2000 STEER_MAX DEGREES RIGHT
    servo_gear.attach(GEAR_PIN, 1000, 2000);  //1000 FULL OUT                           , 2000 FULL IN

    //bring all servos to neutral
    servo_esc.writeMicroseconds(1500);
    servo_steer.writeMicroseconds(1500);
    servo_gear.writeMicroseconds(2000);

    //init ros node
    node.initNode();
    node.advertise(imu_raw_pub);
    node.subscribe(steer_sub);
}

void loop() {
    uint32_t current_time = millis();

    if((current_time - servo_states.send_time) > 100) {
        driveESC(servo_states.esc_speed);
        driveSteer(servo_states.steer_angle);

        servo_states.send_time = millis();
    }

    node.spinOnce();
    delay(5);
}

void steerCallback(const relay::Steer& steer) {
    servo_states.esc_speed   = steer.speed;
    servo_states.steer_angle = steer.steer;

    servo_states.send_time   = 0;
}

void driveESC(const int8_t ESCSpeed) {
  const uint16_t fullReversePeriod = 1000;
  static const uint16_t neutralPeriod     = 1500;
  static const uint16_t fullForwardPeriod = 2000;

  int16_t period = map(ESCSpeed, -128, 127, fullReversePeriod, fullForwardPeriod);
  servo_esc.writeMicroseconds(period);
}

void driveSteer(const int8_t steerAngle) {
  static const uint16_t fullLeftPeriod  = 1100;
  static const uint16_t fullRightPeriod = 1900;

  int16_t period = map(steerAngle, -128, 127, fullLeftPeriod, fullRightPeriod);
  servo_steer.writeMicroseconds(period);
}

void driveGear(const int8_t gearPos) {
  static const uint16_t fullOutPeriod = 1000;
  static const uint16_t fullInPeriod  = 2000;

  int16_t period = (gearPos == 1) ? fullInPeriod : fullOutPeriod;
  servo_gear.writeMicroseconds(period);
}