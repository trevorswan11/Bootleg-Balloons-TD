public class buttonsList {
  ArrayList<Buttons> buttons;
  
  public buttonsList() {
    buttons = new ArrayList<Buttons>();
  }
}

//subclass for spawning balloons buttons in freeplay 
public class balloonButtonList extends buttonsList {
  ArrayList<balloonButton> buttons_;
  //indicates where buttons will be placed 
  int xValue = 70;
  int yValue = 650;
  int spacing = 50;
  boolean shown = true; //to see if balloon buttons should be shown or monkey stats 

  public balloonButtonList() {
    buttons_ = new ArrayList<balloonButton>();
    //adds all buttons in freeplay for player to spawn 
    buttons_.add(new balloonButton(xValue, yValue, new redBalloon()));
    buttons_.add(new balloonButton(xValue+spacing, yValue, new blueBalloon()));
    buttons_.add(new balloonButton(xValue+(spacing*2), yValue, new greenBalloon()));
    buttons_.add(new balloonButton(xValue+(spacing*3), yValue, new yellowBalloon()));
    buttons_.add(new balloonButton(xValue+(spacing*4), yValue, new pinkBalloon()));
    buttons_.add(new balloonButton(xValue+(spacing*5), yValue, new blackBalloon()));
    buttons_.add(new balloonButton(xValue+(spacing*6), yValue, new whiteBalloon()));
    buttons_.add(new balloonButton(xValue+(spacing*7), yValue, new zebraBalloon()));
    buttons_.add(new balloonButton(xValue+(spacing*8), yValue, new rainbowBalloon()));
    buttons_.add(new balloonButton(xValue+(spacing*9), yValue, new ceramicBalloon()));
  }
    
  void display() { //displays all buttons 
    fill(0);
    text("SPAWN BALLOONS", 160, 630);
    for (int i = 0; i < buttons_.size(); i++) {
      buttons_.get(i).display();   
      buttons_.get(i).hover();
    }
  }
  
  int findButtonAt() { //finds button at mouseX, mouseY
    for (int i = 0; i < buttons_.size(); i++) {
      if (buttons_.get(i).inRange()) {
        return i;
      }
    }
    return -1; //if no button return -1 
  }
  
  void spawnBalloon() {  
    if (shown) { //if buttons are active
      int i = findButtonAt();
      if (i > -1) { //if button is clicked on, will spawn balloon 
        buttons_.get(i).spawnBalloon();  
      }
    }
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

//subclass for choosing which monkey to buy 
public class monkeyButtonList extends buttonsList {
  ArrayList<monkeyButton> buttons_;
  //indicates where buttons will be placed
  int xValue = 830;
  int yValue = 100;
  int spacing = 70;

  public monkeyButtonList() {
    buttons_ = new ArrayList<monkeyButton>();
    //adds all monkeys to side bar for player to spawn 
    buttons_.add(new monkeyButton(xValue, yValue, new ninjaMonkey(0, 0)));
    buttons_.add(new monkeyButton(xValue+spacing, yValue, new wizardMonkey(0, 0)));
    buttons_.add(new monkeyButton(xValue, yValue+spacing, new sniperMonkey(0, 0)));
    buttons_.add(new monkeyButton(xValue+spacing, yValue+spacing, new waterMonkey(0, 0)));
   
  }
    
  void display() { //displays all buttons 
    fill(0);
    for (int i = 0; i < buttons_.size(); i++) {
      buttons_.get(i).display();  
      buttons_.get(i).hover();
    }
  }
  
  int findButtonAt() { //finds buttons in mouseX, mouseY 
    for (int i = 0; i < buttons_.size(); i++) {
      if (buttons_.get(i).inRange()) {
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
