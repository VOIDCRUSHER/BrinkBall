//BASE CLASS FOR ALL PLATFORMS IN THE GAME (derived from GameObjects)
public class Platform extends GameObject{
    
  Platform(int x, int y, int mywidth, int myheight, int xVel, int yVel) {
    super(x,y,mywidth,myheight,xVel,yVel);
  }
  Platform(){super();}
  void draw() {
    PVector pos = this.getPos();
    fill(mycolor);
    rect(pos.x, pos.y, mywidth, myheight);
  }
  
  
  void tick(){ move(); }
}
