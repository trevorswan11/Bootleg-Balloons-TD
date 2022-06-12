public class MonkeyList {
  ArrayList<Monkey> monke;
  int showStats = -1;

  public MonkeyList() {
    monke = new ArrayList<Monkey>();
  }

  void processAll() {
    for (int i = 0; i < monke.size(); i++) {
      Monkey current =  monke.get(i);
      if (current.timer != current.attackSpeed) {
        current.increaseTimer();
      } else if (current.getTargetBalloon() == -1) {
        float coord[] = monke.get(i).findBalloon();
        current.setTargetBalloon(balloons.getBalloonAt(coord[0], coord[1]));
      } else {
        int index = current.getTargetBalloon();
        if (index > -1 && index < balloons.size() && (!(balloons.get(index).getFuture()[0] == -1 && balloons.get(index).getFuture()[0] == -1))) {
          current.throwWeapon(balloons.get(index));
        }
        if (current.thrown) {
          balloons.setNewBalloon(index);
          current.setThrown(false);
          current.setTargetBalloon(-1);
          current.resetTimer();
          current.setTargetBalloon(-1);
        }
      }
    }
  }

  void addMonkey(int buttonIndex) {
    if (buttonIndex != -1 && player.getIncome() > monkeyButtons.getMonkey(buttonIndex).getPrice()) { //checks if player can afford monkey and if button was clicked 
      PImage i = monkeyButtons.getMonkey(buttonIndex).getImage();
      Monkey m;
      //checks image of monkey to add correct monkey subclass to monkeys
      if (i == ninja) {
        m = new ninjaMonkey(monkeyButtons.get(buttonIndex).getX(), monkeyButtons.get(buttonIndex).getY());
      } else if (i == wizard) {
        m = new wizardMonkey(monkeyButtons.get(buttonIndex).getX(), monkeyButtons.get(buttonIndex).getY());
      } else if (i == water) {
        m = new waterMonkey(monkeyButtons.get(buttonIndex).getX(), monkeyButtons.get(buttonIndex).getY());
      } else {
        m = new sniperMonkey(monkeyButtons.get(buttonIndex).getX(), monkeyButtons.get(buttonIndex).getY());
      }
      monkeys.add(m);
      if (gameStart) { //if in normal gameMode, will subtract from income 
        player.changeIncome(m.getPrice() * -1);
      }
    }
  }

  void set(Monkey oldMonkey, Monkey newMonkey) {
    for (int i = 0; i < monke.size(); i++) {
      if (monke.get(i) == oldMonkey) {
        monke.set(i, newMonkey);
      }
    }
  }
  void add(Monkey toBeAdded) {
    monke.add(toBeAdded);
  }
  void remove(int i) {
    monke.remove(i);
  }
  void remove(Monkey e) {
    monke.remove(e);
  }
  void sell(int index) {
    if (gameStart) { //if in normal gameMode, will add to income 
      player.changeIncome((int)(monkeys.get(index).getPrice()*0.795));
    }
    monkeys.remove(index);
  }

  Monkey get(int index) {
    return monke.get(index);
  }
  int get(float xcoord, float ycoord) {
    int result = -1;
    for (int i = 0; i < monke.size(); i++) {
      float compareX = monke.get(i).getX();
      float compareY = monke.get(i).getY();
      if (xcoord >= compareX-monkeySize && xcoord <= compareX+monkeySize && ycoord >= compareY-monkeySize && ycoord <= compareY+monkeySize) {
        result = i;
      }
    }
    return result;
  }


  void setShowStats(int b) {
    showStats = b;
  }
  void displayStats() {
    monkeys.get(showStats).showStats();
  }

  void display() {
    for (int i = 0; i < monke.size(); i++) {
      monke.get(i).display();
    }
  }
  int size() {
    return monke.size();
  }
}
