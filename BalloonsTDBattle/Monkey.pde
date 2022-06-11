public class Monkey {
  PImage image; //For creating the monkey image
  int attackSpeed;
  int attackRange;
  int attackStrength;
  Weapons weapon;
  boolean thrown;
  boolean locked = false;
  int timer = 0;
  float x; // The coordinates of the monkey
  float y;
  int price;
  boolean movement = false;
  int clickedNum;
  int targetBalloon = -1; 

  public Monkey(float xcoord, float ycoord) {
    //Default values for monkey stats except for x and y since those have to be determiend
    //by mouseClicked()
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
    balloonList balloon2 = balloons;
    for (int i = 0; i< balloon2.size(); i++) {
      Balloon current = balloon2.get(i);
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
  void throwWeapon(Balloon b) {
    b.setTarget(true);
    float[] coord = b.getFuture();
    float range = dist(weapon.getX(), weapon.getY(), coord[0], coord[1]);
    if (range < 10 && !thrown) {
      player.attackIncome(this, b);
      attack(b);
      thrown = true;
      weapon.setX(x);
      weapon.setY(y);
    } else {
      float xInterval = (coord[0]-weapon.getX())/3;//change 10 to something based off of attackSpeed
      float yInterval = (coord[1]-weapon.getY())/3;
      weapon.changeX(xInterval);
      weapon.changeY(yInterval);
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
    text("Wizard Monkey", 220, 665);
    fill(255);
    rect(70, 650, 75, 75);
    image(image, 70, 650);
    fill(#C1C8C9, 150);
    circle(x, y, attackRange*2);
    button2.display();
  }

  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }

  void setX(float xcoord) {
    x = xcoord;
  }

  void setY(float ycoord) {
    y = ycoord;
  }
  Weapons getWeapons() {
    return weapon;
  }

  public int getAttackSpeed() {
    return attackSpeed;
  }

  public int getAttackRange() {
    return attackRange;
  }

  public int getAttackStrength() {
    return attackStrength;
  }
  public PImage getImage() {
    return image;
  }

  public int getClickedNum() {
    return clickedNum;
  }
  void addClickedNum() {
    clickedNum++;
  }
  public boolean getMovement() {
    return movement;
  }

  public boolean getLocked() {
    return locked;
  }
  void setLocked(boolean b) {
    locked = b;
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

  int increaseTimer() {
    return timer++;
  }
  int getPrice() {
    return price;
  }

  void resetTimer() {
    timer = 0;
  }
  void setThrown(boolean b) {
    thrown = b;
  } 
  void setTargetBalloon(int b) {
    targetBalloon = b;   
  }
  int getTargetBalloon() {
    return targetBalloon;  
  }

  void display() {
    weapon.display();
    image(image, x-monkeySize/2, y-monkeySize/2);
  }

  void move() {
    float dx = mouseX - x;
    x += dx;
    float dy = mouseY - y;
    y += dy ;
  }
}

  void move() {
    float dx = mouseX - x;
    x += dx;
    float dy = mouseY - y;
    y += dy ;
  }

public class dartMonkey extends Monkey{
  public dartMonkey(float xcoord,float ycoord) {
    //speed, range, power
    super(50, 100, 1, xcoord, ycoord); 
    image = dart;
    price = 200; 
  }
}

public class wizardMonkey extends Monkey{
  public wizardMonkey(float xcoord,float ycoord) {
    super(70, 80, 1, xcoord, ycoord); 
    image = wizard;
    price = 550;
  }
}

public class sniperMonkey extends Monkey{
  public sniperMonkey(float xcoord,float ycoord) {
    super(100, 50, 2, xcoord, ycoord); 
    image = sniper;
    price = 350; 
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
