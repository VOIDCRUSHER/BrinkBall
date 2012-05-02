//PLAYER CLASS (derived from GameObjects)
public class Player extends GameObject {
  ArrayList<GameObject> gameobjects;
  int numJumps = 0;
  int numDeaths = 0;
  boolean onObject = false;
  float timeOnLeft = 0, timeOnMiddle = 0, timeOnRight = 0;
  Player(int x, int y, ArrayList<GameObject> gameobjects) {
    super(x, y, 10, 10, 0, 0);
    mycolor = color(250, 0, 0);
    this.setAccel(0, 20);
    this.gameobjects = gameobjects;
  }
  
  void reset(int x, int y){
    this.setAccel(0,0);
    this.setVel(0,0);
    this.setPos(x,y);
  }

  void draw() {
    PVector pos = this.getPos();
    fill(mycolor);
    ellipse(pos.x, pos.y, mywidth, myheight);
  }
  void tick() {
    PVector pos = this.getPos();
    
    if (pos.x < windowWidth*(float) 1/3)
      timeOnLeft+=1/ (float) fRate;
    else if (pos.x > windowWidth * (float) 2/3)
      timeOnRight+=1/ (float)fRate;
    else
      timeOnMiddle+=1/(float)fRate;


    for (GameObject gO: gameobjects)
      if (gO.collidesWith(this)) {
        if (!onObject)
          numJumps++;
        onObject= true;
        this.getPos().y = gO.getPos().y - this.myheight;
        this.setVel(new PVector(gO.getVel().x, gO.getVel().y));
        //this.getPos().y += gO.getVel().y*(1/(float)fRate);
        //print("intersects");
        return;
      }
    onObject = false;



    if (right)
      this.getVel().x+=2;
    if (left)
      this.getVel().x-=2;
    if (up)
      this.getVel().y-=2;
    if (down)
      this.getVel().y+=2;
    PVector vel = this.getVel();
    PVector accel = this.getAccel();
    pos.x += vel.x*(1/(float)fRate);
    pos.y += vel.y*(1/(float)fRate);
    vel.x += accel.x*(1/(float)fRate);
    vel.y += accel.y*(1/(float)fRate);
  }
}

void keyPressed() {
  switch(keyCode) {
  case RIGHT: 
    right = true; 
    break;
  case LEFT: 
    left = true; 
    break;
  case UP: 
    up = true; 
    break;
  case DOWN: 
    down = true; 
    break;
  }
}
void keyReleased() {
  switch(keyCode) {
  case RIGHT: 
    right = false; 
    break;
  case LEFT: 
    left = false; 
    break;
  case UP: 
    up = false; 
    break;
  case DOWN: 
    down = false; 
    break;
  }
}

