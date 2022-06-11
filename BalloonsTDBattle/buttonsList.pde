public class buttonsList {
  ArrayList<Buttons> buttons;
  
  public buttonsList() {
    buttons = new ArrayList<Buttons>();
  }
  
  void display() {
    for (int i = 0; i < buttons.size(); i++) {
      buttons.get(i).display();    
    }
  }
  int findButtonAt(int x, int y) {
    for (int i = 0; i < buttons.size(); i++) {
      if (buttons.get(i).inRange(x, y)) {
        return i;
      }
    }
    return -1;
  }
  
  void add(Buttons button) {
    buttons.add(button);
  }
  void add(int index, Buttons button) {
    buttons.add(index, button);  
  }
}

public class balloonButtonList extends buttonsList {
  ArrayList<balloonButton> buttons_;
  int xValue = 70;
  int yValue = 650;
  int spacing = 50;
  boolean shown = true; 

  public balloonButtonList() {
    buttons_ = new ArrayList<balloonButton>();
    buttons_.add(new balloonButton(xValue, yValue, new redBalloon()));
    buttons_.add(new balloonButton(xValue+spacing, yValue, new blueBalloon()));
    buttons_.add(new balloonButton(xValue+(spacing*2), yValue, new greenBalloon()));
    buttons_.add(new balloonButton(xValue+(spacing*3), yValue, new yellowBalloon()));
    buttons_.add(new balloonButton(xValue+(spacing*4), yValue, new pinkBalloon()));
    buttons_.add(new balloonButton(xValue+(spacing*5), yValue, new blackBalloon()));
    buttons_.add(new balloonButton(xValue+(spacing*6), yValue, new whiteBalloon()));
    buttons_.add(new balloonButton(xValue+(spacing*7), yValue, new zebraBalloon()));
    buttons_.add(new balloonButton(xValue+(spacing*8), yValue, new leadBalloon()));
    buttons_.add(new balloonButton(xValue+(spacing*9), yValue, new rainbowBalloon()));
    buttons_.add(new balloonButton(xValue+(spacing*10), yValue, new ceramicBalloon()));
  }
  
  void spawnBalloon() {
    if (shown) {
      int i = findButtonAt(mouseX, mouseY); 
      if (i > -1) {
        buttons_.get(i).spawnBalloon();  
      }
    }
  }
  
  void display() {
    fill(0);
    text("SPAWN BALLOONS", 160, 630);
    for (int i = 0; i < buttons_.size(); i++) {
      buttons_.get(i).display();   
      buttons_.get(i).hover(mouseX, mouseY);
    }
  }
  int findButtonAt(int x, int y) {
    for (int i = 0; i < buttons_.size(); i++) {
      if (buttons_.get(i).inRange(x, y)) {
        return i;
      }
    }
    return -1;
  }
  
  void add(balloonButton button) {
    buttons_.add(button);
  }
  void add(int index, balloonButton button) {
    buttons_.add(index, button);  
  }
  void setShown(Boolean b) {
    shown = b;  
  }
}

public class monkeyButtonList extends buttonsList {
  ArrayList<monkeyButton> buttons_;
  int xValue = 820;
  int yValue = 100;
  int spacing = 70;
  int size = 40;

  public monkeyButtonList() {
    buttons_ = new ArrayList<monkeyButton>();
    buttons_.add(new monkeyButton(xValue, yValue, new dartMonkey(0, 0)));
    buttons_.add(new monkeyButton(xValue+spacing, yValue, new wizardMonkey(0, 0)));
    buttons_.add(new monkeyButton(xValue, yValue+spacing, new sniperMonkey(0, 0)));
   
  }
    
  void display() {
    fill(0);
    for (int i = 0; i < buttons_.size(); i++) {
      buttons_.get(i).display();  
      buttons_.get(i).hover(mouseX, mouseY);
    }
  }
  
  int findButtonAt(int x, int y) {
    for (int i = 0; i < buttons_.size(); i++) {
      if (buttons_.get(i).inRange(x, y)) {
        return i;
      }
    }
    return -1;
  }
  
  void add(monkeyButton button) {
    buttons_.add(button);
  }
  void add(int index, monkeyButton button) {
    buttons_.add(index, button);  
  }
  monkeyButton get(int index) {
    return buttons_.get(index);  
  }
  Monkey getMonkey(int index) {
    return monkeyButtons.get(index).getMonkey();
  }
}
