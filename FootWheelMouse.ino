
/*
  ButtonMouseControl

 For Leonardo and Due boards only.

 Controls the mouse from five pushbuttons on an Arduino Leonardo, Micro or Due.

 Hardware:
 * 5 pushbuttons attached to D2, D3, D4, D5, D6


 The mouse movement is always relative. This sketch reads
 four pushbuttons, and uses them to set the movement of the mouse.

 WARNING:  When you use the Mouse.move() command, the Arduino takes
 over your mouse!  Make sure you have control before you use the mouse commands.

 created 15 Mar 2012
 modified 27 Mar 2012
 by Tom Igoe

 this code is in the public domain

 */

#include "Mouse.h"

const int ButtonBlack1 = 2;  // 左１ボタン→PWM[2]
const int ButtonRed2 = 3;    // 左２ボタン→PWM[3]
const int ButtonGreen3 = 4;  // 右２ボタン→PWM[4]
const int ButtonBlue4 = 5;   // 右１ボタン→PWM[5]

const int LED = 13;

//int range = 5;              // output range of X or Y movement; affects movement speed
//int responseDelay200 = 200;     // response delay of the mouse, in ms
//int responseDelay100 = 150;  

int responseDelay1 = 200;     // response delay of the mouse, in ms
int responseDelay2 = 150;  
int responseDelay3 = 150;  
int responseDelay4 = 200;  

void setup() {
  //Serial.begin(9600); //シリアル通信速度（Serial.println 使用時）
  // input
  pinMode(ButtonBlack1, INPUT); 
  pinMode(ButtonRed2, INPUT); 
  pinMode(ButtonGreen3, INPUT); 
  pinMode(ButtonBlue4, INPUT); 
  
  // output(LED)
  pinMode(13, OUTPUT);
  
  // initialize mouse control:
  Mouse.begin();
}


void loop() {
 
  
//  int clickState = digitalRead(ButtonBlue4);

/*
 if (digitalRead(ButtonBlack1) == LOW || digitalRead(ButtonRed2) == LOW || digitalRead(ButtonGreen3) == LOW || digitalRead(ButtonBlue4) == LOW) {
      //delay(10);
      // SW_OFF 
      //if (digitalRead(ButtonBlue4) == LOW) {
        digitalWrite(13, LOW);    // LED 消灯 
        responseDelay100 = 100;
        responseDelay200 = 200;
 }

*/
        
  /* ========================================== */
  /* ButtonBlack1 左１ */
  /* ========================================== */
  if (digitalRead(ButtonBlack1) == LOW) {
      digitalWrite(13, LOW);    // LED 消灯 
      responseDelay1 = 200;
  } else 
  if (digitalRead(ButtonBlack1) == HIGH) {
      delay(5);
      /* 遅延速度コントロール　*/
      responseDelay1 = responseDelay1 -5;
      if(responseDelay1 < 100) {
        responseDelay1 = 100;
      }
      
      //Serial.println( responseDelay1 );
      
      if (digitalRead(ButtonBlack1) == HIGH) {
        /* SW_ON */
        digitalWrite(13, HIGH);   // LED 点灯 
        Mouse.move(0,0,1);        // Page UP 
        delay(responseDelay1);  /* Mouse動作遅延 */
      }
  }

  /* ========================================== */
  /* ButtonRed2 左２*/
  /* ========================================== */
  if (digitalRead(ButtonRed2) == LOW) {
      responseDelay2 = 120;
      digitalWrite(13, LOW);    // LED 消灯 
  } else 
  if (digitalRead(ButtonRed2) == HIGH) {
      delay(5);
      if (digitalRead(ButtonRed2) == HIGH) {
        /* 遅延速度コントロール　*/
        responseDelay2 = responseDelay2 - 5;
        if(responseDelay2 < 40) {
          responseDelay2 = 40;
        }
        /* SW_ON */
        digitalWrite(13, HIGH);   // LED 点灯 
        Mouse.move(0,0,1);        // Page UP 
        delay(responseDelay2);  /* Mouse動作遅延 */
      }
  }

  /* ========================================== */
  /* ButtonGreen3 右２*/
  /* ========================================== */
  if (digitalRead(ButtonGreen3) == LOW) {
    responseDelay3 = 120;
    digitalWrite(13, LOW);    // LED 消灯 
  } else
  if (digitalRead(ButtonGreen3) == HIGH) {
      delay(5);
      //Serial.println( responseDelay3 );
      if (digitalRead(ButtonGreen3) == HIGH) {
        /* 遅延速度コントロール　*/
        responseDelay3 = responseDelay3 - 5;
        if(responseDelay3 < 40) {
          responseDelay3 = 40;
        }
        /* SW_ON */
        digitalWrite(13, HIGH);   // LED 点灯 
        Mouse.move(0,0,-1);        // Page UP 
        delay(responseDelay3);  /* Mouse動作遅延 */
      }
  }

  /* ========================================== */
  /* 6 : ButtonBlue4 右１*/
  /* ========================================== */
  if (digitalRead(ButtonBlue4) == LOW) {
      digitalWrite(13, LOW);    // LED 消灯 
      responseDelay4 = 200;
  } else 
  if (digitalRead(ButtonBlue4) == HIGH) {
      delay(5);
      if (digitalRead(ButtonBlue4) == HIGH) {
        /* 遅延速度コントロール　*/
        responseDelay4 = responseDelay4 - 5;
        if(responseDelay4 < 40) {
          responseDelay4 = 40;
        }
        /* SW_ON */
        digitalWrite(13, HIGH);   // LED 点灯 
        Mouse.move(0,0,-1);        // Page UP 
        delay(responseDelay4);  /* Mouse動作遅延 */
      }
  }

}
