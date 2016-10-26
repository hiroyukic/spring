
#include <Keyboard.h>

  #include "Mouse.h"
  
  const int ButtonBlack1 = 2;  // 左１ボタン→PWM[2]
    const int ButtonRed2 = 3;    // 左２ボタン→PWM[3]
  const int ButtonGreen3 = 4;  // 右２ボタン→PWM[4]
  const int ButtonBlue4 = 5;   // 右１ボタン→PWM[5]
  
  const int LED = 13;
  char ctrlKey = KEY_LEFT_GUI;

  
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
    
    Keyboard.begin();
  }
  
  
  void loop() {




   if (digitalRead(ButtonBlack1) == LOW ) {

     Keyboard.write(KEY_RETURN);
     //Keyboard.press(KEY_RETURN);

     digitalWrite(13, HIGH);
     delay(100); 
     digitalWrite(13, LOW);
   }
    
  
}
