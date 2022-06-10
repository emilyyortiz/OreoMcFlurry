//TNPG: Oreo McFlurry (Emily Ortiz, Jing Yi Feng)

import java.util.Iterator;
import java.util.ArrayList;
import java.lang.Thread;

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
 
 
 // function does what the buttons function is
 void execute() {
   // in this case the function is to make the button a lighter color ("flash")
   currentColor = cLighter;
   render();
 } // end execute
 
 // function shut off the button
 void shutOff() {
   currentColor = cDarker;
   render();
 }
 
  void render() {
    display(currentColor);
  }
 
 // displays the button
 void display(color c) {
   fill(c);
   rect(_cornerX,_cornerY,_width,_height);
   //fill(cDarker);
   //rect(_cornerX,_cornerY,_width,_height);
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
boolean playingState = true; //true is playing, false is displaying 

// buttons
Button sq0 = new Button(10, 10, 200, 200, D0, L0);
Button sq1 = new Button(220, 10, 200, 200, D1, L1);
Button sq2 = new Button(10, 220, 200, 200, D2, L2);
Button sq3 = new Button(220, 220, 200, 200, D3, L3);

// pattern
ArrayList<Integer> pattern = new ArrayList<Integer>();
Iterator<Integer> sqrIterator;
int timer = millis();

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
  int currentTime = millis();
  if (currentTime - timer >= 2000) {
    timer = currentTime;
    renderRound();
  }
  if (currentTime - timer >= 1000) {
    resetSqrs();
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
    return;
  }
  lightUp(currentSqr);
}

void resetSqrs() {
  shutOff(0);
  shutOff(1);
  shutOff(2);
  shutOff(3);
}

void mouseClicked(){
  if (sq0.isInButton() ){
    sq0.execute();
  }
  else if (sq1.isInButton()) {
    sq1.execute();
  }
  else if (sq2.isInButton()) {
    sq2.execute();
  }
  else if (sq3.isInButton()) {
    sq3.execute();
  }
}

void lightUp(int sqr){
  if (sqr == 0){
    sq0.execute();
  }
  else if (sqr == 1) {
    sq1.execute();
  }
  else if (sqr == 2) {
    sq2.execute();
  }
  else if (sqr == 3) {
    sq3.execute();
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
