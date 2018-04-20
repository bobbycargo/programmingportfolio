class Ship {
  // Member Variables
  int r; 
  color col; 
  int x, y; 
  boolean enemy;

  // Constructor 
  Ship(int r) {
    this.r = r;
    col = color(50, 10, 10, 150);
    x = 0;
    y = 0;
  }

  // Updates Spaceship Location
  void setLocation(int x, int y) {
    this.x = x;
    this.y = y;
  }

  // Draw the Spaceship
  void display() {
    // Code to draw spaceship
     stroke(77);
    strokeWeight(3);
    line(x+15, y+10, x+15, y-10);
    line(x-15, y+10, x-15, y-10);
    
    fill(89);
    stroke(55);
    strokeWeight(2);
    line(x,y-20,x,y+20);
    rect(x-13,y+18,8,14);
    rect(x+3,y+18,8,14);
    
    fill(128);
    stroke(55);
    strokeWeight(2);
    quad(x, y-20, x+30, y+20, x, y+30, x-30, y+20);
    noStroke();
    fill(55);
    triangle(x,y-15,x,y,x-4,y);
    fill(166);
    triangle(x,y-15,x+4,y,x,y);
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