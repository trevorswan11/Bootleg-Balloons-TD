public class balloonList {
  ArrayList<Balloon> balloons;

  public balloonList() {
    balloons = new ArrayList<Balloon>();
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
    if (roundOver == true && balloons.size() == 0) {
      roundStart = false;
      roundOver = false;
      round++;
      player.roundIncome();
    }
  }

  int getBalloonAt(float x, float y) {
    for (int index = 0; index < balloons.size(); index++) {
      float distance_ = dist(x, y, balloons.get(index).currentX, balloons.get(index).currentY);
      float size_ = balloons.get(index).size;
      if (distance_ - size_ <= 0) {
        return index;
      }
    }
    return -1;
  }

  void setNewBalloon(int index) {
    Balloon balloon = balloons.get(index);
    int health = balloon.getHealth();
    if (health < 6) {
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
    } else {
      if (balloon.image == ceramic) {
        if (health <= 94) {
          set(index, new rainbowBalloon(balloon));
          add(index, new rainbowBalloon(balloon));
        }
      } else if (balloon.image == black || balloon.image == white) {
        set(index, new pinkBalloon(balloon));
        add(index, new pinkBalloon(balloon));
      } else if (balloon.image == zebra) {
        set(index, new whiteBalloon(balloon));
        add(index, new blackBalloon(balloon));
      } else if (balloon.image == rainbow) {
        set(index, new zebraBalloon(balloon));
        add(index, new zebraBalloon(balloon));
      }
      if (!(balloon.image == ceramic && health > 94)) {
        float[] newCords = balloons.get(index).getFuture();
        Balloon b = balloons.get(index);
        balloons.get(index).setX(newCords[0]);
        balloons.get(index).setY(newCords[1]);
        balloons.get(index).setNextCords(map.getDirection(b.directionsIndex));
        balloons.get(index).setDistanceX(b.nextCords[0] - b.currentX);
        balloons.get(index).setDistanceY(b.nextCords[1] - b.currentY);
      }
    }
  }

  Balloon get(int index) {
    return balloons.get(index);
  }
  int getIndex(Balloon b) {
    int result = -1;
    for (int i = 0; i < balloons.size(); i ++) {
      if (b == balloons.get(i)) {
        result = i;
      }
    }
    return result;
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
