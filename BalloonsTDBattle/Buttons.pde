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
  int size = 10;
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
  
  public Buttons (float x_, float y_, String caption_, int l_, int w_, int size_, color colors_) {
    x = x_;
    y = y_;
    l = l_;
    w = w_;
    caption = caption_;
    c = colors_;
    size = size_;
    hasImage = false;
  }
  
  public Buttons (float x_, float y_, PImage image_, int l_, int w_, color colors_) {
    x = x_;
    y = y_;
    l = l_;
    w = w_;
    p = image_;
    c = colors_;
    hasImage = true;
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
    hover(mouseX, mouseY);
    fill(c);
    rect(x, y, w, l);
    fill(0);
    if (hasImage == false) {
      textAlign(CENTER);
      textSize(size);
      text(caption, x + (w/2), y + (l/2));
    } else{
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

boolean inRange(int x_, int y_) {
  return (x_ > x && x_ < x+w && y_ > y && y_ < y+l);
}

void hover(int x_, int y_) {
  if (inRange(x_, y_)) {
    c = 200;
  } else {
    c = 225;  
  }
}

int getMode() {
  return MODE;
}
void setCaption(String c) {
  caption = c;
}
void setColor(color c_) {
  c = c_;  
}
void setImage(PImage image_) {
  p = image_;  
}
}

public class balloonButton extends Buttons {
  Balloon b;
  PImage image; 
  
  public balloonButton(int x_, int y_, Balloon b_) {
    super(x_, y_, b_.getImage(), balloonSize, balloonSize, 255);
    b = b_;
  }
  
  void display() {
      
  }
}
