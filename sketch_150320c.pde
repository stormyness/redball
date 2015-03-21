float xval; 
float yval;
float xv;
float yv;



void setup() {
  
  size(400,400);
  background(0);
  strokeWeight(3);
  stroke(255);
  fill(255,0,0);
  
}

void draw() {
  println("xv: ", int(xv), " yv: ", int(yv));
  background(0);
  translate(200,200);
  ellipse(xval, yval, 20, 20);
  line(xval, yval, xval-xv*3, yval-yv*3);
  xval += xv;
  yval += yv;
  yv = yv + 1;
  
  if ( xval >= 190 ) {
    xval = 189;
    xv = xv*-0.7;
  }
  if (xval <= -190) {
    xval = -189;
    xv = xv*-0.7;
  }
  
  if (yval <= -190) {
    yval = -189;
    yv = yv*-0.7;
  }
  
  if (yval >= 190 ) {
    yval = 189;
    yv = yv*-0.7;
  }
  
  
 
}

void keyPressed() {
  if (keyCode == LEFT) {
    xv += -1;
  }
  
  if (keyCode == RIGHT) {
    xv += 1;
  }
  
  if (keyCode == DOWN) {
    yv += 1;
  }
  
  if (keyCode == UP) {
    yv += -30; 
  }
  
  if (key == 's') {
    xv = 0;
    yv = 0;
  }   
}
