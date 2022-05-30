public class Weapons {
  color c;
  float x;
  float y;
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
  void display() {
    fill(c);
    circle(x, y, 10);
  }
}
