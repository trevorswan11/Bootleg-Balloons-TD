public class Buttons {
  float x;
  float y;
  float l;
  float w;
  String caption;
  color c;
  PImage p;
  int size = 10;
  boolean hasImage;

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

  void display() {
    hover(mouseX, mouseY);
    fill(c);
    rect(x, y-size/2, w, l);
    fill(0);
    if (hasImage == false) {
      textAlign(CENTER);
      textSize(size);
      text(caption, x + (w/2), y + (l/2));
    } else {
      image(p, x, y);
    }
  }

  public boolean clicked1(int xcoord, int ycoord) {
    if (xcoord > x && xcoord < x+w && ycoord > y && ycoord<y+l) {
      return true;
    } else {
      return false;
    }
  }

  boolean inRange(int x_, int y_) {
    return (x_ > x && x_ < x+w && y_ > y && y_ < y+l);
  }

  void hover(int x_, int y_) {
    if (inRange(x_, y_)) {
      c = 150;
    } else {
      c = 225;
    }
  }

  void resizeImage(int l, int w) {
    p.resize(l,w);
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
  PImage getImage() {
    return p;  
  }
  float getX() {
    return x;  
  }
  float getY() {
    return y;  
  }
}

public class balloonButton extends Buttons {
  Balloon b;

  public balloonButton(int x_, int y_, Balloon b_) {
    super(x_, y_, b_.getImage(), balloonSize, balloonSize, 255);
    b = b_;
  }

  public balloonButton(int x_, int y_, Balloon b_, int l_, int w_) {
    super(x_, y_, b_.getImage(), balloonSize, balloonSize, 255);
    b = b_;
    resizeImage(l_, w_);
  }

  void spawnBalloon() {
    if (inRange(mouseX, mouseY)) {
      balloons.add(new Balloon(b));
    }
  }

  void display() {
    fill(c);
    rect(x, y, w, l);
    if (b.getImage() == white || b.getImage() == black) {
      image(p, x+balloonSize/3, y);
    } else {
      image(p, x, y);
    }
  }
}

public class monkeyButton extends Buttons {
  Monkey m; 
  
   public monkeyButton(int x_, int y_, Monkey m_) {
    super(x_, y_, m_.getImage(), monkeySize, monkeySize, 255);
    m = m_;
   }
  
  public monkeyButton(int x_, int y_, Monkey m_, int l_, int w_) {
    super(x_, y_, m_.getImage(), monkeySize, monkeySize, 255);
    m = m_;
    resizeImage(l_, w_);
  }
    
  Monkey getMonkey() {
    return m;  
  }
  
  //void hover() {
  //  if (inRange(mouseX, mouseY)) {
  //    //display text of what the monkey does       
  //  }
  //}
  
  void display() {
    if (m.getPrice() <= player.getIncome()) {
      fill(c);
    } else {
      fill(#B22225);  
    }
    rect(x, y, w, l);
    image(p, x, y);
  }

  
}
