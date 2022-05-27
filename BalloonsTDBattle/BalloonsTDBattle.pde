final int ADD = 0;
final int DELETE = 1;
final int UPGRADE = 2;
MonkeyList monkeys = new MonkeyList();
balloonList balloons = new balloonList();

//Change image display by loading in the setup so you only have to set up once

Player player;
Monkey m;
Map map;
Balloon balloon;
int balloonSize = 25;


PImage redBalloon;

boolean roundStart = false;
int MODE = ADD;
int round = 1;

void setup() {
  size(800, 600);
  map = new Map();
  player = new Player();
  
  //images
  redBalloon = loadImage("red_balloon.png");
  redBalloon.resize(balloonSize, balloonSize);
}

void mouseClicked() {
  if (MODE == ADD) {
    fill(0);
    monkeys.add(new Monkey(mouseX, mouseY));
  }
  if (MODE == DELETE) {
    fill(0);
    monkeys.remove(mouseX, mouseY);
  }
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
  if (key == ENTER) {
    roundStart = true;  
  }

}

void draw() {
  if (!player.isDead()) {
    map.display();
    fill(0);
    if (MODE == ADD) {
      text("MODE: Add", 30, 60);
    }
    if (MODE == DELETE) {
      text("MODE: Delete", 30, 60);
    }
    if (roundStart) {
      balloons.addBalloons();
      balloons.display();
      balloons.processAll();
    }
    monkeys.display();
  } else {
    background(0);
    textSize(100);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
  }
}
