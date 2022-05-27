public class Player {
  int health;
  int income;
  int points;
  int time; 
  
  public Player() {
    health = 150;
    income = 650;
  }
  
  int changeIncome(int change) {
    income = income + change; 
    return income;
  }
  
 int decreaseHealth() {
   health --;  
   return health;
 }
 
 int decreaseHealth(int change) {
   health = health - change;
   return health;
 }
  
  public timeIncome() {
    
  }
}
