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
Buttons startRound;
Buttons pause;
Buttons quit;

Buttons sellButton;
Buttons cancelButton;
Buttons upgradeStrengthButton;
Buttons upgradeThrowButton;
Buttons upgradeRangeButton;
Buttons upgradeSpeedButton;

balloonButtonList balloonButtons;
monkeyButtonList monkeyButtons;

PImage dart, ninja, wizard, sniper, water, ninjaImg, wizardImg, sniperImg, waterImg;
PImage red, blue, green, yellow, pink, black, white, zebra, lead, rainbow, ceramic;

void setup() {
  size(1000, 750);
  map = new Map();
  player = new Player();
  rounds = new Rounds();

  //load in all images in setup 
  //monkey images 
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

  //balloon images 
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
  //black and white png's are different sizes than the rest of the ballooons so they have to be differently sized 
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

  //initliaize buttons
  normal = new Buttons(width/2-50, height/2 + 100, "NORMAL", 40, 100, 20);
  freeplay = new Buttons(width/2-50, height/2 + 150, "FREEPLAY", 40, 100, 20);
  startOver = new Buttons(width/2-70, height/2 + 110, "START OVER", 40, 140, 20);
  pause = new Buttons(835, 650, "PAUSE", 35, 130, 20);
  quit = new Buttons(835, 690, "QUIT", 35, 130, 20);
  startRound = new Buttons(865, 500, "START", 70, 70, 20);
  
  balloonButtons = new balloonButtonList();
  monkeyButtons = new monkeyButtonList();
  
  sellButton = new Buttons (190, 680, "SELL", 30, 50, 15);
  cancelButton = new Buttons (860, 400, "CANCEL", 80, 80, 20);
  upgradeSpeedButton = new Buttons (350, 650, "SPEED\nUPGRADE\n$100", 60, 75, 14);
  upgradeStrengthButton = new Buttons (450, 650, "STRENGTH\nUPGRADE\n$100", 60, 75, 14);
  upgradeThrowButton = new Buttons (550, 650, "THROW\nUPGRADE\n$100", 60, 75, 14);
  upgradeRangeButton = new Buttons (650, 650, "RANGE\nUPGRADE\n$100", 60, 75, 14);
}

void moving() {
  Monkey m =  monkeys.get(monkeys.get(mouseX, mouseY));
  Weapons w = m.getWeapons();
  w.move();
  m.move();
}

//resets all variables to start a new game 
void restart() {
  player = new Player();
  rounds = new Rounds();
  monkeys = new MonkeyList();
  balloons = new balloonList();
  gameStart = false;
  freeplayStart = false;
  round = 0;
  paused = false;
  roundStart = false;
}

void mouseClicked() {  
  if (!gameStart && !freeplayStart) { //start menu 
    if (normal.inRange()) { //starts normal 
      gameStart = true;
    }
    if (freeplay.inRange()) { //starts freeplay
      freeplayStart = true;
    }
  } else if (player.isDead()) {
    if (startOver.inRange()) { //restarts
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
  
  int buttonIndex = monkeyButtons.findButtonAt();
  monkeys.addMonkey(buttonIndex);
  if (monkeys.showStats != -1) { //if monkey stats are being shown
    if (upgradeStrengthButton.inRange() == true && player.getIncome() >= 100) {
      float value = monkeys.get(monkeys.showStats).getAttackStrength()+1;
      monkeys.get(monkeys.showStats).setAttackStrength(value);
      if (gameStart) {
        player.changeIncome(75*-1);
      }
    }
    if (upgradeSpeedButton.inRange() == true && player.getIncome() >= 100) {
      float value = monkeys.get(monkeys.showStats).getAttackSpeed()-2;
      monkeys.get(monkeys.showStats).setAttackSpeed(value);
      if (gameStart) {
        player.changeIncome(75*-1);
      }
    }
    if (upgradeRangeButton.inRange() == true && player.getIncome() >= 100) {
      float value = monkeys.get(monkeys.showStats).getAttackRange()*1.3;
      monkeys.get(monkeys.showStats).setAttackRange(value);
      if (gameStart) {
      player.changeIncome(75*-1);
      }
    }
    if (upgradeThrowButton.inRange() == true && player.getIncome() >= 150) {
      Weapons w2 = monkeys.get(monkeys.showStats).getWeapons2();
      Weapons w3 = monkeys.get(monkeys.showStats).getWeapons3();
      w2.setX(monkeys.get(monkeys.showStats).getWeapons().getX());
      w3.setX(monkeys.get(monkeys.showStats).getWeapons().getX());
      w2.setY(monkeys.get(monkeys.showStats).getWeapons().getY());
      w3.setY(monkeys.get(monkeys.showStats).getWeapons().getY());
      monkeys.get(monkeys.showStats).setUpgraded(true);
      player.changeIncome(150*-1);
    }
  }
  if (monkeys.showStats < monkeys.size() && monkeys.showStats > -1 && sellButton.inRange() == true) {
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
    if (cancelButton.inRange() == true && m1.getMovement() == true) {
      monkeys.remove(m1);
      player.changeIncome(m1.getPrice());
    }
  }
  
  balloonButtons.spawnBalloon(); //if respective balloon button is clicked it will spawn 
  
  //button triggers for quit, pause, and start round 
  if (quit.inRange()) {
    restart();
  } else if (pause.inRange()) {
    if (paused == true) {
      paused = false;
    } else {
      paused = true;
    }
  } else if (startRound.inRange()) {
    roundStart = true;
  }
}


void draw() {
  if (!gameStart && !freeplayStart) { //displays main menu 
    background(255);
    textSize(100);
    textAlign(CENTER);
    text("START GAME", width/2, height/2);
    normal.display();
    freeplay.display();
  } else if (gameStart) { //normal mode 
    background(255);
    map.display();
    textSize(15);
    fill(0);
    if (!player.isDead()) { 
      //loads all buttons 
      pause.display();
      quit.display();
      startRound.display();
      monkeyButtons.display();
      cancelButton.display();
      
      //displays information 
      textSize(15);
      textAlign(LEFT);
      text("ROUND: " + (round+1), 830, 30);
      text("HEALTH: " + player.health, 830, 50);
      text("INCOME: " + player.income, 830, 70);
      
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
      
      if (monkeys.showStats != -1) { //will show stats of moneky with showStats index if its not -1 
        monkeys.displayStats();
      }
      
      monkeys.display();
      balloons.display();

      if (roundStart) { //runs when round is in motion 
        if (!paused) { //if paused monkeys and balloons will stop moving 
          balloons.processAll();
          monkeys.processAll();
          if (!roundOver) {
            rounds.runRound(); //will load in all balloons in the round
          }
        }
      }
      
      if (paused) { //if paused, will draw triangle 
        fill(0, 200);
        triangle(360, 200, 360, 400, 560, 300);
      }
      
    } else { //game over menu 
      textSize(100);
      textAlign(CENTER);
      text("GAME OVER", width/2, height/2);
      startOver.display();
    }
  } else if (freeplayStart) { //freeplay mode 
    //loads in all necessary elements 
    background(255);
    fill(0);
    map.display();
    monkeyButtons.display();
    pause.display();
    quit.display();
    balloons.display();
    cancelButton.display();

    if (!paused) { //if not paused, monkeys and balloons will move 
      balloons.processAll();
      monkeys.processAll();
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
   
    //will either show balloon buttons or monkey stats based on what is clicked 
    if (monkeys.showStats != -1) {  
      monkeys.displayStats();
      balloonButtons.setShown(false);
    } else {
      balloonButtons.display();
      balloonButtons.setShown(true);
    }

    monkeys.display(); //displayed down here so circle to show attackRange doesn't overlap it 

    if (paused) { //if paused, will draw triangle  
      fill(0, 200);
      triangle(360, 200, 360, 400, 560, 300);
    }
  }
}
