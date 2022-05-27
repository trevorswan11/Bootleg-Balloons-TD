public class Weapons {
  PImage image;
  int x;
  int y;
  public Weapons(int xcoord, int ycoord) {
    image = loadImage("dart.png");
    image.resize(25, 25);
    x = xcoord;
    y = ycoord;
  }

  void changeX(int interval) {
    x = x + interval;
  }
  void changeY(int interval) {
    y = y + interval;
  }
  void display() {
    image(image, x, y);
  }
}
