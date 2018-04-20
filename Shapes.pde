// runs one time
void setup() {
  size(650,550);
}

// runs on a loop    
void draw() {
  fill (255,255,0);
  rect(20,20,110,110);
  rect(180,20,110,110,7);
  rect(330,20,110,110,7,20,30,40);
  rect(500,20,120,70);
  fill(255,0,0);
  ellipse(80,250,110,110);
  ellipse(220,245,150,120);
  ellipse(375,250,85,110);
  fill(#1330E5);
  triangle(500,180,500,300,380,345);
}