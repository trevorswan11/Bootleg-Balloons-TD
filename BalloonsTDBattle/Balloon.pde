public class Balloon {
  PImage image;
  int health;
  float speed;
  int directionsIndex = 1;
  float currentX = 400;
  float currentY = 3;
  
  int[] nextCords = map.getDirection(0);
  float distanceX = nextCords[0]-currentX;
  float distanceY = nextCords[1]-currentY;

  
  public Balloon() {
    image = loadImage("red_balloon.png");
    image.resize(25, 25);
    health = 1;
    speed = .05;
  }
  
  public Balloon(String color_, int health_, float speed_) {
    image = loadImage(color_ + "_balloon.png");
    image.resize(25, 25);
    health = health_;
    speed = speed_;
  }

  void display() {
    image(image, currentX, currentY);       
  }
  
  void followMap() {
    if (directionsIndex < map.getDirectionsSize()) {
      if (distanceX > 0 && distanceY > 0) {
        move();
      } else {
        nextCords = map.getDirection(directionsIndex);
        distanceX = nextCords[0]-currentX;
        distanceY = nextCords[1]-currentY;
        directionsIndex++;
      }
    }

    //if (distanceX > 0) {
    //  currentX += speed;
    //  distanceX -= speed;
    //  //println(currentX);
    //}
    //if (distanceY > 0) {
    //  currentY += speed;
    //  distanceY -= speed;
    //  //println(currentY);
    //}
    
    //currentX += distanceX;
    //currentY += distanceY;
    //println("" + distanceX + " " + distanceY);
  }
  
  void move() {
    if (distanceX > 0) {
      currentX += speed*(distanceX%(distanceX-1));
      distanceX -= speed*(distanceX%(distanceX-1));
      //println(currentX);
    }
    if (distanceY > 0) {
      currentY += speed*(distanceX%(distanceX-1));
      distanceY -= speed*(distanceX%(distanceX-1));
      //println(currentY);
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
}
