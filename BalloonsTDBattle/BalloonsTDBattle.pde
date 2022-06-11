final int ADD = 0;
final int DELETE = 1;
final int STATS = 2;
int show = 1;
MonkeyList monkeys = new MonkeyList();
balloonList balloons = new balloonList();

Player player;
Monkey m;
Map map;
Balloon balloon;
int balloonSize = 35;
Rounds rounds;
int showStats = -1;
boolean gameStart = false;
boolean freeplayStart = false;

Buttons button1;
Buttons button2;
Buttons normal;
Buttons freeplay;
Buttons nextRound;
Buttons startOver;

balloonButton redBalloonButton;

PImage redBalloon;
PImage defaultMonkey;
PImage buttonMonkey;

PImage red, blue, green, yellow, pink, black, white, zebra, lead, rainbow, ceramic;
boolean roundStart = false;
boolean roundOver = false;
int MODE = ADD;
int round = 20;

void setup() {
  size(1000, 750);
  map = new Map();
  player = new Player();
  rounds = new Rounds();

  //images
  redBalloon = loadImage("red_balloon.png");
  redBalloon.resize(balloonSize, balloonSize);
  defaultMonkey = loadImage("monkey.png");
  defaultMonkey.resize(25, 25);
  buttonMonkey = loadImage("monkey.png");
  buttonMonkey.resize(25, 25);
  button1 = new Buttons(820, 90, buttonMonkey, 2, #C3E3DA);

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

  //button1 = new Buttons(820, 90, defaultMonkey, 1, #C3E3DA);

  normal = new Buttons(width/2-50, height/2 + 100, "NORMAL", 40, 100, 20, 225);
  freeplay = new Buttons(width/2-50, height/2 + 150, "FREEPLAY", 40, 100, 20, 225);
  startOver = new Buttons(width/2-70, height/2 + 110, "START OVER", 40, 140, 20, 225);

  redBalloonButton = new balloonButton(70, 700, new redBalloon());
}

void mouseClicked() {
  if (!gameStart && !freeplayStart) {
    if (normal.inRange(mouseX, mouseY)) {
      gameStart = true;
    }
    if (freeplay.inRange(mouseX, mouseY)) {
      freeplayStart = true;
    }
  } else if (player.isDead()) {
    if (startOver.inRange(mouseX, mouseY)) {
      player = new Player();
      rounds = new Rounds();
      monkeys = new MonkeyList();
      gameStart = false;
    }
  } else {
    if (button1.clicked1(mouseX, mouseY) == true) {
      Monkey m =  new Monkey(820, 90);
      monkeys.add(m);
    }
    if (monkeys.get(mouseX, mouseY) > -1) {
      Monkey m1 = monkeys.get(monkeys.get(mouseX, mouseY));
      m1.setMovement();
    }
  }
}


void moving() {
  Monkey m =  monkeys.get(monkeys.get(mouseX, mouseY));
  m.move();
}

void keyPressed() {
  if (key == ENTER) {
    roundStart = true;
  }
}


void draw() {
  if (!gameStart && !freeplayStart) {
    background(255);
    textSize(100);
    textAlign(CENTER);
    text("START GAME", width/2, height/2);
    normal.display();
    freeplay.display();
  } else if (gameStart) {
    background(255);
    textSize(15);
    if (!player.isDead()) {
      button1.display();
      fill(0);
      text("ROUND: " + (round+1), 845, 30);
      text("HEALTH: " + player.health, 850, 50);
      text("INCOME: " + player.income, 850, 70);
      map.display();
      fill(0);
      if (monkeys.get(mouseX, mouseY) > -1 && monkeys.get(monkeys.get(mouseX, mouseY)).getMovement() == true) {
        moving();
        //map.displayPath();
        Monkey bob = monkeys.get(monkeys.get(mouseX, mouseY));
        //println(bob.canBePlaced(mouseX, mouseY));
        if (bob.canBePlaced(mouseX, mouseY) == true) {
          fill(#3DA745);
          //tint(255, 127);
          circle(mouseX+12, mouseY+12, 75);
        } else {
          fill(#B22225);
          //tint(255, 0);
          circle(mouseX+12, mouseY+12, 75);
          //tint(255, 127);

          //bob.setMovement(false);
        }
      }
      if (roundStart) {
        if (!roundOver) {
          rounds.runRound();
        }
        balloons.display();
        balloons.processAll();
        monkeys.processAll();
      }
      monkeys.display();
    } else {
      textSize(100);
      textAlign(CENTER);
      text("GAME OVER", width/2, height/2);
      startOver.display();
      startOver.hover(mouseX, mouseY);
    }
  } else if (freeplayStart) {
    background(255);
    map.display();
    fill(0);
    balloons.display();
    balloons.processAll();
    monkeys.processAll();
    monkeys.display();
    redBalloonButton.display();
  }
}
