public class Player {
  int health;
  int income;
  int points;
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
  
  int attackIncome(Monkey monkey, Balloon balloon) {
    int attack = monkey.getAttackStrength();
    int health = balloon.getHealth();
    int change = attack-health;
    return income += health+change;
  }
  
 int decreaseHealth() {
   health --;  
   if (health < 0) {
     return 0;  
   }
   return health;
 }
 
 int decreaseHealth(int change) {
   health = health - change;
   if (health < 0) {
     return 0;  
   }
   return health;
 }
 
 int roundIncome() {
   income += 100;  
   return income;
 }
  
}
