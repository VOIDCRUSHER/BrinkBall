//PLAYER CLASS (derived from GameObjects)
public class Player extends GameObject{
  int numJumps = 0;
  int numDeaths = 0;
  boolean onObject = false;
  float timeZone1 = 0, timeZone2 = 0, timeZone3 = 0;
  public int score;
  public float gravPull = -.1;
  Game game;
  
  Player(int x, int y,Game g) {
    super(x, y, 10, 10, 0, 0);
    this.setColor(color(255,0,0));
    this.setAccel(0, 0);
    score = 0;
    game = g;
  }

  void draw() {
    PVector pos = this.getPos();
    fill(mycolor);
    ellipse(pos.x, pos.y, 10*mywidth, 10*myheight);
    fill(128);
    text("Score: " + score, windowWidth - 100, windowHeight-10);
  }
  void tick() {
    PVector pos = this.getPos();
    calculateAcceleration();
    
    for (int i = 0; i < game.platforms.size(); i++) {
      GameObject gO = game.platforms.get(i);
      if (gO.collidesWith(this)) {
        
        if (this.getColor() == gO.getColor()) {
          score++;
          game.platforms.remove(i);
          continue;
        }
        
        if (!onObject)
          numJumps++;
        onObject= true;
        this.getPos().y = gO.getPos().y - this.myheight;
        this.setVel(new PVector(gO.getVel().x, gO.getVel().y));
        //this.getPos().y += gO.getVel().y*(1/(float)fRate);
        //print("intersects");
        return;
      }
    }
    onObject = false;
    
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

void reset() {
    this.setAccel(0, 0);
    this.setVel(0, 0);
    this.setPos(game.playerStartX, game.playerStartY);
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
  void calculateAcceleration() {
    PVector pos = this.getPos();
    PVector tempAccel = new PVector(pos.x - windowWidth/2, pos.y - windowHeight/2);
    tempAccel.mult(gravPull);
    this.setAccel(tempAccel.x, tempAccel.y);
  }
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
