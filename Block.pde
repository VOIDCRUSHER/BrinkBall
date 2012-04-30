public class Block extends GameObject {
  PVector blockSize;
  Block(int x, int y, int width, int height, int xVel, int yVel) {
    this.setPos(new PVector(x,y));
    this.setVel(new PVector(xVel, yVel));
    blockSize = new PVector();
    
    blockSize.x = width;
    blockSize.y = height;
  }
  void draw() {
    PVector pos = this.getPos();
    rect(pos.x, pos.y, blockSize.x, blockSize.y);
  }
  void tick(){
   PVector pos = this.getPos();
   PVector vel = this.getVel();
   pos.x += vel.x*(1/(float)fRate);
  }
}

