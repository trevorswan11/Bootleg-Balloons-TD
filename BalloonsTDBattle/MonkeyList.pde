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
        if (index > -1 && index < balloons.size() && balloons.get(index).getTarget() == false && (!(balloons.get(index).getFuture()[0] == -1 && balloons.get(index).getFuture()[0] == -1))) {
          current.throwWeapon(balloons.get(index));
          balloons.setNewBalloon(index);
        }
        if (current.thrown) {
          current.setThrown(false);
          current.setTargetBalloon(-1);
          current.weapon.setX(current.getX());
          current.weapon.setY(current.getY());
          current.resetTimer();
          current.setTargetBalloon(-1);
        }
      }
    }
  }

  void addMonkey(int buttonIndex) {
    if (buttonIndex != -1 && player.getIncome() > monkeyButtons.getMonkey(buttonIndex).getPrice() && balloons.size()==0) {
      PImage i = monkeyButtons.getMonkey(buttonIndex).getImage();
      Monkey m;
      if (i == dart) {
        m = new dartMonkey(monkeyButtons.get(buttonIndex).getX(), monkeyButtons.get(buttonIndex).getY());
      } else if (i == wizard) {
        m = new wizardMonkey(monkeyButtons.get(buttonIndex).getX(), monkeyButtons.get(buttonIndex).getY());
      } else {
        m = new sniperMonkey(monkeyButtons.get(buttonIndex).getX(), monkeyButtons.get(buttonIndex).getY());
      }
      monkeys.add(m);
      if (gameStart) {
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
  void remove(float xcoord, float ycoord) {
    for (int i = 0; i < monke.size(); i++) {
      float compareX = monke.get(i).getX();
      float compareY = monke.get(i).getY();
      if (xcoord >= compareX && xcoord <= compareX+25 && ycoord >= compareY && ycoord <= compareY+25) {
        monke.remove(i);
      }
    }
  }

  void sell(float x, float y) {
    int i = get(x, y);
    if (i > -1) {
      player.changeIncome((int)(get(i).price*0.795));
      remove(get(i));
    }
  }
  void sell(int index) {
    player.changeIncome((int)(monkeys.get(index).getPrice()*0.795));
    monkeys.remove(index);
  }

  void sell(Monkey m) {
    player.changeIncome((int)(m.price*0.795));
    remove(m);
  }

  public Monkey get(int index) {
    return monke.get(index);
  }

  public int get(float xcoord, float ycoord) {
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
