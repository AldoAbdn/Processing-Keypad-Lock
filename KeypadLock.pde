/*****************************************************
 * Filename    : KeypadLock
 * Description : Keypad Entry Lock
 * authors     : www.freenove.com, Alistair Quinn
 * modification: 23/01/2021
 *****************************************************/
import processing.io.*;

final static char[]  keys = {  //key code
  '1', '2', '3', 'A', 
  '4', '5', '6', 'B', 
  '7', '8', '9', 'C', 
  '*', '0', '#', 'D'  };
final int[] rowsPins = {18, 23, 24, 25};  //Connect to the row pinouts of the keypad
final int[] colsPins = {10, 22, 27, 17};  //Connect to the column pinouts of the keypad
Keypad kp = new Keypad(keys, rowsPins, colsPins);    //class Object
Lock lock = new Lock(kp, "A1234");    //class Object
boolean exit = false;
int timer = 0;

void setup() {
  setBackgroundGrey();
  fullScreen();
}

void draw() { 
  lock.process();    //Get key and processing
  if(!lock.fail && !lock.pass){
    setBackgroundGrey();
  }else if(lock.fail){
    setBackgroundRed();
  }else{
    setBackgroundGreen();
    exit = true;
  }
  background(red,green,blue);
  title();  //Tile and site information
  drawDisplay(lock.contentStr);
  if(exit){
   timer++;
  }
  if(timer == 2){
    delay(2000);
    exec("/usr/bin/chromium-browser", "--noerrdialogs", "--disable-infobars", "--kiosk", "localhost:8000"); // Launch Chromium to web app fullscreen, change URL
    exit();
    timer++;
  }
}
