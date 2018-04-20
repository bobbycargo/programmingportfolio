ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
Timer timer; 
Ship ship;
int totalRocks = 0;
int health = 100;
int pass = 0;
int rockRate = 600;
int level = 1;
int rockCount = 0;
int laserCount = 1;
int score = 0;

void setup() {
  size(400, 400);
  ship = new Ship(22);
  timer = new Timer(rockRate);
  timer.start();
}

void draw() {
  background(255);
  noCursor();
  if (frameCount % 100 == 90) {
    level++;
    rockRate-=10;
  }
  
  infoPanel();

  ship.setLocation(mouseX, mouseY);
  ship.display();
  if (timer.isFinished()) {
    rocks.add(new Rock());
    rockCount++;
    totalRocks++ ;
    timer.start();
  }

  for (int i = 0; i < totalRocks; i++ ) {
    Rock rock = rocks.get(i);
    if (ship.collide(rock)) {
      rock.hit();
      health--;
    } else {
      rock.move();
      rock.display();
    }
    if (rock.y > height+10) {
      rock.hit();
      pass++;
      //rocks.remove(i);
    }
    for (int j=0; j<lasers.size(); j++) {
      Laser laser = lasers.get(j);
      if (laser.collide(rock)) {
        rock.hit();
        score++;
      } else {
        laser.fire();
        laser.display();
      }
      if (laser.reachedTop()) {
        laser.miss();
        lasers.remove(j);
      }
    }
  }
}

void infoPanel() {
  fill(0);
  textAlign(LEFT);
  text("Score: " + score, 10, 325);
  text("Rocks: " + rockCount, 10, 340);
  text("Level: " + level, 10, 355);
  text("Health: " + health, 10, 370);
  text("Pass: " + pass, 10, 385);
}

void mouseReleased() {
  lasers.add(new Laser(ship.x, ship.y));
  laserCount++;
}