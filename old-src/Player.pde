public class Player {
  int health;
  int income;
  int time; 
  
  public Player() {
    health = 150;
    income = 650;
  }
  
  Boolean isDead() {
    return health<=0;  
  }
  
  int changeIncome(int change) {
    income += change; 
    return income;
  }
  
  int attackIncome(Monkey monkey, Balloon balloon) { //adds to players income when balloon destroyed 
    float attack = monkey.getAttackStrength();
    int health = balloon.getHealth();
    if (health < attack) { //if attackStrength of monkey greater than balloon health, will only add balloon health to income so player won't recieve extra income   
      return income += health;  
    } else { //if balloon wasn't destroyed, will only add how many layers were popped(attackStrength) to income  
      return income += attack; 
    } 
  }
   
 int decreaseHealth(int change) { 
   health = health - change;
   if (health < 0) { //makes sure health doesn't go below 0 
     return 0;  
   }
   return health;
 }
 
 int roundIncome() { //how much income player gets per round
   income += 100;  
   return income;
 }
 int getIncome(){
   return income;
 }
 void setHealth(int h) {
   health = h;  
 }
  
}
