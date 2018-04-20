int x = 0;
int y =0;

void setup() {
  size(1000, 1000);
}

void draw() {
  line(0, y, width, y);
  line(x, 0, x, height);
  text(x, x+7, 15);
  text(y, 7, y+15);
  x = x + 100;
  y = y + 100;
}