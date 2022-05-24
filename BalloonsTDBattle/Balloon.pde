public class Balloon {
  PImage image;
  int health;
  float speed;
  int directionsIndex = 1;
  float currentX = 410;
  float currentY = 0;
  int size = 25;
  Balloon next, prev;
  
  int[] nextCords = map.getDirection(1);
  float distanceX = nextCords[0]-currentX;
  float distanceY = nextCords[1]-currentY;

  public Balloon() {
    image = loadImage("red_balloon.png");
    image.resize(size, size);
    health = 1;
    speed = 1;
  }
  
  public Balloon(Balloon balloon) {
    image = balloon.image;  
    image.resize(size,size);
    health = balloon.health;
    speed = balloon.speed;
  }
  
  public Balloon(String color_, int health_, float speed_) {
    image = loadImage(color_ + "_balloon.png");
    image.resize(size, size);
    health = health_;
    speed = speed_;
  }

  void display() {
    image(image, currentX, currentY);       
  }
  
  void followMap() {
    if (directionsIndex < map.getDirectionsSize()) {
      //println(directionsIndex);
      if (distanceX == 0 || distanceY == 0) {
        move();
      } else {
        directionsIndex++;
        nextCords = map.getDirection(directionsIndex);
        distanceX = nextCords[0]-currentX;
        distanceY = nextCords[1]-currentY;
      }
    }
  }
  
  void move() {
    if (distanceX != 0) {
      currentX += speed;
      distanceX -= speed;
      println("X: " + currentX + " distance: " + distanceX);
    } else if (distanceY != 0) {
      currentY += speed;
      distanceY -= speed;
      println("Y: " + currentY);
    }
  }
  
  float distanceSign(float n) {
    if (n == 0) {
      return 0;  
    } else if (n > 0) {
      return 1;
    } else {
      return -1;
    }
  }
      
  int getDirectionsIndex() {
    return directionsIndex;  
  }
  
  int addDirectionsIndex() {
    directionsIndex ++;
    return directionsIndex;
  }
  
  float changeX(int change) {
    currentX += change;
    return currentX;
  }
  float changeY(int change) {
    currentY += change;
    return currentY;
  }
  float getCurrentX() {
    return currentX;  
  }
  float getCurrentY() {
    return currentY;
  }
  PImage getImage() {
    return image;  
  }
  int getHealth() {
    return health;
  }
  float getSpeed() {
    return speed;
  }
}
