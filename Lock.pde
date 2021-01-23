/*****************************************************
 * Filename    : Lock
 * Description : class Lock
 * authors     : www.freenove.com, Alistair Quinn
 * modification: 23/01/2021
 *****************************************************/
import java.math.BigDecimal;
class Lock {
  
  boolean pass = false;
  boolean fail = false;
  Keypad keypad;
  String contentStr = "";    //Display string
  char kkey = ' ';    //the key value
  String passcode = "";
  
  public Lock(Keypad kp, String pc) {
    keypad = kp;
    passcode = pc;
  }
  
  public void process() {
    kkey = kp.getKey();
    if (kkey != keypad.NO_KEY) {    //if there is a key is pressed   
      if(contentStr.equals("PASSCODE INCORRECT")){
         contentStr = "";
         pass = false;
         fail = false;
      }
      if ((kkey > 0x2F)&&(kkey < 0x3A)||(kkey == 'A') || (kkey == 'B')||(kkey == 'C')||(kkey == 'D')||(kkey == '*')) {   
          contentStr+=kkey;
      } else if (kkey == '#') {  //if the key code is "="
          if(contentStr.equals(passcode)){
            contentStr = "PASSCODE CORRECT";
            pass = true;
            fail = false;
          }else{
            contentStr = "PASSCODE INCORRECT";
            pass = false;
            fail = true;
          }
      }
    }   
  }
}
