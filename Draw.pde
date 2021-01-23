/*****************************************************
 * Filename    : Draw
 * Description : Functions to Draw Components
 * authors     : www.freenove.com, Alistair Quinn
 * modification: 23/01/2021
 *****************************************************/

void title() {
  fill(0);
  textAlign(CENTER);    //set the text centered
  textSize(40);        //set text size
  text("Enter Passcode", width/2, height/2 - 100);    //title
}

void drawDisplay(String content) {
  stroke(0);
  strokeWeight(4);
  fill(255);
  rect(0, height/2, width, 50);  //Display area
  fill(0);  
  textSize(40);
  textAlign(CENTER);
  text(content, width/2, height/2+40);  //Display content
}
