public class weaponList {
  ArrayList<Weapons> weapons;
  int timer;
  public weaponList() {
    weapons = new ArrayList<Weapons>();
    timer = 0;
  }
    }
  void set(Weapons oldWeapon, Weapons newWeapon) {
    for (int i = 0; i < weapons.size(); i++) {
      if (weapons.get(i) == oldWeapon) {
        monke.set(i, newWeapon);
      }
    }
  }
  void add(Weapons toBeAdded) {
    weapons.add(toBeAdded);
  } 
  public Weapons get(int index) {
    return weapons.get(index);
  }
}
