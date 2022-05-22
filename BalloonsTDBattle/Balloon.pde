public class Balloon {
  PImage image;
  int health;
  int speed;
  int directionsIndex = 0;
  float currentX = 400;
  float currentY = 3;
  
  public Balloon() {
    image = loadImage("red_balloon.png");
    image.resize(25, 25);
    health = 1;
    speed = 5;
  }
  
  public Balloon(String color_, int health_, int speed_) {
    image = loadImage(color_ + "_balloon.png");
    image.resize(25, 25);
    health = health_;
    speed = speed_;
  }

  void display() {
    image(image, currentX, currentY);       
  }
  
  void move() {
    int[] nextCords = map.getDirection(directionsIndex);
    float distanceX = currentX-nextCords[0];
    float distanceY = currentY-nextCords[1];
    
    currentX += distanceX;
    currentY += distanceY;
    //println("" + distanceX + " " + distanceY);
  }
  
  void followMap() {
    while (directionsIndex < map.getDirectionsSize()) {
      move();
      directionsIndex++;
    }
  }
  
  
}
