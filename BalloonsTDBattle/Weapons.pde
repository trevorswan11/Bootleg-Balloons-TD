public class Weapons {
  color c;
  int x;
  int y;
  public Weapons(int xcoord, int ycoord) {
    x = xcoord;
    y = ycoord;
    c = color(random(255), random(255), random(255));
  }

  void changeX(int interval) {
    x = x + interval;
  }
  void changeY(int interval) {
    y = y + interval;
  }
  void display() {
    fill(c);
    circle(x, y, 5);
  }
}
