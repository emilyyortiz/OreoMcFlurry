//TNPG: Oreo McFlurry (Emily Ortiz, Jing Yi Feng)

// Credit to Ruff Comandos

class Button {
  
 // these coordinates define the top left corner of the button
 float _cornerX, _cornerY; 
 
 // define where the rectangular button ends
 float _width, _height;
 
 // defines the color of the button
 color cDarker;
 
 color cLighter;
 
 //c is color currently displayed
 color c;
 
 // defines whats inside the button
 
 
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
   // in this case the function is to randomly change the buttons color
   //c = cLighter;
   display(cLighter);
   frameRate(1);
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


color D0 = color(36, 112, 42);
color L0 = color(62, 221, 75);
boolean playingState = true;
//true is playing, false is displaying 

Button sq0 = new Button(10, 10, 200, 200, D0, L0);
void setup(){
  size(430, 430);
  sq0.display(D0); 
  background(0);
}

void draw(){
  sq0.display(D0);
  frameRate(60);
}

void mouseClicked(){
  if (sq0.isInButton()){
    sq0.execute();
  }
  //sq0.c = sq0.cDarker;
}
