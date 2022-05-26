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
  
  int getBalloonAt(int x, int y) {
    for (int index = 0; index < map.getDirectionsSize(); index++) {
      float distance_ = dist(x, y, balloons.get(index).currentX, balloons.get(index).currentY);
      float size_ = balloon.size;
      if (distance_ - size_ <= 0) {
        return index;
      }
    }
    return -1;
  }
  
  
}
