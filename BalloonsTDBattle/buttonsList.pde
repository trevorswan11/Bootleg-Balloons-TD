public class buttonsList {
  ArrayList<Buttons> buttons;
  
  public buttonsList() {
    
  }
  
  
  void display() {
    for (int i = 0; i < buttons.size(); i++) {
      buttons.get(i).display();    
    }
  }
  Buttons findButtonAt(int x, int y) {
    for (int i = 0; i < buttons.size(); i++) {
      if (buttons.get(i).inRange(x, y)) {
        return buttons.get(i);
      }
    }
  }
  
  void add(Buttons button) {
    buttons.add(button);
  }
  void add(int index, Buttons button) {
    buttons.add(index, button);  
  }
}
