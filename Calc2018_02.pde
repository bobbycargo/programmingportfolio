Button[] numButtons = new Button[10]; //<>//
Button[] opButtons = new Button[14];
String ls, rs;
float ans;  // answer
char op;              // Operator
boolean left, eq;    // Left of Operator, After Equal is Hit

void setup() {
  size(470, 230);
  ls = "0";
  rs = "0";
  ans = 0.0;
  op = ' ';
  left = true;
  eq = false;
  numButtons[0] = new Button(10, 200, 85, 20).asNumber(0);
  numButtons[1] = new Button(10, 175, 40, 20).asNumber(1);
  numButtons[2] = new Button(55, 175, 40, 20).asNumber(2);
  numButtons[3] = new Button(100, 175, 40, 20).asNumber(3);
  numButtons[4] = new Button(10, 150, 40, 20).asNumber(4);
  numButtons[5] = new Button(55, 150, 40, 20).asNumber(5);
  numButtons[6] = new Button(100, 150, 40, 20).asNumber(6);
  numButtons[7] = new Button(10, 125, 40, 20).asNumber(7);
  numButtons[8] = new Button(55, 125, 40, 20).asNumber(8);
  numButtons[9] = new Button(100, 125, 40, 20).asNumber(9);

  opButtons[0] = new Button(10, 100, 40, 20).asOperator('C');
  opButtons[1] = new Button(55, 100, 40, 20).asOperator('n');
  opButtons[2] = new Button(100, 100, 40, 20).asOperator('%');
  opButtons[3] = new Button(145, 100, 40, 20).asOperator('/');
  opButtons[4] = new Button(145, 125, 40, 20).asOperator('*');
  opButtons[5] = new Button(145, 150, 40, 20).asOperator('-');
  opButtons[6] = new Button(145, 175, 40, 20).asOperator('+');
  opButtons[7] = new Button(145, 200, 40, 20).asOperator('=');
  opButtons[8] = new Button(190, 100, 40, 20).asOperator('s'); // sin
  opButtons[9] = new Button(190, 125, 40, 20).asOperator('c'); // cos
  opButtons[10] = new Button(190, 150, 40, 20).asOperator('t'); // tan
  opButtons[11] = new Button(190, 175, 40, 20).asOperator('e'); // e
  opButtons[12] = new Button(190, 200, 40, 20).asOperator('E'); // EE
  opButtons[13] = new Button(100, 200, 40, 20).asOperator('.');
}

void draw() {
  background(96, 108, 134);
  for (int i=0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].over();
  }
  for (int i=0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].over();
  }
  updateDisplay();
}

void mouseReleased() {
  // 
  for (int i=0; i<numButtons.length; i++) {
    if (numButtons[i].hov && left) {
      ls += numButtons[i].v;
    } else if (numButtons[i].hov && !left) {
      rs += numButtons[i].v;
    }
  }

  for (int i=0; i<opButtons.length; i++) {
    if (opButtons[i].hov && opButtons[i].o == '+') { 
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '-') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '*') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == '/') {
      left = false;
      op = opButtons[i].o;
      rs = "";
    } else if (opButtons[i].hov && opButtons[i].o == 'C') {
      performClear();
    } else if (opButtons[i].hov && opButtons[i].o == '=') {
      eq = true;
      performCalc();
    } else if (opButtons[i].hov && opButtons[i].o == 'n') {
      if (left) {
        ans = float(ls)*-1;
        ls = str((float)ans);
      } else {
        ans = float(rs)*-1;
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '%') {
      if (left) {
        ans = float(ls)*0.01;
        ls = str((float)ans);
      } else {
        ans = float(rs)*0.01;
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == 's') {
      if (left) {
        ans = sin(float(ls));
        ls = str((float)ans);
      } else {
        ans = sin(float(rs));
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == 'c') {
      if (left) {
        ans = cos(float(ls));
        ls = str((float)ans);
      } else {
        ans = cos(float(rs));
        rs = str((float)ans);
      }
    } else if (opButtons[i].hov && opButtons[i].o == '.') {
      if (left) {
        ls += opButtons[i].o;
      } else {
        rs += opButtons[i].o;
      }
    }
  }
}

void performCalc() {
  switch(op) {
  case '+': 
    ans = float(ls)+float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '-': 
    ans = float(ls)-float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '*': 
    ans = float(ls)*float(rs);
    ls = str((float)ans);
    left = true;
    break;
  case '/': 
    ans = float(ls)/float(rs);
    ls = str((float)ans);
    left = true;
    break;
  }
}

void performClear() {
  ls = "0"; 
  rs = "0";
  ans = 0.0;
  op = ' ';
  left = true;
  eq = false;
}

void updateDisplay() {
  fill(90, 100);
  noStroke();
  rect(13, 13, 450, 85, 4);
  fill(177);
  stroke(0);
  rect(10, 10, 450, 85, 4);
  fill(10);
  textSize(10);
  text("Eq: " + eq, 15, 25);
  text("Left: " + left, 15, 35);
  text("Op: " + op, 15, 45);
  text("ls: " + ls, 70, 25); 
  text("rs: " + rs, 70, 35);
  text("Ans: " + (float)ans, 70, 45);
  textSize(33);
  fill(255);
   if (eq) {
    text((float)ans, 15, 80);
  } else {
    if (left) {
      text(ls, 15, 80);
    } else {
      text(rs, 15, 80);
    }
  }
  eq = false;
}