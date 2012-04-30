public class Block extends GameObject {
  PVector blockSize;
  Block(int x, int y, int width, int height, int xVel, int yVel) {
    this.setPos(new PVector(x,y));
    this.setVel(new PVector(xVel, yVel));
    blockSize = new PVector();
    this.setAccel(new PVector(1,1));
    blockSize.x = width;
    blockSize.y = height;
    mycolor = color(128); //to change eventually
  }
  void draw() {
    PVector pos = this.getPos();
    fill(mycolor);
    rect(pos.x, pos.y, blockSize.x, blockSize.y);
  }
  void tick(){
   PVector pos = this.getPos();
   PVector vel = this.getVel();
   PVector accel = this.getAccel();
   pos.x += vel.x*(1/(float)fRate);
   pos.y += vel.y*(1/(float)fRate);
   vel.x += accel.x*(1/(float)fRate);
   vel.y += accel.y*(1/(float)fRate);
   
  }
}

