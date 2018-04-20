class Laser {
  int fx,fy; // start fire pos
  int x, y;  // updated fire pos
  float speed; 
  color c;
  float r; 

  // Constructor 
  Laser(int x, int y) {
    r = 4; 
    this.x = x; 
    this.y = y; 
    speed = random(3, 5);    
    c = color(255, 0, 0); 
  }

  // Fires the Laser
  void fire() {
    y -= speed;
  }

  // Determine if Laser Leaves the Screen
  boolean reachedTop() {
    if (y < 0 + r*4) { 
      return true;
    } else {
      return false;
    }
  }

  // Draws the Laser
  void display() {
    fill(c);
    noStroke();
    for (int i = 2; i < r; i++ ) {
      rect(x, y-2,r,4);
    }
  }

  // Removes a Missed Laser
  void miss() {
    speed = 0; 
    y = -1000;
    x = -50;
  }
  
  // Detect Collision
  boolean collide(Rock rock) {
    float distance = dist(x, y, rock.x, rock.y); 
    if (distance < r + rock.r) { 
      return true;
    } else {
      return false;
    }
  }
}