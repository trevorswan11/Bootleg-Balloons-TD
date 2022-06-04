public class Rounds{
  final int RED = 0;
  final int BLUE = 1;
  final int GREEN = 2;
  final int YELLOW = 3;
  final int PINK = 4;
  final int BLACK = 5;
  final int WHITE = 6;
  final int ZEBRA = 7;
  final int LEAD = 8;
  final int RAINBOW = 9;
  final int CERAMIC = 10;
    
  int[][][] rounds = new int[][][]{ 
    //{ballonType, how many of each balloon, how much time between each}
    {{RED, 20, 35}},
    {{RED, 30, 30}},
    {{RED, 10, 30}, {BLUE, 5, 30}, {RED, 10, 30}},
    {{RED, 20, 30}, {BLUE, 15, 30}, {RED, 10, 30}},
    {{BLUE, 15, 10}, {RED, 5, 25}, {BLUE, 10, 10}},
    {{GREEN, 4, 30}, {RED, 15, 30}, {BLUE, 15, 30}},
    {{BLUE, 10, 25}, {GREEN, 5, 20}, {RED, 20, 20}, {BLUE, 15, 25}},
    {{RED, 20, 20}, {BLUE, 20, 15}, {GREEN, 14, 20}},
    {{GREEN, 30, 20}},
    {{BLUE, 102, 20}},
    {{RED, 10, 25}, {BLUE, 10, 15}, {GREEN, 12, 20}, {YELLOW, 2, 20}},
    {{BLUE, 15, 15}, {GREEN, 10, 20}, {YELLOW, 5, 20}},
    {{RED, 100, 10}, {GREEN, 23, 20}, {YELLOW, 4, 20}},
    {{RED, 50, 10}, {BLUE, 15, 10}, {GREEN, 10, 20}, {YELLOW, 9, 10}},
    {{RED, 20, 10},{GREEN, 12, 15}, {YELLOW, 5, 10}, {PINK, 3, 10}}
};
  
  int[][] currentRound = rounds[round];
  int index = 0;
  int currentBalloon = currentRound[index][0];
  int numberOfBalloons = currentRound[index][1];
  int wait = currentRound[index][2];
  int timer = 0;
  
  public Rounds() {  
  }
  
  void runRound() {
    if (index < currentRound.length) {
      if (numberOfBalloons >= 0) {
        if (timer < wait) {
          timer++;  
        } else {
          addBalloon(currentBalloon);
          numberOfBalloons--;
          timer = 0;
        }
      } else {
        if (index == currentRound.length-1) {
          index = 0;
          roundOver = true;
          if (round < rounds.length-1) {
            currentRound = rounds[round+1];
          }
        } else {
          index++;
        }
        currentBalloon = currentRound[index][0];
        numberOfBalloons = currentRound[index][1];
        wait = currentRound[index][2];
        timer = 0;
      }
    }    
  }
  
  void addBalloon(int b) {
    if (b == RED) {
      balloons.add(new redBalloon());  
    } else if (b == BLUE) {
      balloons.add(new blueBalloon());  
    } else if (b == GREEN) {
      balloons.add(new greenBalloon());
    } else if (b == YELLOW) {
      balloons.add(new yellowBalloon());
    } else if (b == PINK) {
      balloons.add(new pinkBalloon());
    } else if (b == BLACK) {
      balloons.add(new blackBalloon());
    } else if (b == WHITE) {
      balloons.add(new whiteBalloon());
    } else if (b == ZEBRA) {
      balloons.add(new zebraBalloon());
    } else if (b == LEAD) {
      balloons.add(new leadBalloon());
    } else if (b == RAINBOW) {
      balloons.add(new rainbowBalloon());
    } else if (b == CERAMIC) {
      balloons.add(new ceramicBalloon());
    } 
  }
  
}
