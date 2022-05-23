final int ADD = 0;
final int DELETE = 1;
final int UPGRADE = 2;
MonkeyList monkeys;

int MODE = ADD;
int round = 1;

void setup() {
  size(1000, 800);
}

void draw() {
  //monkeys.display();
}
void mouseClicked() {
  monkeys.add(new Monkey(mouseX, mouseY));
  monkeys.display();
}
