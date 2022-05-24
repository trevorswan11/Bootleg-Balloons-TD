final int ADD = 0;
final int DELETE = 1;
final int UPGRADE = 2;

Map map;
Balloon balloon;

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
  map.calculateDirections(410,10,410,0);
  map.printDirections();
  balloon = new Balloon();
  
}

void draw() {
  map.displayPath();
  //map.display();
  balloon.display();
  map.showDirections();
  //balloon.move();
  balloon.followMap();
  balloon.changeX(5);
}
