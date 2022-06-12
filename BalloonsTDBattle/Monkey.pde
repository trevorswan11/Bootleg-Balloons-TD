public class Monkey {
  String name = "Monkey"; 
  PImage image; //For creating the monkey image
  float attackSpeed;
  float attackRange;
  float attackStrength;
  float x; // The coordinates of the monkey
  float y;
  int timer = 0; //used in its attack method to see how much time passed so it can attack again 
  int price;

  boolean thrown;
  boolean locked = false;
  boolean movement = false;
  boolean upgraded = false;
  int clickedNum;
  int targetBalloon = -1; //shows which balloon the monkey is targeting, if it is -1 it means there is no balloon 
  int weaponsNum = 1;
  Weapons weapon;
  Weapons weapon2;
  Weapons weapon3;

  public Monkey(float xcoord, float ycoord) {
    //Default values for monkey stats except for x and y since those have to be determiend
    //by mouseClicked()
    weapon2 =  new Weapons(xcoord, ycoord);
    weapon3 = new Weapons(xcoord, ycoord);
    weapon = new Weapons(xcoord, ycoord);
    image = dart;
    attackSpeed = 1;
    attackRange = 50;
    attackStrength = 1;
    x = xcoord;
    y = ycoord;
    price = 550;
  }

  public Monkey(int speed, int range, int strength, float xcoord, float ycoord) {
    weapon2 =  new Weapons(xcoord, ycoord);
    weapon3 = new Weapons(xcoord, ycoord);
    weapon = new Weapons(xcoord, ycoord);
    image = dart;
    attackSpeed = speed;
    attackStrength = strength;
    attackRange = range;
    x = xcoord;
    y = ycoord;
    price = 550;
  }

  public Monkey(Monkey m_, float xcoord, float ycoord) {
    weapon2 =  new Weapons(xcoord, ycoord);
    weapon3 = new Weapons(xcoord, ycoord);
    weapon = new Weapons(xcoord, ycoord);
    
    image = m_.getImage();
    attackSpeed = m_.getAttackSpeed();
    attackStrength =  m_.getAttackStrength();
    attackRange =  m_.getAttackRange();
    x = xcoord;
    y = ycoord;
    price =  m_.getPrice();
  }

  float[] findBalloon() {
    float[]coord = new float[2];
    for (int i = 0; i< balloons.size(); i++) {
      Balloon current = balloons.get(i);
      if (current.getHealth() > 0 && dist(getX(), getY(), current.getCurrentX(), current.getCurrentY()) <= attackRange) {
        coord[0] = current.getCurrentX();
        coord[1] = current.getCurrentY();
      }
    }
    return coord;
  }

  void attack(Balloon b) {
    b.decreaseHealth(attackStrength);
  }

  void throwWeaponUpgraded(Balloon b) {
    Balloon b2 = balloons.get(balloons.getIndex(b)+1);
    Balloon b3 = balloons.get(balloons.getIndex(b)+2);
    b.setTarget(true);
    b2.setTarget(true);
    b3.setTarget(true);
    float[] coord = b.getFuture(3);
    float[] coord2 = b2.getFuture(3);
    float[] coord3 = b3.getFuture(3);
    float range = dist(weapon.getX(), weapon.getY(), coord[0], coord[1]);
    if (range < 10 && !thrown) {
      player.attackIncome(this, b);
      player.attackIncome(this, b2);
      player.attackIncome(this, b3);
      attack(b);
      attack(b2);
      attack(b3);
      thrown = true;
      weapon.setX(x);
      weapon.setY(y);
      weapon2.setX(x);
      weapon2.setY(y);
      weapon3.setX(x);
      weapon3.setY(y);
    } else {
      float xInterval = (coord[0]-weapon.getX())/3;//change 10 to something based off of attackSpeed
      float yInterval = (coord[1]-weapon.getY())/3;
      float xInterval2 = (coord2[0]-weapon2.getX())/3;//change 10 to something based off of attackSpeed
      float yInterval2 = (coord2[1]-weapon2.getY())/3;
      float xInterval3 = (coord3[0]-weapon3.getX())/3;//change 10 to something based off of attackSpeed
      float yInterval3 = (coord3[1]-weapon3.getY())/3;
      weapon.changeX(xInterval);
      weapon.changeY(yInterval);
      weapon2.changeX(xInterval2);
      weapon2.changeY(yInterval2);
      weapon3.changeX(xInterval3);
      weapon3.changeY(yInterval3);
    }
  }
  void throwWeapon(Balloon b) {
    if (balloons.getIndex(b)+1 < balloons.size() && balloons.getIndex(b)+2 < balloons.size()  && upgraded == true && balloons.size() > 3) {
      throwWeaponUpgraded(b);
    } else {
      b.setTarget(true);
      float[] coord = b.getFuture(3);
      float range = dist(weapon.getX(), weapon.getY(), coord[0], coord[1]);
      if (range < 10 && !thrown) {
        player.attackIncome(this, b);
        attack(b);
        thrown = true;
        weapon.setX(x);
        weapon.setY(y);
      } else {
        float xInterval = (coord[0]-weapon.getX())/3; //since getFuture() find next balloon cords in 3 "frames" the weapon has to travel in 3 "frames" as well 
        float yInterval = (coord[1]-weapon.getY())/3;
        weapon.changeX(xInterval);
        weapon.changeY(yInterval);
      }
    }
  }

  boolean canBePlaced(float xcoord, float ycoord) {
    int dist = 25;
    color c = map.getPath().get((int)xcoord, (int)ycoord);
    boolean result = true;
    if (red(c) != 255) {
      result = false;
    }
    for (int i = 0; i < monkeys.size(); i ++) {
      int now = monkeys.get(xcoord, ycoord);
      Monkey current = monkeys.get(i);
      if (now != i && dist(xcoord, ycoord, current.getX(), current.getY()) < dist ) {
        result = false;
      }
    }
    return result;
  }
  
  void showStats() {
    textAlign(LEFT);
    textSize(15);
    text(name, 190, 665);
    fill(#CDF2F5);
    rect(70, 650, monkeySize, monkeySize);
    image(image, 70, 650);
    fill(#C1C8C9, 150);
    circle(x, y, attackRange*2); //shows attackRange of the monkey 
    //displays all the buttons 
    sellButton.display();
    upgradeStrengthButton.display();
    upgradeThrowButton.display();
    upgradeSpeedButton.display();
    upgradeRangeButton.display();
  }
  
  int increaseTimer() {
    return timer++;
  }
  void resetTimer() {
    timer = 0;
  }
  void setMovement() {
    if (movement == false) {
      movement = true;
    } else {
      movement = false;
    }
  }
  void setMovement(boolean b) {
    movement = b;
  }
  void setLocked(boolean b) {
    locked = b;
  }
  void setAttackStrength(float a) {
    attackStrength = a;
  }
  void setAttackRange(float a) {
    attackRange = a;
  }
  void setAttackSpeed(float a) {
    attackSpeed= a;
  }
  void addClickedNum() {
    clickedNum++;
  }
  void setUpgraded(boolean b) {
    upgraded = b;
  }
  void setThrown(boolean b) {
    thrown = b;
  }
  void setTargetBalloon(int b) {
    targetBalloon = b;
  }
  void setX(float xcoord) {
    x = xcoord;
  }
  void setY(float ycoord) {
    y = ycoord;
  }
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  Weapons getWeapons() {
    return weapon;
  }
  Weapons getWeapons2() {
    return weapon2;
  }
  Weapons getWeapons3() {
    return weapon3;
  }
  float getAttackSpeed() {
    return attackSpeed;
  }
  float getAttackRange() {
    return attackRange;
  }
  float getAttackStrength() {
    return attackStrength;
  }
  PImage getImage() {
    return image;
  }
  int getClickedNum() {
    return clickedNum;
  }
  boolean getUpgraded() {
    return upgraded;
  }
  boolean getMovement() {
    return movement;
  }
  boolean getLocked() {
    return locked;
  }
  int getPrice() {
    return price;
  }
  int getTargetBalloon() {
    return targetBalloon;
  }

  void display() {
    weapon.display();
    if (upgraded == true) {
      weapon2.display();
      weapon3.display();
    }
    image(image, x-monkeySize/2, y-monkeySize/2);
  }

  void move() {
    float dx = mouseX - x;
    x += dx;
    float dy = mouseY - y;
    y += dy ;
  }
}

public class ninjaMonkey extends Monkey {
  public ninjaMonkey(float xcoord, float ycoord) {
    //speed, range, power
    super(40, 100, 1, xcoord, ycoord);
    image = ninja;
    price = 200;
    name = "Ninja Monkey";
  }
}

public class wizardMonkey extends Monkey {
  public wizardMonkey(float xcoord, float ycoord) {
    super(70, 80, 1, xcoord, ycoord);
    image = wizard;
    price = 550;
    name = "Wizard Monkey";
  }
}

public class waterMonkey extends Monkey {
  public waterMonkey(float xcoord, float ycoord) {
    super(50, 100, 2, xcoord, ycoord);
    weapon2 =  new Weapons(xcoord, ycoord, #56E6F2);
    weapon3 = new Weapons(xcoord, ycoord, #56E6F2);
    weapon = new Weapons(xcoord, ycoord, #56E6F2);
    image = water;
    price = 200;
    name = "Water Monkey";
  }

  boolean canBePlaced(float xcoord, float ycoord) {
    int dist = 25;
    color c = map.getPath().get((int)xcoord, (int)ycoord);
    boolean result = true;
    if (red(c) == 7 && xcoord < 800 && ycoord <600) {
      result = true;
    } else {
      result = false;  
    }
    for (int i = 0; i < monkeys.size(); i ++) {
      int now = monkeys.get(xcoord, ycoord);
      Monkey current = monkeys.get(i);
      if (now != i && dist(xcoord, ycoord, current.getX(), current.getY()) < dist ) {
        result = false;
      }
    }
    return result;
  }
}

public class sniperMonkey extends Monkey {
  public sniperMonkey(float xcoord, float ycoord) {
    super(100, 50, 3, xcoord, ycoord);
    image = sniper;
    price = 350;
    name = "Sniper Monkey";
  }

  float[] findBalloon() {
    Balloon highest = new Balloon();
    for (int i = 0; i< balloons.size(); i++) {
      Balloon current = balloons.get(i);
      if (current.getHealth() > highest.getHealth()) {
        highest = current;
      }
    }
    return new float[]{highest.getCurrentX(), highest.getCurrentY()};
  }
}
