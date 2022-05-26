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
  size(800, 600);
  //map = new Map();
  //map.printDirections();
  //balloon = new Balloon();
}

void mouseClicked() {
  if (MODE == 0) {
    fill(0);
    monkeys.add(new Monkey(mouseX, mouseY));
    monkeys.display();
  }
  if (MODE == 1) {
    fill(0);
    monkeys.remove(mouseX, mouseY);
    monkeys.display();
  }

  //println("" + mouseX + ", " + mouseY);
}

void keyPressed() {
  MODE++;
  if (MODE > 1) {
    MODE = 0;
  }
}


void draw() {
  background(255);
  if(MODE == ADD){
    text("MODE: Add", 20, 30);
  }
  if(MODE == DELETE){
    text("MODE: Remove", 20, 30);
  }
    
  monkeys.display();

  //map.display();
  //balloon.display();
  //balloon.followMap();
}
