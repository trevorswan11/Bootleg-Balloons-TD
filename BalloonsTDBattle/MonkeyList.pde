public class MonkeyList {
  ArrayList<Monkey> monke;
  public MonkeyList() {
    monke = new ArrayList<Monkey>();
  }
  void set(Monkey oldMonkey, Monkey newMonkey){
  }
  void add(Monkey toBeAdded) {
    monke.add(toBeAdded);
  }

  void remove(int xcoord, int ycoord) {
    for (int i = 0; i < monke.size(); i++) {
      int compareX = monke.get(i).getX();
      int compareY = monke.get(i).getY();
      if (xcoord >= compareX && xcoord <= compareX+25 && ycoord >= compareY && ycoord <= compareY+25) {
        monke.remove(i);
      }
    }
  }
  void display() {
    for (int i = 0; i < monke.size(); i++) {
      monke.get(i).display();
    }
  }
}
