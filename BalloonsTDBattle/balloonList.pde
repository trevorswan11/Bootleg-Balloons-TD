public class balloonList {
  ArrayList<Balloon> balloons;
  int timer;

  public balloonList() {
    balloons = new ArrayList<Balloon>();
    timer = round*60*5;
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
    if (timer == 0 && balloons.size() == 0) {
      roundStart = false;
      round++;
      timer = round*60*5;
    }
  }

  void addBalloons() {
    if (timer > 0) {
      if (timer%25 == 0) {
        balloons.add(new pinkBalloon());
      }
      timer--;
    }
  }

  int getBalloonAt(float x, float y) {
    for (int index = 0; index < balloons.size(); index++) {
      float distance_ = dist(x, y, balloons.get(index).currentX, balloons.get(index).currentY);
      float size_ = balloonSize;
      if (distance_ - size_ <= 0) {
        return index;
      }
    }
    return -1;
  }
  
  void setNewBalloon(int index) {
    Balloon balloon = balloons.get(index);
    int health = balloon.getHealth();
    if (health == 1) {
      set(index, new redBalloon(balloon));
    } else if (health == 2) {
      set(index, new blueBalloon(balloon));
    } else if (health == 3) {
      set(index, new greenBalloon(balloon));
    } else if (health == 4) {
      set(index, new yellowBalloon(balloon));
    } else if (health == 5) {
      set(index, new pinkBalloon(balloon));
    }
  }
  
  Balloon get(int index){
    return balloons.get(index);
  }
  void add(Balloon balloon) {
    balloons.add(balloon);
  }
  void add(int index, Balloon balloon) {
    balloons.add(index, balloon);  
  }
  void set(int index, Balloon balloon) {
    balloons.set(index, balloon);  
  }
  void remove(int targetIndex) {
    if (targetIndex >= 0 && balloons.get(targetIndex) != null) {
      balloons.remove(targetIndex);
    }
  }
  int size() {
    return balloons.size();
  }
}
