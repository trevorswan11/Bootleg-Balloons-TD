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
int balloonSize = 35;

PImage red, blue, green, yellow, pink, black, white, zebra, lead, rainbow, ceramic;

boolean roundStart = false;
int MODE = ADD;
int round = 0;

void setup() {
  size(1000, 600);
  map = new Map();
  player = new Player();


  //images
  red = loadImage("red_balloon.png");
  red.resize(balloonSize, balloonSize);
  blue = loadImage("blue_balloon.png");
  blue.resize(balloonSize, balloonSize);
  green = loadImage("green_balloon.png");
  green.resize(balloonSize, balloonSize);
  yellow = loadImage("yellow_balloon.png");
  yellow.resize(balloonSize, balloonSize);
  pink = loadImage("pink_balloon.png");
  pink.resize(balloonSize, balloonSize);
  black = loadImage("black_balloon.png");
  black.resize(balloonSize/2, balloonSize);
  white = loadImage("white_balloon.png");
  white.resize(balloonSize/2, balloonSize);
  zebra = loadImage("zebra_balloon.png");
  zebra.resize(balloonSize, balloonSize);
  lead = loadImage("lead_balloon.png");
  lead.resize(balloonSize, balloonSize);
  rainbow = loadImage("rainbow_balloon.png");
  rainbow.resize(balloonSize, balloonSize);
  ceramic = loadImage("ceramic_balloon.png");
  ceramic.resize(balloonSize, balloonSize);
}

void mouseClicked() {
  if (MODE == ADD) {
    fill(0);
    Monkey m = new Monkey(mouseX, mouseY);
    monkeys.add(m);
    //weapons.add(m.getWeapons());
  }
  if (MODE == DELETE) {
    fill(0);
    monkeys.remove(mouseX, mouseY);
    //weapons.remove(mouseX, mouseY);
  }
}

void keyPressed() {
  if (key == 'b') {
    balloons.add(new Balloon());
  }

  if (key == ENTER) {
    roundStart = true;
  }
  if (key == ' ') {
    if (MODE == DELETE) {
      MODE = ADD;
    } else {
      MODE++;
    }
  }
}

void draw() {
  background(255);
  if (!player.isDead()) {
    text("ROUND: " + round, 820, 30);
    text("HEALTH: " + player.health, 820, 50);
    map.display();
    fill(0);
    if (MODE == ADD) {
      text("MODE: Add", 820, 70);
    }
    if (MODE == DELETE) {
      text("MODE: Delete", 820, 70);
    }
    if (roundStart) {
      balloons.addBalloons();
      balloons.display();
      balloons.processAll();
      monkeys.processAll();
    }
    monkeys.display();
    /*balloons.display();
    balloons.processAll();
    for (int i = 0; i < monkeys.size(); i++) {
      monkeys.get(i).findBalloon();
    }*/
  } else {
    textSize(100);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
  }
}
