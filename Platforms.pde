//BASE CLASS FOR ALL PLATFORMS IN THE GAME (derived from GameObjects)
public class Platform extends GameObject{
    PVector platformSize;
  Platform(int x, int y, int width, int height, int xVel, int yVel) {
    this.setPos(new PVector(x,y));
    this.setVel(new PVector(xVel, yVel));
    platformSize = new PVector();
    this.setAccel(new PVector(1,1));
    platformSize.x = width;
    platformSize.y = height;
    mycolor = color(128); //to change eventually
  }
  void draw() {
    PVector pos = this.getPos();
    fill(mycolor);
    rect(pos.x, pos.y, platformSize.x, platformSize.y);
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
