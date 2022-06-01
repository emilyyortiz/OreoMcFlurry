//TNPG: Oreo McFlurry (Emily Ortiz, Jing Yi Feng)



// Credit to Ruff Comandos

class Button {
  
 // these coordinates define the top left corner of the button
 float _cornerX, _cornerY; 
 
 // define where the rectangular button ends
 float _width, _height;
 
 // defines the color of the button
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
 Button(float x, float y, float wid, float high, color col) {
  this(x,y,wid,high);
  c = col;
 } // end constructor
 
 
 // function does what the buttons function is
 void execute() {
   // in this case the function is to randomly change the buttons color
   c = color(random(255),random(255),random(255));
 } // end execute
 
 boolean mouseClicked(){
   return true;
 }
 
 // displays the button
 void display() {
   fill(c);
   rect(_cornerX,_cornerY,_width,_height);
   
   if (mouseClicked() && isInButton()) {
     execute();
   }
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



Button sq0 = new Button(10, 10, 200, 200);
void setup(){
  size(430, 430);
  sq0.display(); 
}

void draw(){
  sq0.display();
}
//PShape s, sq0, sq1, sq2, sq3;

//void setup() {
//  size(430, 430);
//  s = createShape(GROUP);

//  sq0 = createShape(RECT, 10, 10, 200, 200);
//  sq0.setFill(color(36, 112, 42));
//  s.addChild(sq0);

//  sq1 = createShape(RECT, 220, 10, 200, 200);
//  sq1.setFill(color(112, 42, 36));
//  s.addChild(sq1);

//  sq2 = createShape(RECT, 10, 220, 200, 200);
//  sq2.setFill(color(161, 148, 37));
//  s.addChild(sq2);

//  sq3 = createShape(RECT, 220, 220, 200, 200);
//  sq3.setFill(color(41, 34, 120));
//  s.addChild(sq3);
//}


//void draw() {
//  background(0);
//  shape(s);
//  delay(5000);
//  sq0.setFill(color(36, 112, 42));
//}

//void mouseClicked(){
//  //sq0 or sq1
//  if ( (mouseY > 10) && (mouseY < 210) ){
//    //sq0
//    if ( (mouseX > 10) && (mouseX < 210) ){
//      lightUp(0);
//    }
//    //sq1
//    if ( (mouseX > 220) && (mouseX < 420) ){
//      lightUp(1);
//    }
//  }

//  //sq 2 or 3
//  if (mouseY > 220 && mouseY < 420){
//    //sq2
//    if ( (mouseX > 10) && (mouseX < 210) ){
//      lightUp(2);
//    }
//    //sq3
//    if ( (mouseX > 220) && (mouseX < 420) ){
//      lightUp(3);
//    }
//  }
//}

//void lightUp(int n){
//  if(n == 0){
//    sq0.setFill(color(62, 221, 75));
//  } else if (n == 1){
//    sq1.setFill(color(221, 75, 62));
//  } else if (n == 2){
//    sq2.setFill(color(255, 234, 55));
//  } else {
//    sq3.setFill(color(75, 62, 221));
//  }

//}
