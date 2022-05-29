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
    income = income + change; 
    return income;
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
   income = income+100*(int)(round*1.25);  
   return income;
 }
  
}
