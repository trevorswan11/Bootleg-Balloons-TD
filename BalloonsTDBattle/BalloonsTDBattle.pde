final int ADD = 0;
final int DELETE = 1;
final int UPGRADE = 2;

Map map;
Balloon balloon;

boolean roundStart = false;
int MODE = ADD;
int round = 1;

void mouseClicked() {
  println("" + mouseX + ", " + mouseY); 
}

void keyPressed() {
    
} 

void setup() {
  size(800,600);
  map = new Map();
  map.printDirections();
  balloon = new Balloon();
}

void draw() {
  map.display();
  balloon.display();
  balloon.followMap();
}
