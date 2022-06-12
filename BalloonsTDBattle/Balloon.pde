public class Balloon {
  PImage image;
  int health;
  float speed;
  int size = balloonSize;
  Boolean atEnd = false; 
  Boolean target = false; //indicates if a monkey has it as its target 

  int directionsIndex = 1;
  float currentX = 410;
  float currentY = 0;
  int[] nextCords = map.getDirection(1); //find next cords 
  float distanceX = nextCords[0]-currentX; //distance until it reaches the next cords
  float distanceY = nextCords[1]-currentY; //distance until it reaches the next cord 

//default balloon constructor 
  public Balloon() {
    image = red;
    health = 0;
    speed = 1;
  }

//sets new balloon to old balloon 
  public Balloon(Balloon b) {
    image = b.getImage();
    health = b.getHealth();
    speed = b.getSpeed();
    currentX = b.getCurrentX();
    currentY = b.getCurrentY();
    directionsIndex = b.getDirectionsIndex();
    nextCords = b.nextCords;
    distanceX = b.distanceX;
    distanceY = b.distanceY;
    if (image == black || image == white) {
      size = balloonSize/2;  
    }
  }
  
  public Balloon(PImage image_, int health_, float speed_) {
    image = image_;
    health = health_;
    speed = speed_;
  }

  void followMap() { //balloon will go through directions until it reaches the end 
    if (directionsIndex < map.getDirectionsSize()) {
      move();
      if (distanceX == 0 && distanceY == 0) { //if currentCords is at nextCords 
        if (directionsIndex != 13) { //if not at the end continues onto the next cords 
          directionsIndex++;
          nextCords = map.getDirection(directionsIndex);
          distanceX = nextCords[0]-currentX;
          distanceY = nextCords[1]-currentY;
        } else {
          atEnd = true; //if at the end, will set atEnd true 
        }
      }
    }
  }

  void move() { //will move balloon to next cord based on its current cords in intervals based on its speed 
    //either distanceX or distanceY will be 0, since only one of those values should be changed at once 
    if (distanceX != 0) {
      float sign = distanceSign(distanceX);
      currentX += speed*distanceSign(distanceX); //moves balloon based on speed in direction found in sign 
      distanceX -= speed*distanceSign(distanceX); //so we know how much distance balloon still has to travel 
      if (sign != distanceSign(distanceX)) { //to make distances exact so balloon distance won't go over or under  
        distanceX = 0;
        currentX = nextCords[0]; //sets current cords to next cords since distanceX = 0 
      }
    } else if (distanceY != 0) { //same thing as above but for y cord
      float sign = distanceSign(distanceY);
      currentY += speed*distanceSign(distanceY);
      distanceY -= speed*distanceSign(distanceY);
      if (sign != distanceSign(distanceY)) {
        distanceY = 0;
        currentY = nextCords[1];
      }
    }
  }

  float distanceSign(float n) { //calculates which direction the distance should be 
    if (n == 0) {
      return 0;
    } else if (n > 0) {
      return 1;
    } else {
      return -1;
    }
  }

  float[] getFuture(int constant) { //combination of move and followmap 
    if (directionsIndex+1 >= map.getDirectionsSize()) { //checks if balloon will be off the map when monkey attacks 
      return new float[]{-1, -1};  
    }
   
    //new varibales so it doesn't actually change this balloon's ones  
    float x_ = currentX;
    float y_ = currentY;
    int directionsIndex_ = directionsIndex;

    int[] nextCords_ = map.getDirection(directionsIndex+1);
    float distanceX_ = nextCords[0]-x_;
    float distanceY_ = nextCords[1]-y_;
    int timer = 0;

    while (timer < constant) { //will find balloon in constant "frames"
      if (directionsIndex_ < map.getDirectionsSize()) { //same as followMap()
        if (distanceX_ != 0) { //same as move()
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
        if (distanceX_ == 0 && distanceY_ == 0) { //continuation of followMap()
          if (directionsIndex_ != 13) {
            directionsIndex_++;
            nextCords_ = map.getDirection(directionsIndex_);
            distanceX_ = nextCords_[0]-x_;
            distanceY_ = nextCords_[1]-x_;
          } else {
            return new float[]{-1, -1};  //return when balloon is going to be out of the map 
          }
        }
      }
    timer++;
    }
    return new float[]{x_, y_};
  }

 
  void display() {
    image(image, currentX-size/2, currentY-balloonSize/2); //-balloonSize/2 to center it 
  }
 
  int decreaseHealth(float change) {
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
}

//all balloon subclasses: exact same as balloon but just different constructors 
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
}
