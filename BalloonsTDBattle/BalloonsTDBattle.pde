final int ADD = 0;
final int DELETE = 1;
final int UPGRADE = 2;

PImage map;

int MODE = ADD;
int round = 1;

void mouseClicked() {
  text("" + mouseX + ", " + mouseY, 20, 20);   
}

void setup() {
  size(1000,1000);
  map = loadImage("snow_map.jpg");
}

void draw() {
  image(map, 0, 0);
}
