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
  ArrayList<balloonButton> buttons;

  public balloonButtonList() {
    buttons = new ArrayList<balloonButton>();
    add(new balloonButton(90, 700, new redBalloon()));
    add(new balloonButton(90, 700, new blueBalloon()));
    add(new balloonButton(90, 700, new greenBalloon()));
    add(new balloonButton(90, 700, new yellowBalloon()));
    add(new balloonButton(90, 700, new pinkBalloon()));
    add(new balloonButton(90, 700, new blackBalloon()));
    add(new balloonButton(90, 700, new whiteBalloon()));
    add(new balloonButton(90, 700, new zebraBalloon()));
    add(new balloonButton(90, 700, new leadBalloon()));
    add(new balloonButton(90, 700, new rainbowBalloon()));
    add(new balloonButton(90, 700, new ceramicBalloon()));
  }
  
  void spawnBalloon() {
    int i = findButtonAt(mouseX, mouseY); 
    if (i > -1) {
      buttons.get(i).spawnBalloon();  
    }
  }
}
