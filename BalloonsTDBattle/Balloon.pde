public class Balloon {
  PImage image;
  int health;
  float speed;
  int directionsIndex = 1;
  float currentX = 410;
  float currentY = 0;
  Boolean atEnd = false;
  int size = balloonSize;
  Boolean target = false;

  int[] nextCords = map.getDirection(1);
  float distanceX = nextCords[0]-currentX;
  float distanceY = nextCords[1]-currentY;

  public Balloon() {
    image = red;
    health = 1;
    speed = 1;
  }
  
  public Balloon(Balloon b) {
    health = b.getHealth();
    speed = b.getSpeed();
    currentX = b.getCurrentX();
    currentY = b.getCurrentY();
    directionsIndex = b.getDirectionsIndex();
    nextCords = b.nextCords;
    distanceX = b.distanceX;
    distanceY = b.distanceY;
  }

  public Balloon(PImage image_, int health_, float speed_) {
    image = image_;
    health = health_;
    speed = speed_;
  }

  void display() {
    image(image, currentX-size/2, currentY-balloonSize/2);
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

 float[] getFuture() {
    float x_ = currentX;
    float y_ = currentY;
    int directionsIndex_ = directionsIndex;

    int[] nextCords_ = map.getDirection(directionsIndex+1);
    float distanceX_ = nextCords[0]-x_;
    float distanceY_ = nextCords[1]-y_;
    int timer = 0;

    while (timer < 3) {
      if (directionsIndex_ < map.getDirectionsSize()) {
        if (distanceX_ != 0) {
          float sign = distanceSign(distanceX_);
          x_ += speed*distanceSign(distanceX_);
          distanceX_ -= speed*distanceSign(distanceX_);
          if (sign != distanceSign(distanceX_)) {
            distanceX_ = 0;
            x_ = nextCords_[0];
          }
        } else if (distanceY_ != 0) {
          float sign = distanceSign(distanceY_);
          y_ += speed*distanceSign(distanceY_);
          distanceY_ -= speed*distanceSign(distanceY_);
          if (sign != distanceSign(distanceY_)) {
            distanceY_ = 0;
            y_ = nextCords_[1];
          }
        }
        if (distanceX_ == 0 && distanceY_ == 0) {
          if (directionsIndex_ != 13) {
            directionsIndex_++;
            nextCords_ = map.getDirection(directionsIndex_);
            distanceX_ = nextCords_[0]-x_;
            distanceY_ = nextCords_[1]-x_;
          }
        }
      }
    timer++;
    }
    return new float[]{x_, y_};
  }
  int decreaseHealth() {
    health--;
    return health;
  }
  int decreaseHealth(int change) {
    health -= change;
    return health;
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
  void setX(float x_) {
    currentX = x_;  
  }
  void setY(float y_) {
    currentY = y_;  
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
  boolean getTarget(){
  return target;
  }
  void setTarget(boolean b){
    target = b;
  }
  void setNextCords(int[] cords) {
    nextCords = cords;
  }
  void setDistanceX(float dist) {
    distanceX = dist;  
  }
  void setDistanceY(float dist) {
    distanceY = dist;  
  }
}

public class redBalloon extends Balloon{
  redBalloon() {
    image = red;
    health = 1;
    speed = 1;
  }
  
  redBalloon(Balloon b) {
    super(b);
    image = red;
    health = 1;
    speed = 1;
  }
}

public class blueBalloon extends Balloon{
  blueBalloon() {
    image = blue;
    health = 2;
    speed = 1.3;
  }
  
  blueBalloon(Balloon b) {
    super(b);
    image = blue;
    health = 2;
    speed = 1.3;
  }
}

public class greenBalloon extends Balloon{
  greenBalloon() {
    image = green;
    health = 3;
    speed = 1.5;
  }
  
  greenBalloon(Balloon b) {
    super(b);
    image = green;
    health = 3;
    speed = 1.5;
  }
}

public class yellowBalloon extends Balloon{
  yellowBalloon() {
    image = yellow;
    health = 4;
    speed = 2;
  }

  yellowBalloon(Balloon b) {
    super(b);
    image = yellow;
    health = 4;
    speed = 2;
  }
}

public class pinkBalloon extends Balloon{
  pinkBalloon() {
    image = pink;
    health = 5; 
    speed = 2.5;
  }

  pinkBalloon(Balloon b) {
    super(b);
    image = pink;
    health = 5; 
    speed = 2.5;
  }
}

public class blackBalloon extends Balloon{
  blackBalloon() {
    image = black;
    health = 11;
    speed = 1.5;
    size = balloonSize/2;
  }
  
  blackBalloon(Balloon b) {
    super(b);
    image = black;
    health = 11;
    speed = 1.5;
    size = balloonSize/2;
  }
  
  //if 1 damage done to it, it splits into two pink balloons, else split into 1 pink
}

public class whiteBalloon extends Balloon{
  whiteBalloon() {
    image = white;
    health = 11;
    speed = 1.5;
    size = balloonSize/2;
  }
  
  whiteBalloon(Balloon b) {
    super(b);
    image = white;
    health = 11;
    speed = 1.5;
    size = balloonSize/2;
  }

  //if 1 damage done to it, it splits into 2 pink balloons
}

public class zebraBalloon extends Balloon{
  zebraBalloon() {
    image = zebra;
    health = 23;
    speed = 1.5;
  }

  zebraBalloon(Balloon b) {
    super(b);
    image = zebra;
    health = 23;
    speed = 1.5;
  }

  //if 1 damage done to it, it splits into 1 black and 1 white
}

public class leadBalloon extends Balloon{
  leadBalloon() {
    image = lead;
    health = 23;
    speed = 1;
  }

  leadBalloon(Balloon b) {
    super(b);
    image = lead;
    health = 23;
    speed = 1;
  }

  //if 1 damage done to it, it splits into 2 black balloons 
}

public class rainbowBalloon extends Balloon{
  rainbowBalloon() {
    image = rainbow;
    health = 47;
    speed = 1.6;
  }
  
  rainbowBalloon(Balloon b) {
    super(b);
    image = rainbow;
    health = 47;
    speed = 1.6;
  }

  //if 1 damage dont to it, it splits into 2 zebra baloons 
}

public class ceramicBalloon extends Balloon{
  ceramicBalloon() {
    image = ceramic;
    health = 104;
    speed = 1.7;
  }
  
  ceramicBalloon(Balloon b) {
    super(b);
    image = ceramic;
    health = 104;
    speed = 1.7;
  }

  //if 10 damage is done to it(health 94), it splits into 2 rainbow balloons
}
