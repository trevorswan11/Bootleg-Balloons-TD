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
boolean paused = false;
boolean roundStart = false;
boolean roundOver = false;
boolean locked = false;
int clickedNum = 0;
int round = 0;

int balloonSize = 35;
int monkeySize = 50;
int imageSize = 75;

Buttons normal;
Buttons freeplay;
Buttons startOver;
Buttons sellButton;
Buttons cancelButton;
Buttons upgradeStrengthButton;
Buttons upgradeThrowButton;
Buttons upgradeRangeButton;
Buttons upgradeSpeedButton;
Buttons startRound;
Buttons pause;
Buttons quit;

balloonButtonList balloonButtons;
monkeyButtonList monkeyButtons;

PImage dart, ninja, wizard, sniper, water, ninjaImg, wizardImg, sniperImg, waterImg;
PImage red, blue, green, yellow, pink, black, white, zebra, lead, rainbow, ceramic;

void setup() {
  size(1000, 750);
  map = new Map();
  player = new Player();
  rounds = new Rounds();

  //images


  dart = loadImage("dart.png");
  dart.resize(monkeySize, monkeySize);
  ninja = loadImage("ninja.png");
  ninja.resize(monkeySize, monkeySize);
  wizard = loadImage("wizard.png");
  wizard.resize(monkeySize, monkeySize);
  sniper = loadImage("sniper.png");
  sniper.resize(monkeySize, monkeySize);
  water = loadImage("water.png");
  water.resize(monkeySize, monkeySize);
  ninjaImg = loadImage("ninja.png");
  ninjaImg.resize(imageSize, imageSize);
  wizardImg = loadImage("wizard.png");
  wizardImg.resize(imageSize, imageSize);
  sniperImg = loadImage("sniper.png");
  sniperImg.resize(imageSize, imageSize);
  waterImg = loadImage("water.png");
  waterImg.resize(imageSize, imageSize);

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

  //buttons
  normal = new Buttons(width/2-50, height/2 + 100, "NORMAL", 40, 100, 20, 225);
  freeplay = new Buttons(width/2-50, height/2 + 150, "FREEPLAY", 40, 100, 20, 225);
  startOver = new Buttons(width/2-70, height/2 + 110, "START OVER", 40, 140, 20, 225);
  pause = new Buttons(835, 650, "PAUSE", 30, 130, 20, 225);
  quit = new Buttons(835, 690, "QUIT", 30, 130, 20, 225);
  startRound = new Buttons(865, 500, "START", 70, 70, 20, 225);
  balloonButtons = new balloonButtonList();
  monkeyButtons = new monkeyButtonList();
  sellButton= new Buttons (190, 680, "SELL", 30, 50, 10, 255);
  cancelButton = new Buttons (865, 400, "CANCEL", 70, 70, 20, 55);
  upgradeStrengthButton = new Buttons (500, 650, "STRENGTH\nUPGRADE", 50, 70, 10, 255);
  upgradeThrowButton = new Buttons (650, 650, "THROW\nUPGRADE", 50, 70, 10, 255);
  upgradeSpeedButton = new Buttons (350, 650, "SPEED\nUPGRADE", 50, 70, 10, 255);
  upgradeRangeButton = new Buttons (800, 650, "RANGE\nUPGRADE", 50, 70, 10, 255);
}

void moving() {
  Monkey m =  monkeys.get(monkeys.get(mouseX, mouseY));
  Weapons w = m.getWeapons();
  w.move();
  m.move();
}

void restart() {
  player = new Player();
  rounds = new Rounds();
  monkeys = new MonkeyList();
  balloons = new balloonList();
  gameStart = false;
  freeplayStart = false;
  round = 0;
}

void mouseClicked() {
  color c = map.getPath().get(mouseX, mouseY);
  println(("" + c + " " + red(c) + ", " + blue(c) + ", " + green(c)));
  
  if (!gameStart && !freeplayStart) {
    if (normal.inRange(mouseX, mouseY)) {
      gameStart = true;
    }
    if (freeplay.inRange(mouseX, mouseY)) {
      freeplayStart = true;
    }
  } else if (player.isDead()) {
    if (startOver.inRange(mouseX, mouseY)) {
      restart();
    }
  } else {
    int index = monkeys.get(mouseX, mouseY);
    if (index > -1 && monkeys.get(index).getMovement()==false) {
      monkeys.setShowStats(index);
    } else if (mouseX < 800 && mouseY < 600) {
      monkeys.setShowStats(-1);
    }
  }
  int buttonIndex = monkeyButtons.findButtonAt(mouseX, mouseY);
  monkeys.addMonkey(buttonIndex);
  if (upgradeStrengthButton.clicked1(mouseX, mouseY) == true && player.getIncome() >= 50) {
    float value = monkeys.get(monkeys.showStats).getAttackStrength()*1.1;
    monkeys.get(monkeys.showStats).setAttackStrength(value);
    player.changeIncome(50*-1);
  }
  if (upgradeSpeedButton.clicked1(mouseX, mouseY) == true && player.getIncome() >= 50) {
    float value = monkeys.get(monkeys.showStats).getAttackSpeed()-2;
    monkeys.get(monkeys.showStats).setAttackSpeed(value);
    player.changeIncome(50*-1);
  }
  if (upgradeRangeButton.clicked1(mouseX, mouseY) == true && player.getIncome() >= 50) {
    float value = monkeys.get(monkeys.showStats).getAttackRange()*1.1;
    monkeys.get(monkeys.showStats).setAttackRange(value);
    player.changeIncome(50*-1);
  }
  if (upgradeThrowButton.clicked1(mouseX, mouseY) == true && player.getIncome() >= 100) {
    Weapons w2 = monkeys.get(monkeys.showStats).getWeapons2();
    Weapons w3 = monkeys.get(monkeys.showStats).getWeapons3();
    w2.setX(monkeys.get(monkeys.showStats).getWeapons().getX());
    w3.setX(monkeys.get(monkeys.showStats).getWeapons().getX());
    w2.setY(monkeys.get(monkeys.showStats).getWeapons().getY());
    w3.setY(monkeys.get(monkeys.showStats).getWeapons().getY());
    monkeys.get(monkeys.showStats).setUpgraded(true);
    player.changeIncome(100*-1);
  }
  if (monkeys.showStats < monkeys.size() && monkeys.showStats > -1 && sellButton.clicked1(mouseX, mouseY) == true) {
    monkeys.sell(monkeys.showStats);
    monkeys.setShowStats(-1);
  }
  if (monkeys.get(mouseX, mouseY) > -1) {
    Monkey m1 = monkeys.get(monkeys.get(mouseX, mouseY));
    m1.addClickedNum();
    if (m1.canBePlaced(mouseX, mouseY) || m1.getClickedNum() == 1) {
      m1.setMovement();
    }
    if (m1.canBePlaced(mouseX, mouseY) && m1.getClickedNum() > 2) {
      m1.setLocked(true);
    }
    if (cancelButton.clicked1(mouseX, mouseY) == true && m1.getMovement() == true) {
      monkeys.remove(m1);
      player.changeIncome(m1.getPrice());
    }
  }
  balloonButtons.spawnBalloon();
  if (quit.inRange(mouseX, mouseY)) {
    restart();
  } else if (pause.inRange(mouseX, mouseY)) {
    if (paused == true) {
      paused = false;
    } else {
      paused = true;
    }
  } else if (startRound.inRange(mouseX, mouseY)) {
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
      pause.display();
      quit.display();
      startRound.display();
      monkeyButtons.display();
      cancelButton.display();

      fill(0);
      textSize(15);
      textAlign(LEFT);
      text("ROUND: " + (round+1), 830, 30);
      text("HEALTH: " + player.health, 830, 50);
      text("INCOME: " + player.income, 830, 70);
      map.display();
      fill(0);
      if (monkeys.showStats != -1) {
        monkeys.displayStats();
      }
      if (monkeys.get(mouseX, mouseY) > -1 && monkeys.get(monkeys.get(mouseX, mouseY)).getLocked() == false && monkeys.get(monkeys.get(mouseX, mouseY)).getMovement() == true) {
        moving();
        Monkey bob = monkeys.get(monkeys.get(mouseX, mouseY));
        if (bob.canBePlaced(mouseX, mouseY) == true) {
          fill(#3DA745, 150);
          circle(mouseX, mouseY, bob.getAttackRange()*2);
        } else {
          fill(#B22225, 150);
          circle(mouseX, mouseY, bob.getAttackRange()*2);
        }
      }
      if (roundStart) {
        if (!roundOver) {
          rounds.runRound();
        }
        balloons.display();
        if (!paused) {
          balloons.processAll();
          monkeys.processAll();
        }
      }
      monkeys.display();
      if (paused) {
        fill(0, 200);
        triangle(360, 200, 360, 400, 560, 300);
      }
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
    pause.display();
    quit.display();
    balloons.display();
    cancelButton.display();
    if (!paused) {
      balloons.processAll();
      monkeys.processAll();
    }
    monkeyButtons.display();
    if (monkeys.showStats != -1) {
      monkeys.displayStats();
      balloonButtons.setShown(false);
    } else {
      balloonButtons.display();
      balloonButtons.setShown(true);
    }
    if (monkeys.get(mouseX, mouseY) > -1 && monkeys.get(monkeys.get(mouseX, mouseY)).getLocked() == false && monkeys.get(monkeys.get(mouseX, mouseY)).getMovement() == true) {
      moving();
      Monkey bob = monkeys.get(monkeys.get(mouseX, mouseY));
      if (bob.canBePlaced(mouseX, mouseY) == true) {
        fill(#3DA745, 150);
        circle(mouseX, mouseY, bob.getAttackRange()*2);
      } else {
        fill(#B22225, 150);
        circle(mouseX, mouseY, bob.getAttackRange()*2);
      }
    }
    monkeys.display();
    if (paused) {
      fill(0, 200);
      triangle(360, 200, 360, 400, 560, 300);
    }
  }
}
