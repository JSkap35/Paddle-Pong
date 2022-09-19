float circlex, circley, speedX, speedY;
float rectSize = 200;
float diam = 20;
boolean ballMoving = false;

void setup() {
  circlex = height/2;
  circley = width/2;
  size(640, 360);
  background(255);
  reset();
}

void reset() {
  speedX = random(-5, 5);
  speedY = random(3, 5);
}

void draw() {
   
  background(255);
  
  fill(random(100, 255), random(100, 255), random(100, 255));;
  ellipse(circlex, circley, diam, diam);
  
  fill(0);
  rect(mouseX-rectSize/2, height-30, rectSize, 30);
  
  if (ballMoving) {
    circlex+=speedX;
    circley+=speedY;
  } else {
    circlex = width/2;
    circley = height/2;
  }
  
  //bar boundry
  
  if ( circley > height-30 && circley < height-20 && circlex >= mouseX-rectSize/2 && circlex <= mouseX + rectSize/2) {
    speedY = speedY * -1;
  } 
  
  if (circlex < 0 || circlex > width) {
    speedX *= -1;
    circlex += speedX;
  }

  // if ball hits up or down, change direction of Y   
  if ( circley > height || circley < 0 ) {
    speedY *= -1;
  }
  
  if (circley >= height) {
    ballMoving = false;
  }
}

void mousePressed() {
  ballMoving = true;
  reset();
}
