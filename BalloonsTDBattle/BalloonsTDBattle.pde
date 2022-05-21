final int ADD = 0;
final int DELETE = 1;
final int UPGRADE = 2;

PImage map;

int MODE = ADD;
int round = 1;

void mouseClicked() {
  println("" + mouseX + ", " + mouseY); 
}

void setup() {
  size(775,572);
  map = loadImage("snow_map.jpg");
}

void draw() {
  image(map, 0, 0);
  Balloon red = new Balloon();
  red.display();
}
