PShape s, sq0;

void setup() {
  size(430, 430);
  s = createShape(GROUP);
  sq0 = createShape(SQUARE, 10, 10, 200);
  sq0.setFill(color(62,221,75));
  s.addChild(sq0);
}


void draw() {
  background(0);
  shape(s);
}
