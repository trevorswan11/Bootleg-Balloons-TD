public class Monkey {
  PImage image; //For creating the monkey image
  int attackSpeed;
  int attackRange;
  int attackStrength;
  Weapons weapon;
  float x; // The coordinates of the monkey
  float y;
  public Monkey(float xcoord, float ycoord) {
    //Default values for monkey stats except for x and y since those have to be determiend
    //by mouseClicked()
    image = loadImage("monkey.png");
    image.resize(25, 25);
    weapon = new Weapons(xcoord, ycoord);
    attackSpeed = 10;
    attackRange = 50;
    attackStrength = 1;
    x = xcoord;
    y = ycoord;
  }
  public Monkey(int speed, int range, int strength, int xcoord, int ycoord) {
    image = loadImage("monkey.png");
    image.resize(25, 25);
    attackSpeed = speed;
    attackStrength = strength;
    attackRange = range;
    x = xcoord;
    y = ycoord;
  }

  float[] findBalloon() {
    float[]coord = new float[2];
    balloonList balloon2 = balloons;
    for (int i = balloon2.size()-1; i> 0; i--) {
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
    float[] coord = b.getFuture(attackSpeed);
    //while (weapon.getX() != b.getCurrentX() || weapon.getY() < b.getCurrentY()) {
      float xInterval = (coord[0]-weapon.getX())/10;
      float yInterval = (coord[1]-weapon.getY())/10;
      weapon.changeX(xInterval);
      weapon.changeY(yInterval);
      if(weapon.getX() == coord[0]){
        weapon = new Weapons(x, y);
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
  void display() {
    image(image, x, y);
    weapon.display();
  }
}
