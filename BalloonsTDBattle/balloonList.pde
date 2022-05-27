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
      if (balloons.get(index).atEnd) {
        balloons.remove(index);
        index--;
      }
    }
  }

  int getBalloonAt(int x, int y) {
    for (int index = 0; index < balloons.size(); index++) {
      float distance_ = dist(x, y, balloons.get(index).currentX, balloons.get(index).currentY);
      float size_ = balloonSize;
      if (distance_ - size_ <= 0) {
        return index;
      }
    }
    return -1;
  }

  void remove(int targetIndex) {
    if (targetIndex >= 0 && balloons.get(targetIndex) != null) {
      balloons.remove(targetIndex);
    }
  }
  Balloon get(int index) {
    return balloons.get(index);
  }
  int size() {
    return balloons.size();
  }
}
