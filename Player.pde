//PLAYER CLASS FOR ALL SPECIAL ITEMS IN THE GAME (derived from GameObjects)
public class Player extends GameObject{
  ArrayList<GameObject> gameobjects;
  Player(int x, int y, ArrayList<GameObject> gameobjects) {
    super(x,y,10,10,0,0);
    mycolor = color(250, 0, 0);
    this.setAccel(0,2);
    this.gameobjects = gameobjects;
  }

  void draw() {
    PVector pos = this.getPos();
    fill(mycolor);
    rect(pos.x, pos.y, mywidth, myheight);
  }
  void tick() {
    for (GameObject gO: gameobjects)
      if (gO.collidesWith(this)) {
        this.getPos().y = gO.getPos().y - this.myheight;
        this.setVel(new PVector(gO.getVel().x, gO.getVel().y));
        //this.getPos().y += gO.getVel().y*(1/(float)fRate);
        //print("intersects");
        return;
      }

    PVector pos = this.getPos();
    if (right)
      this.getVel().x++;
    if (left)
      this.getVel().x--;
    if (up)
      this.getVel().y--;
    if (down)
      this.getVel().y++;
    PVector vel = this.getVel();
    PVector accel = this.getAccel();
    pos.x += vel.x*(1/(float)fRate);
    pos.y += vel.y*(1/(float)fRate);
    vel.x += accel.x*(1/(float)fRate);
    vel.y += accel.y*(1/(float)fRate);
  }
}
