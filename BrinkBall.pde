import processing.opengl.*;

Game brinkball;
int fRate = 30;
int windowWidth = 800;
int windowHeight = 600;
int buffer = 100;
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
