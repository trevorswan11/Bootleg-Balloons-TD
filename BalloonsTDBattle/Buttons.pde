public class Buttons {
  float x;
  float y;
  float l;
  float w;
  String caption;
  color c = 255;
  PImage p;
  int size = 10;
  boolean hasImage;

  //constructor for button with words
  public Buttons (float x_, float y_, String caption_, int l_, int w_, int size_) {
    x = x_;
    y = y_;
    l = l_;
    w = w_;
    caption = caption_;
    size = size_;
    hasImage = false;
  }

  //constructor for button with image 
  public Buttons (float x_, float y_, PImage image_, int l_, int w_) {
    x = x_;
    y = y_;
    l = l_;
    w = w_;
    p = image_;
    hasImage = true;
  }

  void display() {
    hover();
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
  
  void hover() { //makes button darker if mouse hovers over 
    if (inRange()) {
      c = 150;
    } else {
      c = 225;
    }
  }

  boolean inRange() { //if mouse is inside the button, it'll return true 
    return (mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+l);
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

//like button class but with extra variable Balloon so it knows what to spawn when clicked 
public class balloonButton extends Buttons {
  Balloon b;

  public balloonButton(int x_, int y_, Balloon b_) {
    super(x_, y_, b_.getImage(), balloonSize, balloonSize);
    b = b_;
  }

  void spawnBalloon() { //if the button is in range, it'll spawn given balloon 
    if (inRange()) {
      balloons.add(new Balloon(b));
    }
  }

  void display() {
    fill(c);
    rect(x, y, w, l);
    if (b.getImage() == white || b.getImage() == black) { //white and black pngs different from other balloons
      image(p, x+balloonSize/3, y); //x+balloonSize/3 to center it 
    } else {
      image(p, x, y);
    }
  }
}

//like button class but with extra variable Monkey so it knows what to spawn when clicked 
public class monkeyButton extends Buttons {
  Monkey m; 
  
  public monkeyButton(int x_, int y_, Monkey m_) {
    super(x_, y_, m_.getImage(), monkeySize, monkeySize);
    m = m_;
  }
  
  public monkeyButton(int x_, int y_, Monkey m_, int l_, int w_) {
    super(x_, y_, m_.getImage(), monkeySize, monkeySize);
    m = m_;
    resizeImage(l_, w_);
  }
    
  Monkey getMonkey() {
    return m;  
  }
    
  void display() {
    if (m.getPrice() <= player.getIncome()) { //will display red button if player can't afford 
      fill(c);
    } else {
      fill(#B22225);  
    }
    rect(x, y, w, l);
    image(p, x, y);
  }
}
