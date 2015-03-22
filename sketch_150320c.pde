

float xval; 
float yval;
float xv;
float yv;
int ms;
int particles = 49;

// particle effect class
class Exhaust {
  float xpos, ypos;
  float lifetime = 0 + random(-5, 5);
  Exhaust (float x, float y) {
    xpos = x;
    ypos = y;
  }
  void update() {
    noStroke();
    fill(255-2*lifetime, 0, 0);
    rect(xpos, ypos, 10-lifetime*0.1, 10-lifetime*0.1);
    lifetime+=random(0.1 , 1);
    if(lifetime >= 100)
    {
      xpos = xval;
      ypos = yval;
      lifetime = random(-100, 100);
    }  
  }
}
// particle exhaust effect
Exhaust e1[] = new Exhaust[particles];
  
void setup() {
  
  size(400,400);
  strokeWeight(3);
 for (int i = 0; i< particles; i++) {
   
    e1[i] = new Exhaust(xval + random(-5, 5), yval + random(-5, 5));
  }  
}

void draw() {
  // keeping track of time
  ms = millis();
  fill(255,0,0);
  stroke(255);
  println("xv: ", int(xv), " yv: ", int(yv));
  background(0);
  translate(200,200);
  ellipse(xval, yval, 20, 20);
  line(xval, yval, xval-xv*3, yval-yv*3);
  xval += xv;
  yval += yv;
  // if the ball is touching the ground, turn off gravity
  // to avoid bug related to clipping reposition
  if (yv < 190) {
    yv +=1;
  }
  

  // these next four if statements reflect 
  // the behavior of the ball when it reaches
  // the boundaries
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
  
  if (yval > 190.0 ) {
    yval = 190.0;
    yv = -yv*0.5;
  }
  
    
    // makes the ball eventually settle down;
    if (abs(yv) < 2 && yval >= 185)
      {
        yv = 0;
      
        // if ball has no vertical velocity and is touching 
        // the ground, it should slow down laterally
        // this is a crude simulation of surface friction
        xv = xv*0.98;
     
    }
    
    //update exhaust particle
    for(int i = 0; i < particles; i++){
      e1[i].update();
    }
}  

// Controls. Arrow keys add velocity in corresponding direction. 's' stops the ball.
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



    
      
