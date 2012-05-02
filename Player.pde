//PLAYER CLASS (derived from GameObjects)
public class Player extends GameObject{
  int numJumps = 0;
  int numDeaths = 0;
  boolean onObject = false;
  public float timeZone1 = 0, timeZone2 = 0, timeZone3 = 0;
  public int score;
  public float gravPull = -.1;
  public float speed = (windowWidth)/2; //default speed for player (can cross the screen in 5 seconds)
  Game game;
  
  Player(int x, int y,Game g) {
    super(x, y, 20, 20, 0, 0);
    this.setColor(color(255,0,0));
    this.setAccel(0, 0);
    score = 0;
    game = g;
  }

  void draw() {
    PVector pos = this.getPos();
    fill(mycolor);
    ellipse(pos.x, pos.y, mywidth, myheight);
    fill(128);
    text("Score: " + score, windowWidth - 100, windowHeight-10);
    println(timeZone1);
  }
  void tick() {
    PVector pos = this.getPos();
    //calculateAcceleration();
    
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
void kill(){ reset(); numDeaths++; if(numDeaths>game.maxdeaths)game.lose();}
void updateTimeZones() {
    if (game.platforms.size() == 0)
    return;
    
    GameObject platform = game.platforms.get(0);
    

    
    PVector pos = this.getPos();

    float timeOnLeft = 0, timeOnMiddle = 0, timeOnRight = 0;

    if (pos.x < windowWidth*(float) 1/3)
      timeOnLeft+=1/ (float) fRate;
    else if (pos.x > windowWidth * (float) 2/3)
      timeOnRight+=1/ (float)fRate;
    else
      timeOnMiddle+=1/(float)fRate;
      
    PVector vel = platform.getVel();
    if (vel.x >= 0) {
      timeZone3 += timeOnLeft;
      timeZone2 += timeOnMiddle;
      timeZone1 += timeOnRight;
    } 
    else if (vel.x < 0) {
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
  void keyPressed() {
    switch(keyCode) {
      case RIGHT:       System.out.println(keyCode); setVel(speed,0); break;
      case LEFT:        System.out.println(keyCode);setVel(-1*speed,0); break;
      case UP:          System.out.println(keyCode);setVel(0,-1*speed); break;
      case DOWN:        System.out.println(keyCode);setVel(0,speed); break;
    }
  }
}

