public class balloonList {
  ArrayList<Balloon> balloons;
  
  public balloonList() {
    balloons = new ArrayList<Balloon>();  
  }
  
  void add(Balloon balloon) {
    balloons.add(balloon);  
  }
  
  void display() {
    for (int index = 0; index < balloons.size(); index++) {
      balloons.get(index).display();  
    }
  }
  
  void processAll() {
    for (int index = 0; index < balloons.size(); index++) {
      balloons.get(index).followMap();  
    }
  }  
  
}
