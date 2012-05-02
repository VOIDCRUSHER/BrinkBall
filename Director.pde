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

public class Director{
  public game;
  public Director(Game g){}
  public void tick(){
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
  }
  public void loadState(){
      //load a previously saved game/agent from file
  }
  public void saveState(){
    //parse the game state/director into an array of strings
    //save director to data folder using the processing code
    //saveStrings("data/"+filename, strings)
  }
  public void setStage(){
    //revert the game back to the state you got from file
    //if game's director is null, this a new game so initialize the game to Random
  }
}
