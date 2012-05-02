//PLAYER CLASS (derived from GameObjects)
public class Player extends GameObject {
  ArrayList<GameObject> gameobjects;
  int numJumps = 0;
  int numDeaths = 0;
  boolean onObject = false;
  float timeZone1 = 0, timeZone2 = 0, timeZone3 = 0;
  public int score;
  Player(int x, int y, ArrayList<GameObject> gameobjects) {
    super(x, y, 10, 10, 0, 0);
    this.setColor("RED");
    this.setAccel(0, 0);
    this.gameobjects = gameobjects;
    score = 0;
  }

  void reset(int x, int y) {
    this.setAccel(0, 0);
    this.setVel(0, 0);
    this.setPos(x, y);
  }

  void draw() {
    PVector pos = this.getPos();
    fill(mycolor);
    ellipse(pos.x, pos.y, mywidth, myheight);
    fill(128);
    text("Score: " + score, windowWidth - 100, windowHeight-10);
  }
  void tick() {
    PVector pos = this.getPos();

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
  void updateTimeZones(int velDir) {
    PVector pos = this.getPos();

    float timeOnLeft = 0, timeOnMiddle = 0, timeOnRight = 0;

    if (pos.x < windowWidth*(float) 1/3)
      timeOnLeft+=1/ (float) fRate;
    else if (pos.x > windowWidth * (float) 2/3)
      timeOnRight+=1/ (float)fRate;
    else
      timeOnMiddle+=1/(float)fRate;

    if (velDir == 1) {
      timeZone3 += timeOnLeft;
      timeZone2 += timeOnMiddle;
      timeZone1 += timeOnRight;
    } 
    else if (velDir == 3) {
      timeZone3 += timeOnRight;
      timeZone2 += timeOnMiddle;
      timeZone1 += timeOnLeft;
    }
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

