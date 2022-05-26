public class Monkey {
  PImage image; //For creating the monkey image
  int attackSpeed;
  int attackRange;
  int attackStrength;
  int x; // The coordinates of the monkey
  int y;
  public Monkey(int xcoord, int ycoord) {
    //Default values for monkey stats except for x and y since those have to be determiend
    //by mouseClicked()
    image = loadImage("monkey.png");
    image.resize(25, 25);
    attackSpeed = 10;
    attackRange = 10;
    attackStrength = 10;
    x = xcoord;
    y = ycoord;
  }
  public Monkey(int speed, int range, int strength, int xcoord, int ycoord) {
    image = loadImage("monkey.png");
    image.resize(25, 25);
    attackSpeed = speed;
    attackStrength = strength;
    x = xcoord;
    y = ycoord;
  }
  public int getX() {
    return x;
  }
  public int getY() {
    return y;
  }
  public int getAttackSpeed(){
    return attackSpeed;
  }
  public int getAttackRange(){
    return attackRange;
  }
  public int getAttackStrength(){
    return attackStrength;
  }
  public PImage getImage(){
    return image;
  }
  void display() {
    image(image, x, y);
  }
}
