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
Buttons button1;
Buttons button2;


PImage redBalloon;
PImage defaultMonkey;

PImage red, blue, green, yellow, pink, black, white, zebra, lead, rainbow, ceramic;
boolean roundStart = false;
boolean roundOver = false;
int MODE = ADD;
int round = 0;

void setup() {
  size(1000, 600);
  map = new Map();
  player = new Player();
  rounds = new Rounds();
  button1 = new Buttons(820, 90, "ADD", 3, #C3E3DA);
  //button1 = new Buttons(820, 90, defaultMonkey, 2, #C3E3DA);

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
  button1.clicked(mouseX, mouseY);
  if (button1.getMode() == ADD) {
    button1.setCaption("ADD");
    Monkey m = new Monkey(mouseX, mouseY);
    if(m.canBePlaced() == true){
      monkeys.add(m);
    }
    else if(mouseX < 800){
      fill(#A03030);
      circle(mouseX, mouseY, 50);
    }
  }
  if (button1.getMode() == DELETE) {
    button1.setCaption("SELL");
    monkeys.remove(mouseX, mouseY);
  }
  if (button1.getMode() == STATS){
    button1.setCaption("STATS");
    int index = monkeys.get(mouseX, mouseY);
    println(index);
    if(index > -1){
      fill(0);
      text("Attack Speed" + monkeys.get(index).getAttackSpeed(), 820, 160);
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
  background(255);
  button1.display();
  if (!player.isDead()) {
    fill(0);
    text("ROUND: " + (round+1), 840, 30);
    text("HEALTH: " + player.health, 850, 50);
    //image(defaultMonkey, 820, 160);
    map.display();
    fill(0);
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
  }
}
