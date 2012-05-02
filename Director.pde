//AI CONTROLLER FOR THIS GAME

///////////////////////////////////////////////////////////////
///  IMPLEMENT WHATEVER ADDITIONAL METHODS YOU NEED
///   BUT KEEP THESE ORIGINAL ONE'S WHICH THE GAME 
///  WILL CALL REPEATEDLY TO PROGRESS THE GAME
///  TO GET STARTED, JUST IMPLEMENT THE BASIC FUNTIONALITY
///  SETTING EVERYTHING TO RANDOM. ONCE WE HAVE TESTED
///  THE DIRECTOR SUCCESSFULLY AS A DRIVER FOR THE GAME,
/// THEN WE CAN BOTH FOCUS ON WRITING THE FSM AGENT
/// LET ME KNOW IF THERE IS ANYTHING SPECIAL IN THE GAME ENGINE
/// THAT YOU NEED, (I'M WORKING ON IT), AND I WILL IMPLEMENT IT
////////////////////////////////////////////////////////////////

public class Director {
  public Game game;
  int platformVelDir; //NESW
  int numPlatforms;
  boolean targetPlatforms;
  boolean manualMode;
  float difficulty;

  public Director(Game g) { 
    this.game = g;
    platformVelDir = 1; //NESW
    numPlatforms = 10;
    targetPlatforms = false;
    difficulty = 0;
    manualMode =false;
  }

  public void tick() {
    //update beliefs based on player's performance
    //update game state as necessary
    //update music/background? (on the wishlist)
    //choose movement direction 
    //UP,DOWN,LEFT,RIGHT, SIDEWAYS
    //given any velocity or accel pairing this should be a simply a problem of, which of these, should I multiply by (-1)
    //generate game objects
    //choose type
    //choose velocity
    //choose accel
    //choose placement
    //choose color
    //etc...
    //note, object s should always be spawned from the side of the screen 
    //furthest from the direction they are traveling in (the side of the screen the player wants to get too)
    //Example: if the game/player direction is to the RIGHT (--->) 
    //game objects also spawn on the right, but move to the left
    
    //change colors randomly
    int rand = (int) random(100);
    if (rand == 0) game.player.setColor(getRandomColor());
    rand = (int) random(100);
    
    //choose direction randomly
    if (rand == 0){ 
      game.direction = chooseDirRand();
      shiftDirections();
    }
    
    while (game.platforms.size () < numPlatforms) {
        //UP,DOWN,LEFT,RIGHT
        PVector pos = new PVector(random(0, windowWidth-100),windowHeight);
        if (game.direction.x == game.down.x && game.direction.y == game.down.y)  
            pos = new PVector(random(0, windowWidth-100),-100);
        if (game.direction.x == game.left.x && game.direction.y == game.left.y)  
            pos = new PVector(windowWidth, random(0, windowHeight-100));
        if (game.direction.x == game.right.x && game.direction.y == game.right.y) 
            pos = new PVector(0, random(0, windowHeight-100));
        
        PVector vel = new PVector((int(random(15)+3)), 0);  
        switchDirection(vel,game.direction);
          
        Platform platform = new Platform((int) pos.x, (int)  pos.y, (int)random(50,200), (int)random(15, 50), (int)  vel.x, (int)  vel.y);
        platform.setColor(getRandomColor());
        game.platforms.add(platform);
    }
    if(!manualMode)  calculateDifficulty();
    fill(128);
    text("Diff: " + difficulty, windowWidth - 200, windowHeight-10);
  }

  public color getRandomColor() {
    int rand = (int) random(3);
    if (rand == 0)
      return color(255, 0, 0); //RED
    else if (rand == 1)
      return color(0, 255, 0); //GREEN
    else 
      return color(0, 0, 255); //BLUE
  }
  
  public PVector chooseDirRand(){
      PVector newDir = new PVector(game.direction.x,game.direction.y); 
      if( ((int)random(2)) == 0) swapAxis(game.direction); //switch orientation
      newDir.mult( (((int)random(2)) == 0)? 1: -1 );   //flip the direction
      return newDir;
  } 
  
  void switchDirection(PVector oldDir, PVector newDir){
    if(oldDir.dot(newDir)==0) swapAxis(oldDir);
    if(oldDir.dot(newDir)< 0) oldDir.mult(-1);
  }
  
  void shiftDirections(){
      for(GameObject obj: game.platforms) switchDirection(obj.vel,game.direction);
  }
  
  void swapAxis(PVector v){ float temp = v.x; v.x = v.y; v.y=temp; } //switches the x and y values
  
  void calculateDifficulty() {
    difficulty =  (game.player.score-game.player.numDeaths+game.player.timeZone3)/100;
  }
  
  public void keyPressed(){
    //.2 .4 .8 1
    switch(key) {
      case '~':  manualMode = !manualMode;
      case '0':  difficulty = 0f;  print(difficulty+"\n"); break;
      case '1':  difficulty = .2f; print(difficulty+"\n"); break;
      case '2':  difficulty = .4f; print(difficulty+"\n"); break;
      case '3':  difficulty = .6f; print(difficulty+"\n"); break;
      case '4':  difficulty = .8f; print(difficulty+"\n"); break;
      case '5':  difficulty =  1f; print(difficulty+"\n"); break;
    }
  }
  
  public void loadState() {
    //load a previously saved game/agent from file
  }
  public void saveState() {
    //parse the game state/director into an array of strings
    //save director to data folder using the processing code
    //saveStrings("data/"+filename, strings)
  }
  public void setStage() {
    //revert the game back to the state you got from file
    //if game's director is null, this a new game so initialize the game to Random
  }
}

