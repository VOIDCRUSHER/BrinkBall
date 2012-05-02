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
  public Director(Game g) {
    this.game = g;
  }
  int platformVelDir = 3; //NESW
  int numObjects = 10;
  boolean targetPlatforms = false;
  int difficulty = 0;
  public void tick() {
    //grabbing

    //update beliefs based on player's performance
    //update game state as necessary
    //update music/background? (on the wishlist)
    //println(game.gameobjects.size());

    int rand = (int) random(100);
    if (rand == 0)
      game.player.setColor(getRandomColor());
    while (game.gameobjects.size () < numObjects) {
      //UP,DOWN,LEFT,RIGHT, SIDEWAYS
      PVector pos = new PVector();
      PVector vel = new PVector();
      pos = new PVector(windowWidth, random(0+100, windowHeight-100));
      vel = new PVector(-1*(int(random(15))), 0);

      if  (platformVelDir == 1) {
        pos = new PVector(0, random(0+100, windowHeight-100));
        vel.mult(-1);
      }

      Platform platform = new Platform((int) pos.x, (int)  pos.y, (int)random(50, 200), (int)random(15, 50), (int)  vel.x, (int)  vel.y);
      platform.setColor(getRandomColor());
      game.gameobjects.add(platform);
    }
    //choose movement direction 
    //generate game objects
    //choose type
    //choose velocity
    //choose accel
    //choose placement
    //choose color
    //etc...
  }

  public String getRandomColor() {
    int rand = (int) random(3);
    if (rand == 0)
      return "RED";
    else if (rand == 1)
      return "GREEN";
    else 
      return "BLUE";
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

