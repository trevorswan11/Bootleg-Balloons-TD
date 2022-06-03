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
    {{RED, 20, 10}},
    {{RED, 30, 10}},
    {{RED, 20, 10}, {BLUE, 5, 10}}
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
