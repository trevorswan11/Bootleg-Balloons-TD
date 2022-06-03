public class MonkeyList {
  ArrayList<Monkey> monke;
  public MonkeyList() {
    monke = new ArrayList<Monkey>();
  }

  void processAll() {
    for (int i = 0; i < monke.size(); i++) {
      Monkey current =  monke.get(i);
      if (current.getTimer() !=  current.getAttackSpeed()) {
        current.addTimer(1);
      } else {
        current.setTimer(0);
        float coord[] = current.findBalloon(); //find the balloon
        int index =  balloons.getBalloonAt(coord[0], coord[1]); // find index of balloon
        if (index > -1) {
          current.throwWeapon(balloons.get(index));
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

  void remove(float xcoord, float ycoord) {
    for (int i = 0; i < monke.size(); i++) {
      float compareX = monke.get(i).getX();
      float compareY = monke.get(i).getY();
      if (xcoord >= compareX && xcoord <= compareX+25 && ycoord >= compareY && ycoord <= compareY+25) {
        monke.remove(i);
      }
    }
  }

  public Monkey get(int index) {
    return monke.get(index);
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
/*  void processAll() {
 for (int i = 0; i < monke.size(); i++) {
 Monkey current =  monke.get(i);
 if (current.getTimer() !=  current.getAttackSpeed()) {
 current.addTimer(1);
 } else {
 if (current.throwingWeapon == false) {
 current.setTimer(0);
 }
 float coord[] = current.findBalloon(); //find the balloon
 int index =  balloons.getBalloonAt(coord[0], coord[1]); // find index of balloon
 if (index > -1) {
 current.throwWeapon(balloons.get(index));
 } else {
 current.weapon.setX(current.getX());
 current.weapon.setY(current.getY());
 }
 }
 }
 }*/
