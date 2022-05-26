PShape s, sq0, sq1, sq2, sq3;
color color0;

void setup() {
  size(430, 430);
  s = createShape(GROUP);
  
  sq0 = createShape(RECT, 10, 10, 200, 200);
  color0 = color(36, 112, 42);
  sq0.setFill(color(36, 112, 42));
  s.addChild(sq0);
  
  sq1 = createShape(RECT, 220, 10, 200, 200);
  sq1.setFill(color(112, 42, 36));
  s.addChild(sq1);
  
  sq2 = createShape(RECT, 10, 220, 200, 200);
  sq2.setFill(color(161, 148, 37));
  s.addChild(sq2);
  
  sq3 = createShape(RECT, 220, 220, 200, 200);
  sq3.setFill(color(41, 34, 120));
  s.addChild(sq3);
}


void draw() {
  background(0);
  sq0.fill(color0);
  shape(s);

}

void mouseClicked(){
  //sq0 or sq1
  if ( (mouseY > 10) && (mouseY < 210) ){
    //sq0
    if ( (mouseX > 10) && (mouseY < 210) ){
      //lightUp(0);
      //n = 0;
      color0 = 0;
    }
    //sq1
    if ( (mouseX > 220) && (mouseY < 420) ){
      //lightUp(1);
    }
  }
   
  //sq 2 or 3
  if (mouseY > 220 && mouseY < 420){
    //sq2
    if ( (mouseX > 10) && (mouseY < 210) ){
      //lightUp(2);
    }
    //sq3
    if ( (mouseX > 220) && (mouseY < 420) ){
      //lightUp(3);
    }
  }
}

void lightUp(int n){
  if(n == 0){
    color0 = 0;
    background(123, 123, 123);
    //delay(1000);
  }
}
