final int ADD = 0;
final int DELETE = 1;
final int UPGRADE = 2;

Map map;

int MODE = ADD;
int round = 1;

void mouseClicked() {
  println("" + mouseX + ", " + mouseY); 
  color c = map.getImage().get(mouseX, mouseY);
}

void keyPressed() {

} 

void setup() {
  size(800,600);
  map = new Map();
}

void draw() {
  map.displayPath();
  map.display();
  Balloon red = new Balloon("red", 1, 5);
  red.display();
}
