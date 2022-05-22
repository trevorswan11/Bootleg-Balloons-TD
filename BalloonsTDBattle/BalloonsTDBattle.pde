final int ADD = 0;
final int DELETE = 1;
final int UPGRADE = 2;

Map map;

int MODE = ADD;
int round = 1;

void mouseClicked() {
  println("" + mouseX + ", " + mouseY); 
  color c = map.getImage().get(mouseX, mouseY);
  //println("" + c + " " + red(c) + ", " + blue(c) + ", " + green(c));
  
  //println(map.compass(mouseX, mouseY, mouseX-10, mouseY));
  //println(map.compass(mouseX, mouseY, mouseX, mouseY-10));
}

void keyPressed() {

} 

void setup() {
  size(800,600);
  map = new Map();
    map.calculateDirections(400, 10, 400, 0);
  map.printDirections();
}

void draw() {
  map.displayPath();
  Balloon red = new Balloon("red", 1, 5);
  //red.followMap();
  map.showDirections();
  red.display();

}
