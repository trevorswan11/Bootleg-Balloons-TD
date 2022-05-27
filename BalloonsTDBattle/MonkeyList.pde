public class MonkeyList {
  ArrayList<Monkey> monke;
  public MonkeyList() {
    monke = new ArrayList<Monkey>();
  }
 void processAll(){
   for(int i = 0; i < monke.size(); i++){
     float coord[] = monke.get(i).findBalloon();
     monke.get(i).setX(coord[0]);
     monke.get(i).setY(coord[1]);
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
  public int size() {
    return monke.size();
  }
  public Monkey get(int index) {
    return monke.get(index);
  }

  void display() {
    for (int i = 0; i < monke.size(); i++) {
      monke.get(i).display();
    }
  }
}
