public class Monkey {
  PImage image; //For creating the monkey image
  int attackSpeed;
  int attackRange;
  int attackStrength;
  Weapons weapon;
  boolean thrown;
  int timer = 0;
  float x; // The coordinates of the monkey
  float y;
  public Monkey(float xcoord, float ycoord) {
    //Default values for monkey stats except for x and y since those have to be determiend
    //by mouseClicked()
    image = defaultMonkey;
    weapon = new Weapons(xcoord, ycoord);
    attackSpeed = 1;
    attackRange = 50;
    attackStrength = 1;
    x = xcoord;
    y = ycoord;
  }
  public Monkey(int speed, int range, int strength, int xcoord, int ycoord) {
    image = defaultMonkey;
    attackSpeed = speed;
    attackStrength = strength;
    attackRange = range;
    x = xcoord;
    y = ycoord;
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
      attack(b);
      thrown = true;
      weapon.setDisplay(false);
      weapon.setX(x);
      weapon.setY(y);
      weapon.setDisplay(true);
    } else {
      float xInterval = (coord[0]-weapon.getX())/3;//change 10 to something based off of attackSpeed
      float yInterval = (coord[1]-weapon.getY())/3;
      weapon.changeX(xInterval);
      weapon.changeY(yInterval);
    }
  }
  boolean canBePlaced() {
    int dist = 50;
    color c = map.getPath().get((int)x,(int)y);
    boolean result = true;
    if (red(c) == 0 || red(c) == #0000FF){
      result = false;
    }
    for (int i = 0; i < monkeys.size(); i ++) {
      Monkey current = monkeys.get(i);
      if (dist(x, y, current.getX(), current.getY()) < dist) {
        result = false;
      }
    }
    return result;
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

  int increaseTimer() {
    return timer++;
  }
  void resetTimer() {
    timer = 0;
  }
  void setThrown(boolean b) {
    thrown = b;
  }

  void display() {
    image(image, x, y);
    weapon.display();
  }
}
