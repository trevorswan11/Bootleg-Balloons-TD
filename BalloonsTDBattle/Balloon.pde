public class Balloon {
  PImage image;
  int health;
  int speed;
  float currentX = 390;
  float currentY = 3;
  
  public Balloon() {
    image = loadImage("red_balloon.png");
    image.resize(25, 25);
    health = 1;
    speed = 5;
  }
  
  public Balloon(String color_, int health_, int speed_) {
    image = loadImage(color_ + "_balloon.png");
    health = health_;
    speed = speed_;
  }

  void display() {
    image(image, currentX, currentY);       
  }

  void move() {
  
  }
}
