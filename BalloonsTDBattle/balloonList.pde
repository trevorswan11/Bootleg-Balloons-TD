public class balloonList {
  ArrayList<Balloon> balloons;

  public balloonList() {
    balloons = new ArrayList<Balloon>();
  }

  void processAll() { //will make all balloons in map follow map and when it reaches end, subtract from health  
    for (int index = 0; index < balloons.size(); index++) {
      if (balloons.get(index).getHealth() > 0) { //if balloon is still alive 
        balloons.get(index).followMap();
        if (balloons.get(index).atEnd) {
          if (gameStart) { //if in normal, subtract balloon health from player health
            player.decreaseHealth(balloons.get(index).health);
          }
          balloons.remove(index);
          index--;
        }
      } else { //if balloon is destroyed remove it from balloons 
        balloons.remove(index);
        index--;
      }
    }
    if (roundOver == true && balloons.size() == 0) { //if roundOver == false and all balloons are destroyed on the map, current round is done 
      roundStart = false;
      roundOver = false;
      round++;
      player.roundIncome();
    }
  }

  void setNewBalloon(int index) { //changes balloons to new balloon after it is attacked
    Balloon balloon = balloons.get(index);
    int health = balloon.getHealth();
    if (health < 6) { //sets each balloon to new balloon based on the health 
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
    } else { //these balloons split into two diff balloons when attacked 
      if (balloon.image == ceramic) {
        if (health <= 94) { //ceramic needs to reach certain health to break 
          set(index, new rainbowBalloon(balloon));
          add(index, new rainbowBalloon(balloon));
        }
      } else if ((balloon.image == black || balloon.image == white)) {
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
        float[] newCords = balloons.get(index).getFuture(10); //makes it so 2nd balloon doesn't overlap old one, will go to its future cords 
        Balloon b = balloons.get(index); //setting new variables based on new cords 
        balloons.get(index).setX(newCords[0]);
        balloons.get(index).setY(newCords[1]);
        balloons.get(index).setNextCords(map.getDirection(b.directionsIndex));
        balloons.get(index).setDistanceX(b.nextCords[0] - b.currentX);
        balloons.get(index).setDistanceY(b.nextCords[1] - b.currentY);
      }
    }
  }

  int getBalloonAt(float x, float y) { //return balloon at given coordinates 
    for (int index = 0; index < balloons.size(); index++) {
      float distance_ = dist(x, y, balloons.get(index).currentX, balloons.get(index).currentY); //distance from balloon to cords
      float size_ = balloons.get(index).size;
      if (distance_ - size_ <= 0) { //if cords is in the balloon 
        return index;
      }
    }
    return -1; //found no balloon 
  }
  
  void display() { //loops and displays every balloon in list 
    for (int index = 0; index < balloons.size(); index++) {
      balloons.get(index).display();
    }
  }

  Balloon get(int index){
    return balloons.get(index);
  }
  
  int getIndex(Balloon b) { //returns index of given balloon 
    int result = -1; //if balloon not found defaults -1 
    for (int i = 0; i < balloons.size(); i ++) { //loops until finds given balloon 
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
    if (targetIndex >= 0 && balloons.get(targetIndex) != null) { //target exists, will remove it 
      balloons.remove(targetIndex);
    }
  }
  int size() {
    return balloons.size();
  }
}
