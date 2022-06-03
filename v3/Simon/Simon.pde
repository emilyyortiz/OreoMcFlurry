//TNPG: Oreo McFlurry (Emily Ortiz, Jing Yi Feng)

// Button class modified from Ruff Comandos
class Button {
  
 // these coordinates define the top left corner of the button
 float _cornerX, _cornerY; 
 
 // define where the rectangular button ends
 float _width, _height;
 
 // defines the color of the button
 color cDarker, cLighter;
 
 //c is color currently displayed
 color c;

 
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
  c = cDarker;
 } // end constructor
 
 
 // function does what the buttons function is
 void execute() {
   //
   //c = cLighter;
   display(cLighter);
   //delay(1000);
   //display(cDarker);
   println("hi");
   //delay(1000);
 } // end execute
 
 
 // displays the button
 void display(color cc) {
   fill(cc);
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
 
}// end class

// Simon code
color D0 = color(36, 112, 42);
color L0 = color(62, 221, 75);

boolean playingState = true; //true is playing, false is displaying 

Button sq00 = new Button(10, 10, 200, 200, D0, L0);

PShape s, sq0;

void setup(){
  size(430, 430);
  background(0);
  //s = createShape(GROUP);
  //sq0 = createShape(RECT, 10, 10, 200, 200);
  //sq0.setFill(color(36, 112, 42));
  //s.addChild(sq0);
 // sq00.display(D0);
}

void draw(){
  //shape(s);
  sq00.display(D0);
}

void mouseClicked(){
  //if (sq00.isInButton()){
  //  sq00.display(L0);
  //  boolean lala = true;
  //  int m = millis();
  //  while (lala){
  //    if (m >= 1000){
  //    sq00.display(D0);
  //      lala = false;  
  //  }
  //  }
  }
  
//boolean timer(int milisecs){
//  case
    
    //frameRate(1);
    //sq00.display(D0);
  }
}
