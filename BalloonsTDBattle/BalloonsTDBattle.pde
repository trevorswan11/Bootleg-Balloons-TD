final int ADD = 0;
final int DELETE = 1;
final int STATS = 2;
MonkeyList monkeys = new MonkeyList();
balloonList balloons = new balloonList();
weaponList bullets = new weaponList();

Player player;
Monkey m;
Map map;
Balloon balloon;
int balloonSize = 35;
Rounds rounds;
int showStats = -1;
boolean gameStart = false;

boolean displayStats = false;
Buttons button1;
Buttons button2;
Buttons normal;
Buttons freeplay;
Buttons nextRound;
Buttons startOver; 

PImage redBalloon;
PImage defaultMonkey;

PImage red, blue, green, yellow, pink, black, white, zebra, lead, rainbow, ceramic;
boolean roundStart = false;
boolean roundOver = false;
int MODE = ADD;
int round = 10;

void setup() {
  size(1000, 750);
  map = new Map();
  player = new Player();
  rounds = new Rounds();
  button1 = new Buttons(820, 90, "ADD", 3, #C3E3DA);
  //button1 = new Buttons(820, 90, defaultMonkey, 2, #C3E3DA);

  normal = new Buttons(width/2-50, height/2 + 100, "NORMAL", 40, 100, 20, 225);
  freeplay = new Buttons(width/2-50, height/2 + 150, "FREEPLAY", 40, 100, 20, 225);
  startOver = new Buttons(width/2-50, height/2 + 150, "START OVER", 40, 100, 20, 225);
  //images

  redBalloon = loadImage("red_balloon.png");
  redBalloon.resize(balloonSize, balloonSize);
  defaultMonkey = loadImage("monkey.png");
  defaultMonkey.resize(25, 25);

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
  //int i = monkeys.get(mouseX, mouseY);
  //showStats = i;
  
  if (!gameStart) {
    if (normal.inRange(mouseX, mouseY)) {
      gameStart = true;  
    }
  } else {
    button1.clicked(mouseX, mouseY);
    if (button1.getMode() == ADD) {
      button1.setCaption("ADD");
      Monkey m = new Monkey(mouseX, mouseY);
      if (m.canBePlaced() == true && m.price <= player.income) {
        monkeys.add(m);
        player.changeIncome(m.price*-1);
      } else if (mouseX < 800 && m.price <= player.income) {
        fill(#A03030);
        circle(mouseX, mouseY, m.getAttackRange());
      }
    }
    if (button1.getMode() == DELETE) {
      button1.setCaption("SELL");
      monkeys.sell(mouseX,mouseY);
    }
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
  if (!gameStart) {
    background(255);
    textSize(100);
    textAlign(CENTER);
    text("START GAME", width/2, height/2);
    normal.display();
    freeplay.display();
    normal.hover(mouseX, mouseY);
    freeplay.hover(mouseX, mouseY);
  } else {
    background(255);
    if (!player.isDead()) {
    button1.display();
      fill(0);
      text("ROUND: " + (round+1), 845, 30);
      text("HEALTH: " + player.health, 850, 50);
      text("INCOME: " + player.income, 850, 70);
      //image(defaultMonkey, 820, 160);
      map.display();
      fill(0);
      //if (showStats != -1) {
      //  monkeys.get(showStats).showStats();
      //}
      if (button1.getMode() == STATS) {
        button1.setCaption("STATS");
        int index = monkeys.get(mouseX, mouseY);
        if (index > -1) {
          text("Monkey " + index + "'s Statistics", 860, 190);
          text("Attack Speed: " + monkeys.get(index).getAttackSpeed(),  860, 210);
          text("Attack Strength: " + monkeys.get(index).getAttackStrength(),  860, 230);
          text("Attack Range: " + monkeys.get(index).getAttackRange(),  860, 250);
        }
      }
      if (roundStart) {
        if (!roundOver) {
          rounds.runRound();
        }
        balloons.display();
        balloons.processAll();
        monkeys.processAll();
        bullets.display();
      }
      monkeys.display();
    } else {
      textSize(100);
      textAlign(CENTER);
      text("GAME OVER", width/2, height/2);
      startOver.display();
      startOver.hover(mouseX, mouseY);
    }
   }
}
