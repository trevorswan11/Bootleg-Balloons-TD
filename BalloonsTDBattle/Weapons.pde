public class Weapons {
  color c;
  float x;
  float y;
  public Weapons(float xcoord, float ycoord) {
    x = xcoord;
    y = ycoord;
    c = color(random(255), random(255), random(255));
  }
  public Weapons(float xcoord, float ycoord, color colors) {
    x = xcoord;
    y = ycoord;
    c = colors;
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
  void move() {
    float dx = mouseX - x;
    x += dx;
    float dy = mouseY - y;
    y += dy ;
  }

  void display() {
    fill(c);
    circle(x, y, 10);
  }
}
