public class Monkey {
  Pimage image; //For creating the monkey image
  int attackSpeed;
  int attackRange;
  int attackStrength;
  int x; // The coordinates of the monkey
  int y;
  public Monkey() {
    attackSpeed = 10;
    attackRange = 10;
    attackStrength = 10;
  }
  public Monkey(int speed, int range, int strength, int xcoord, int ycoord) {
    attackSpeed = speed;
    attackRange = range;
    attackStrength = strength;
    x = xcoord;
    y = ycoord;
  }
}
