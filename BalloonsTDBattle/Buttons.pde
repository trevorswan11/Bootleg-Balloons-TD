public class Buttons {
  float x;
  float y;
  float l;
  float w;
  int MODE;
  String caption;
  int modeLimit;

  public Buttons (float xcoord, float ycoord, String Caption, int limit) {
    x = xcoord;
    y = ycoord;
    l = 50;
    w = 50;
    MODE = 0;
    caption = Caption;
    modeLimit = limit;
  }
  void display() {
    fill(#C3E3DA);
    rect(x, y, w, l);
    fill(0);
    textAlign(CENTER);
    text(caption, x + (w/2), y + (l/2));
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
  void setCaption(String c){
    caption = c;
  }
  
}
