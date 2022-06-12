public class Rounds{
  //int values to represent balloons so I can put them in an int array
  final int RED = 0;
  final int BLUE = 1;
  final int GREEN = 2;
  final int YELLOW = 3;
  final int PINK = 4;
  final int BLACK = 5;
  final int WHITE = 6;
  final int ZEBRA = 7;
  final int RAINBOW = 8;
  final int CERAMIC = 9;
    
  int[][][] rounds = new int[][][]{ 
    //{ballonType, how many of each balloon, how much time between each balloon should the next be spawned}
    {{RED, 20, 35}}, //round1 
    {{RED, 30, 30}}, //round2 
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
    {{RED, 20, 10},{GREEN, 12, 15}, {YELLOW, 5, 10}, {PINK, 3, 10}},
    {{GREEN, 20, 10}, {YELLOW, 8, 15}, {PINK, 4, 10}},
    {{YELLOW, 8, 10}},
    {{GREEN, 80, 15}},
    {{GREEN, 10, 15}, {YELLOW, 4, 15}, {YELLOW, 5, 10}, {PINK, 7, 15}},
    {{BLACK, 6, 20}},
    {{PINK, 14, 15}},
    {{WHITE, 8, 20}},
    {{BLACK, 5, 15}, {WHITE, 4, 20}},
    {{GREEN, 100, 10}},
    {{YELLOW, 31, 10}},
    {{PINK, 23, 15}, {ZEBRA, 4, 20}},
    {{RED, 120, 10}, {BLUE, 55, 10}, {GREEN, 45, 10}, {YELLOW, 45, 10}},
    {{YELLOW, 25, 10}, {PINK, 12, 15}},
    {{ZEBRA, 8, 20}, {ZEBRA, 2, 15}},
    {{BLACK, 8, 10}, {WHITE, 28, 10}},
    {{YELLOW, 20, 8}},
    {{YELLOW, 140, 10}, {ZEBRA, 5, 15}},
    {{PINK, 35, 10}, {WHITE, 25, 10}, {RAINBOW, 25, 20}},
    {{PINK, 81, 10}},
    {{BLACK, 20, 10}, {WHITE, 20, 10}, {ZEBRA, 10, 15}},
    {{PINK, 42, 8}, {WHITE, 17, 10}, {RAINBOW, 4, 20}},
    {{RAINBOW, 10, 15}, {CERAMIC, 4, 20}}
  };
  
  int[][] currentRound = rounds[round];
  int index = 0;
  int timer = 0;
  int currentBalloon = currentRound[index][0];
  int numberOfBalloons = currentRound[index][1];
  int wait = currentRound[index][2]; 
  
  public Rounds() {  
    
  }
  
  void runRound() { //while currentRound is still in motion, run 
    if (index < currentRound.length) {
      if (numberOfBalloons >= 0) {
        if (timer < wait) { //will add next balloon after wait time 
          timer++;  
        } else { //adds balloon and starts over until numberOfBalloons == 0  
          addBalloon(currentBalloon);
          numberOfBalloons--;
          timer = 0; //resets timer to add the next balloons 
        }
      } else {
        if (index == currentRound.length-1) { //when reaches the end of the round 
          index = 0;
          roundOver = true;
          if (round < rounds.length-1) {
            currentRound = rounds[round+1];
          }
        } else {
          index++;
        }
        //sets up variables for next balloons in the round 
        currentBalloon = currentRound[index][0];
        numberOfBalloons = currentRound[index][1];
        wait = currentRound[index][2];
        timer = 0;
      }
    }    
  }
  
  void addBalloon(int b) { //based on what int, will add specific balloon to balloons
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
    } else if (b == RAINBOW) {
      balloons.add(new rainbowBalloon());
    } else if (b == CERAMIC) {
      balloons.add(new ceramicBalloon());
    } 
  }
  
}
