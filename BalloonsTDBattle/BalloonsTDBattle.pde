final int ADD = 0;
final int DELETE = 1;
final int UPGRADE = 2;

int MODE = ADD;
int round = 1;

void setup() {
  size(1000, 800);
}

void draw() {
  //M.display();
}
void mouseClicked() {
  Monkey M = new Monkey(mouseX, mouseY);
  M.display();
}
