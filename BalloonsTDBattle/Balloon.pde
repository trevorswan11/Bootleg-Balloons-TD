public class Balloon {
  PImage image;
  int health;
  float speed;
  int directionsIndex = 1;
  float currentX = 410;
  float currentY = 0;
  Boolean atEnd = false;
  
  int[] nextCords = map.getDirection(1);
  float distanceX = nextCords[0]-currentX;
  float distanceY = nextCords[1]-currentY;

  public Balloon() {
    image = redBalloon;
    health = 1;
    speed = 2;
  }
  
  public Balloon(Balloon balloon) {
    image = balloon.image;  
    health = balloon.health;
    speed = balloon.speed;
  }
  
  public Balloon(PImage image_, int health_, float speed_) {
    image = image_;
    health = health_;
    speed = speed_;
  }

  void display() {
    if (health > 0 && !atEnd) {
      image(image, currentX-balloonSize/2, currentY-balloonSize/2);
    }
  }
  
  void followMap() {
    if (directionsIndex < map.getDirectionsSize()) {
      move();
      if (distanceX == 0 && distanceY == 0) {
        if (directionsIndex != 13) {
          directionsIndex++;
          nextCords = map.getDirection(directionsIndex);
          distanceX = nextCords[0]-currentX;
          distanceY = nextCords[1]-currentY;
        } else {
          atEnd = true;  
        }
      }
    }
  }
  
  void move() {
    if (distanceX != 0) {
      float sign = distanceSign(distanceX);
      currentX += speed*distanceSign(distanceX);
      distanceX -= speed*distanceSign(distanceX);
      if (sign != distanceSign(distanceX)) {
        distanceX = 0;  
        currentX = nextCords[0];
      }
    } else if (distanceY != 0) {
      float sign = distanceSign(distanceY);
      currentY += speed*distanceSign(distanceY);
      distanceY -= speed*distanceSign(distanceY);
      if (sign != distanceSign(distanceY)) {
        distanceY = 0;  
        currentY = nextCords[1];
      }
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
   
  int[] getFuture(int attackSpeed) {
    float x_ = currentX;
    float y_ = currentY;
    int directionsIndex_ = directionsIndex;
    
    int[] nextCords = map.getDirection(directionsIndex);
    float distanceX = nextCords[0]-x_;
    float distanceY = nextCords[1]-y_;
    int maxTime = attackSpeed; //some calculation based on attackSpeed and balloonSpeed
    for (int i = 0; i < attackSpeed; i++) {
      
    }
  }
        
  int getDirectionsIndex() {
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
