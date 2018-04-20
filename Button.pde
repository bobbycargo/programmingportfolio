class Button {
  int x, y, w, h, v; // Position and Dimmension and Value
  char o;
  boolean hov, num;   // Hover 

  // Constructors
  Button(int x, int y, int w, int h) {
    this.x = x; 
    this.y = y; 
    this.w = w; 
    this.h = h;
  }

  Button asNumber(int v) {
    num = true;
    this.v = v;
    return this;
  }

  Button asOperator(char o) {
    num = false;
    this.o = o;
    return this;
  }

  // Dispay
  void display() {
    fill(180, 180, 180, 80);
    noStroke();
    rect(x+3, y+3, w, h, 4);
    if (hov) {
      fill(150);
    } else {
      fill(180);
    }
    stroke(0);
    rect(x, y, w, h, 4);
    fill(0);
    textSize(14);
    if (num) {
      text(v, x+5, y+h-4);
    } else {
      if (o == 'n') {
        text("+/-", x+5, y+h-5);
      } else if (o == '/') {
        text("÷", x+5, y+h-5);
      } else if (o == 's') {
        text("sin", x+5, y+h-5);
      } else if (o == 'c') {
        text("cos", x+5, y+h-5);
      } else if (o == 't') {
        text("tan", x+5, y+h-5);
      } else if (o == 'E') {
        text("EE", x+5, y+h-5);
      } else {
        text(o, x+5, y+h-5);
      }
    }
  }

  // Click
  void over() {
    hov = mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h;
  }
}