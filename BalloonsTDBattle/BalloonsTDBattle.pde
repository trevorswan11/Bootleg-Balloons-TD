final int ADD = 0;
final int DELETE = 1;
final int UPGRADE = 2;
MonkeyList monkeys = new MonkeyList();
balloonList balloons = new balloonList();

//Change image display by loading in the setup so you only have to set up once

Monkey m;
Map map;
Balloon balloon;
int balloonSize = 25;


PImage redBalloon;

boolean roundStart = false;
int MODE = ADD;
int round = 1;

void setup() {
  size(800,600);
  map = new Map();
  map.printDirections();
  
  //images
  redBalloon = loadImage("red_balloon.png");
  redBalloon.resize(balloonSize, balloonSize);
}

void mouseClicked() {
  //if (MODE == ADD) {
  //  monkeys.add(new Monkey(mouseX, mouseY));
  //} else if (MODE == DELETE) {
  //  monkeys.remove(mouseX, mouseY);
  //}
  balloons.remove(balloons.getBalloonAt(mouseX,mouseY));
}

void keyPressed() {
  if (key == ' ') {
    if (MODE == DELETE) {
      MODE = ADD;  
    } else {
      MODE++;  
    }
  }
  if (key == 'b') {
    balloons.add(new Balloon());  
  }
}


void draw() {
  map.display();
  balloons.display();
  balloons.processAll();
  monkeys.display();
}
