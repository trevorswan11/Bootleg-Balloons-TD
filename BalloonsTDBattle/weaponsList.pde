public class weaponList {
  ArrayList<Weapons> weapons;
  int timer;
  public weaponList() {
    weapons = new ArrayList<Weapons>();
    timer = 0;
  }
  void display() {
    for (int i = 0; i < weapons.size(); i++) {
      weapons.get(i).display();
    }
  }
  void set(Weapons oldWeapon, Weapons newWeapon) {
    for (int i = 0; i < weapons.size(); i++) {
      if (weapons.get(i) == oldWeapon) {
        weapons.set(i, newWeapon);
      }
    }
  }
  void add(Weapons toBeAdded) {
    weapons.add(toBeAdded);
  }
  public Weapons get(int index) {
    return weapons.get(index);
  }
  void remove(int targetIndex) {
    weapons.remove(targetIndex);
  }
  void remove(Weapons w) {
    weapons.remove(w);
  }
  int size() {
    return weapons.size();
  }
}
