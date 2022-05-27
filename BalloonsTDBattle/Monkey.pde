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
  float[] findBalloon(){
    float[]coord = new float[2];
    balloonList balloon2 = balloons;
    for(int i = 0; i< balloon2.size(); i++){
      Balloon current = balloon2.get(i);
      if(current.getHealth() > 0 && dist(getX(), getY(), current.getCurrentX(), current.getCurrentY()) > attackRange){
        coord[0] = current.getCurrentX();
        coord[1] = current.getCurrentY();
      }
    }
    return coord;
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
  Weapons getWeapons(){
    return weapon;
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
