//TNPG: Oreo McFlurry (Emily Ortiz, Jing Yi Feng)

import java.util.Iterator;
import java.util.ArrayList;

// Modified Button Class from Ruff Comandos
class Button {
  
 // these coordinates define the top left corner of the button
 float _cornerX, _cornerY; 
 
 // define where the rectangular button ends
 float _width, _height;
 
 // defines the color of the button
 color cDarker, cLighter;
 
 color currentColor;
 
 
 // overloaded constructor
 Button(float x, float y, float len, float high) {
   _cornerX = x;
   _cornerY = y;
   
   _width = len;
   _height = high;
 } // end constructor
 
 
 // overloaded constructor with color addition
 Button(float x, float y, float wid, float high, color colD, color colL) {
  this(x,y,wid,high);
  cDarker = colD;
  cLighter = colL;
 } // end constructor
 
 // makes button lighter color
 void turnOn() {
   currentColor = cLighter;
   display(currentColor);
 } // end turnOn
 
 // makes button darker color
 void shutOff() {
   currentColor = cDarker;
   display(currentColor);
 } // end shutOff
 
 // displays the button
 void display(color c) {
   fill(c);
   rect(_cornerX,_cornerY,_width,_height);
 }// end draw
 
 
 boolean isInButton() {
  if (mouseX > _cornerX && mouseX < _cornerX + _width) {
    if (mouseY > _cornerY && mouseY < _cornerY + _height) {
      return true;
    }
  }
  return false; 
 } // end isInButton
 
}// end Button class

// colors
color D0 = color(36, 112, 42); // dark green (top left)
color L0 = color(62, 221, 75); // lighter green
color D1 = color(112, 42, 36);
color L1 = color(221, 75, 62);
color D2 = color(161, 148, 37);
color L2 = color(255, 234, 55);
color D3 = color(41, 34, 120);
color L3 = color(75, 62, 221);

// IMPLEMENT LATER
boolean playingState = false; //true is playing, false is displaying 

// buttons
Button sq0 = new Button(10, 10, 200, 200, D0, L0);
Button sq1 = new Button(220, 10, 200, 200, D1, L1);
Button sq2 = new Button(10, 220, 200, 200, D2, L2);
Button sq3 = new Button(220, 220, 200, 200, D3, L3);

// pattern
ArrayList<Integer> pattern = new ArrayList<Integer>();
Iterator<Integer> sqrIterator;
int timer = millis();
int highScore = 0;
Iterator<Integer> userItr;
int currentUserSqr;
boolean playGame = true;

void setup(){
  size(430, 430);
  background(0);
  frameRate(60);
  sq0.display(D0);
  sq1.display(D1);
  sq2.display(D2);
  sq3.display(D3);
}

  
void draw(){
  //frameRate(60);
  if(!playingState){
    int currentTime = millis();
    if (currentTime - timer >= 1000) {
      timer = currentTime;
      renderRound();
    }
    if (currentTime - timer >= 500) { // shuts off squares after 0.5 seconds
      resetSqrs();
    }
  }
}

void renderRound() {
  int currentSqr;
  if (sqrIterator == null) {
    int newVal = (int) (Math.random() * 4);
    pattern.add(newVal);
    println("pattern:" + pattern.toString());
    sqrIterator = pattern.iterator();
    currentSqr = sqrIterator.next();
  } else if (sqrIterator.hasNext()) {
    currentSqr = sqrIterator.next();
  } else {
    sqrIterator = null;
    playingState = true;
    return;
  }
  lightUp(currentSqr);
}

void mouseClicked(){
  // will only do things if in playing state
  println("mouse clicked");
  if (playingState){
    if (userItr == null){
      println("user pattern started");
      userItr = pattern.iterator();
      currentUserSqr = userItr.next();
      println("current square: " + currentUserSqr);
    } else {
      currentUserSqr = userItr.next();
      println("current square: " + currentUserSqr);
    }
 
    if (currentUserSqr == 0 && sq0.isInButton()){
      sq0.turnOn();
      println("sq0 lit up");
    }
    else if (currentUserSqr == 1 && sq1.isInButton()) {
      sq1.turnOn();
      println("sq1 lit up");
    }
    else if (currentUserSqr == 2 && sq2.isInButton()) {
      sq2.turnOn();
      println("sq2 lit up");
    }
    else if (currentUserSqr == 3 && sq3.isInButton()) {
      sq3.turnOn();
      println("sq3 lit up");
    } else {
      gameOver();
   } 

   resetSqrs();
   
   if(!userItr.hasNext()){
      userItr = null;
      playingState = false;
   }
    
  } // end if(playingState)
}//end mouseClicked

void lightUp(int sqr){
  if (sqr == 0){
    sq0.turnOn();
  }
  else if (sqr == 1) {
    sq1.turnOn();
  }
  else if (sqr == 2) {
    sq2.turnOn();
  }
  else if (sqr == 3) {
    sq3.turnOn();
  }
}

void shutOff(int sqr) {
  if (sqr == 0){
    sq0.shutOff();
  }
  else if (sqr == 1) {
    sq1.shutOff();
  }
  else if (sqr == 2) {
    sq2.shutOff();
  }
  else if (sqr == 3) {
    sq3.shutOff();
  }
}

void resetSqrs() {
  shutOff(0);
  shutOff(1);
  shutOff(2);
  shutOff(3);
}

void gameOver(){
  println("game over");
  exit();
}
