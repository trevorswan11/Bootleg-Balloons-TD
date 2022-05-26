final int ADD = 0;
final int DELETE = 1;
final int UPGRADE = 2;
MonkeyList monkeys = new MonkeyList();
Monkey m;
//Change image display by loading in the setup so you only have to set up once

Map map;
Balloon balloon;

boolean roundStart = false;
int MODE = ADD;
int round = 1;

void setup() {
  size(800,600);
  map = new Map();
  map.printDirections();
  balloon = new Balloon();
}

void mouseClicked() {
  monkeys.add(new Monkey(mouseX, mouseY));
  monkeys.display();
  println("" + mouseX + ", " + mouseY); 
}


void draw() {
  map.display();
  balloon.display();
  balloon.followMap();
}
