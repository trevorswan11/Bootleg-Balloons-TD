public class Weapons {
  color c;
  float x;
  float y;
  boolean isDisplay = true;
  public Weapons(float xcoord, float ycoord) {
    x = xcoord;
    y = ycoord;
    c = color(random(255), random(255), random(255));
  }
  void setX(float xcoord) {
    x = xcoord;
  }
  void setY(float ycoord) {
    y = ycoord;
  }
  void changeX(float interval) {
    x = x + interval;
  }
  void changeY(float interval) {
    y = y + interval;
  }
  float getX() {
    return x;
  }
  float getY() {
    return y;
  }
  boolean getisDisplay() {
    return isDisplay;
  }
  void setDisplay(boolean b) {
    isDisplay = b;
  }
  void move() {
    float dx = mouseX - x;
    x += dx;
    float dy = mouseY - y;
    y += dy ;
  }

  void display() {
    if (isDisplay == true) {
      fill(c);
      circle(x, y, 10);
    }
  }
}
