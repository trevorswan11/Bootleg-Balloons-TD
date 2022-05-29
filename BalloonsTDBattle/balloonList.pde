public class balloonList {
  ArrayList<Balloon> balloons;
  int timer = 0;
  
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
      if (balloons.get(index).getHealth() > 0) {
        balloons.get(index).followMap();
        if (balloons.get(index).atEnd) {
          player.decreaseHealth(balloons.get(index).health);
          balloons.remove(index);
          index--;
        }
      } else {
        balloons.remove(index);
        index--;
      }
    }
  }
  
  void addBalloons() {
    if (timer < round*60*5) {
      if (timer%25 == 0) {
        balloons.add(new Balloon());  
      }
      timer++;
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

  
  
}
