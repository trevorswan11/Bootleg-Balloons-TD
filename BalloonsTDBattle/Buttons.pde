public class Buttons {
  float x;
  float y;
  float l;
  float w;
  int MODE;
  String caption;
  int modeLimit;
  color c;
  PImage p;
  boolean hasImage;
  

  public Buttons (float xcoord, float ycoord, String Caption, int limit, color colors) {
    x = xcoord;
    y = ycoord;
    l = 50;
    w = 50;
    MODE = 0;
    caption = Caption;
    modeLimit = limit;
    c = colors;
    hasImage = false;
  }
 
  public Buttons (float xcoord, float ycoord, PImage img, int limit, color colors) {
    x = xcoord;
    y = ycoord;
    l = 50;
    w = 50;
    MODE = 0;
    p = img;
    modeLimit = limit;
    c = colors;
    hasImage = true;
  }
  void display() {
    fill(c);
    rect(x, y, w, l);
    fill(0);
    textAlign(CENTER);
    if (hasImage == false) {
      text(caption, x + (w/2), y + (l/2));
    }
     else{
      image(p, x , y);
  }
}
void clicked( int xcoord, int ycoord) {
  if (xcoord > x && xcoord < x+w && ycoord > y && ycoord<y+l) {
    MODE++;
    if (MODE == modeLimit) {
      MODE = 0;
    }
  }
}
int getMode() {
  return MODE;
}
void setCaption(String c) {
  caption = c;
}

}
