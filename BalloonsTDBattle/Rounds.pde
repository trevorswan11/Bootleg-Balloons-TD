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
    {{RED, 10, 2}},
    {{RED, 20, 2}},
    {{RED, 10, 2}, {BLUE, 5, 2}}
  };
  
}
