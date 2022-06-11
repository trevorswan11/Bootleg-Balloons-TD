public class MonkeyList {
  ArrayList<Monkey> monke;
  public MonkeyList() {
    monke = new ArrayList<Monkey>();
  }

  void processAll() {
    for (int i = 0; i < monke.size(); i++) {
      Monkey current =  monke.get(i);
      if (current.timer != current.attackSpeed) {
        current.increaseTimer();
      } else {
        float coord[] = current.findBalloon(); //find the balloon
        int index =  balloons.getBalloonAt(coord[0], coord[1]); // find index of balloon
        if (index > -1 && balloons.get(index).getTarget() == false) {
          current.throwWeapon(balloons.get(index));
          balloons.setNewBalloon(index);
        }
        if (current.thrown) {
          current.weapon.setX(current.getX());
          current.weapon.setY(current.getY());
          current.resetTimer();
          current.setThrown(false);
        }
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
  
  void sell(int x, int y) {
    int i = get(x, y);
    if (i > -1) {
      player.changeIncome((int)(get(i).price*0.795));
      remove(get(i));
    }
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
      if (xcoord >= compareX-50 && xcoord <= compareX+50 && ycoord >= compareY-50 && ycoord <= compareY+50) {
       result = i;
      }
    }
    return result;
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
