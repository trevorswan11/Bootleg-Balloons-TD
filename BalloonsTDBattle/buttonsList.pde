public class buttonsList {
  ArrayList<balloonButton> buttons;
  
  public buttonsList() {
    buttons = new ArrayList<balloonButton>();
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
  
  void spawnBalloon() {
    int i = findButtonAt(mouseX, mouseY); 
    if (i > -1) {
      buttons.get(i).spawnBalloon();  
    }
  }
  
  void add(balloonButton button) {
    buttons.add(button);
  }
  void add(int index, balloonButton button) {
    buttons.add(index, button);  
  }
  
}
