class Rock {
  // Member Variables
  int x, y; 
  int speed; 
  color c;
  int r; 
  int health;

  // Constructor 
  Rock() {
    r = int(random(15,30)); 
    x = int(random(width)); 
    y = -r*4; 
    speed = int(random(1, 3));    
    c = color(50, 100, 150); 
    health = 10;
  }

  // Move Down the Screen
  void move() {
    y += speed;
  }

  // Detect if Rock Passes 
  boolean reachedBottom() {
    if (y > height + r*4) { 
      return true;
    } else {
      return false;
    }
  }

  // Draw the Rock
  void display() {
    fill(c);
    noStroke();
    ellipse(x,y,r,r);
    fill(255);
    textSize(9);
    textAlign(CENTER);
    text(health,x,y+5);
  }

  // Determine if Rock is Hit
  void hit() {
    speed = 0; 
    y = -1000;
    x = -50;
  }
}