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
Rounds rounds;
int showStats = -1;
boolean gameStart = false;
boolean freeplayStart = false;

int balloonSize = 35;
int monkeySize = 25; 

Buttons normal;
Buttons freeplay;
Buttons nextRound;
Buttons startOver;

balloonButtonList balloonButtons;
monkeyButtonList monkeyButtons;

PImage dart, wizard, sniper;
PImage red, blue, green, yellow, pink, black, white, zebra, lead, rainbow, ceramic;
boolean roundStart = false;
boolean roundOver = false;
int MODE = ADD;
boolean locked = false;
int clickedNum = 0;
int round = 21;


void setup() {
  size(1000, 750);
  map = new Map();
  player = new Player();
  rounds = new Rounds();

  //images
  dart = loadImage("dart.png");
  dart.resize(monkeySize, monkeySize);
  wizard = loadImage("wizard.png");
  wizard.resize(monkeySize, monkeySize);
  sniper = loadImage("sniper.png");
  sniper.resize(monkeySize, monkeySize);
  
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

  normal = new Buttons(width/2-50, height/2 + 100, "NORMAL", 40, 100, 20, 225);
  freeplay = new Buttons(width/2-50, height/2 + 150, "FREEPLAY", 40, 100, 20, 225);
  startOver = new Buttons(width/2-70, height/2 + 110, "START OVER", 40, 140, 20, 225);
  balloonButtons = new balloonButtonList();
  monkeyButtons = new monkeyButtonList();
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
    int index = monkeys.get(mouseX, mouseY);
    if(index > -1){
      monkeys.setShowStats(index);
    }else if(mouseX < 800 && mouseY < 600){
      monkeys.setShowStats(-1);
    }
    
    int buttonIndex = monkeyButtons.findButtonAt(mouseX, mouseY);
    if (player.getIncome() > 550 && balloons.size()==0 && buttonIndex != -1) {
      Monkey m =  new Monkey(monkeyButtons.getMonkey(buttonIndex), monkeyButtons.get(buttonIndex).getX(), monkeyButtons.get(buttonIndex).getY());
      monkeys.add(m);
      player.changeIncome(m.getPrice() * -1);
    }
    if (monkeys.get(mouseX, mouseY) > -1) {
      Monkey m1 = monkeys.get(monkeys.get(mouseX, mouseY));
      m1.addClickedNum();
      if (m1.canBePlaced(mouseX, mouseY) == true ||m1.getClickedNum() == 1) {
        m1.setMovement();
      }
      if (m1.canBePlaced(mouseX, mouseY) == true && m1.getClickedNum() > 2) {
        m1.setLocked(true);
      }
    }

    balloonButtons.spawnBalloon();

  }
}


void moving() {
  Monkey m =  monkeys.get(monkeys.get(mouseX, mouseY));
  Weapons w = m.getWeapons();
  w.move();
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
      monkeyButtons.display();
      fill(0);
      text("ROUND: " + (round+1), 845, 30);
      text("HEALTH: " + player.health, 850, 50);
      text("INCOME: " + player.income, 850, 70);
      map.display();
      fill(0);
      if(monkeys.showStats != -1){
        monkeys.displayStats();
      }
      if (monkeys.get(mouseX, mouseY) > -1 && monkeys.get(monkeys.get(mouseX, mouseY)).getLocked() == false && monkeys.get(monkeys.get(mouseX, mouseY)).getMovement() == true) {
        moving();
        Monkey bob = monkeys.get(monkeys.get(mouseX, mouseY));
        if (bob.canBePlaced(mouseX, mouseY) == true) {
          fill(#3DA745);
          circle(mouseX+12, mouseY+12, bob.getAttackRange()*2);
        } else {
          fill(#B22225);
          circle(mouseX+12, mouseY+12, bob.getAttackRange()*2);
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
     balloonButtons.display();
   }
}
