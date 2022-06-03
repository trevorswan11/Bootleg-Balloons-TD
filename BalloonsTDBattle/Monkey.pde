public class Monkey {
  PImage image; //For creating the monkey image
  int attackSpeed;
  int attackRange;
  int attackStrength;
  boolean throwingWeapon = false;
  float x; // The coordinates of the monkey
  float y;
  int timer;
  public Monkey(float xcoord, float ycoord) {
    //Default values for monkey stats except for x and y since those have to be determiend
    //by mouseClicked()
    image = defaultMonkey;
    attackSpeed = 20;
    attackRange = 50;
    attackStrength = 1;
    x = xcoord;
    y = ycoord;
    timer = 0;
  }
  public Monkey(int speed, int range, int strength, int xcoord, int ycoord) {
    image = defaultMonkey;
    attackSpeed = speed;
    attackStrength = strength;
    attackRange = range;
    x = xcoord;
    y = ycoord;
    timer = 0;
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
    Weapons bullet = new Weapons(x, y);
    bullets.add(bullet);
    float[] coord = b.getFuture(b.getSpeed());
    float range = dist(x, y, coord[0], coord[1]);
    if (range < 10) {
      attack(b);
      bullets.remove(bullet);
    } else {
      float xInterval = (coord[0]-bullet.getX())/2;//change 10 to something based off of attackSpeed
      float yInterval = (coord[1]-bullet.getY())/2;
      bullet.changeX(xInterval);
      bullet.changeY(yInterval);
    }
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

  public int getAttackSpeed() {
    return attackSpeed;
  }
  public int getAttackRange() {
    return attackRange;
  }
  public int getAttackStrength() {
    return attackStrength;
  }
  public int getTimer() {
    return timer;
  }
  void addTimer(int num) {
    timer = timer + num;
  }
  void setTimer(int num) {
    timer =num;
  }
  public PImage getImage() {
    return image;
  }

  void display() {
    image(image, x, y);
  }
}
/*
  void attack(Balloon b) {
 b.decreaseHealth(attackStrength);
 }
 void throwWeapon(Balloon b) {
 float[] coord = b.getFuture(b.getSpeed());
 //println("index: " + balloons.getBalloonAt(coord[0], coord[1]));
 float range = dist(weapon.getX(), weapon.getY(), coord[0], coord[1]);
 if (range < 10) {
 attack(b);
 weapon.setDisplay(false);
 weapon.setX(x);
 weapon.setY(y);
 weapon.setDisplay(true);
 } else {
 float xInterval = (coord[0]-weapon.getX())/2;//change 10 to something based off of attackSpeed
 float yInterval = (coord[1]-weapon.getY())/2;
 weapon.changeX(xInterval);
 weapon.changeY(yInterval);
 }
 }*/
