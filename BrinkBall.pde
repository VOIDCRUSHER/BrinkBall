import processing.opengl.*;

Game brinkball;
int fRate = 30;
int windowWidth = 800;
int windowHeight = 600;
boolean right = false, left = false, up = false, down=false;

void setup() { 
  size(windowWidth, windowHeight, OPENGL);
  frameRate(fRate);
  brinkball = new Game();
  brinkball.init();
} 

void draw() { 
  background(0);
  brinkball.tick();
  brinkball.draw();
}

void keyPressed() {
  switch(keyCode) {
    case RIGHT: right = true; break;
    case LEFT: left = true; break;
    case UP: up = true; break;
    case DOWN: down = true; break;
  }
}
void keyReleased() {
  switch(keyCode) {
    case RIGHT: right = false; break;
    case LEFT: left = false; break;
    case UP: up = false; break;
    case DOWN: down = false; break;
  }
}
