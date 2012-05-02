import java.util.ArrayList;
import java.awt.geom.*;

public class Game {
  public final int STARTMENU=0, PAUSEMENU=1, ENDMENU=2, PLAYING=3;//possible frame states
  public int mode; // what frame am I in?
  public ArrayList<GameObject> players,platforms,items; //to hold all the game objects
  Rectangle2D playbounds;
  Player player;
  int playerStartX=20;
  int  playerStartY=40;
  Director director;
  
  public Game() {}
  
  public void init() {
    //set mode to playing
    mode=PLAYING;
    //initialize the containers
    players = new ArrayList<GameObject>();
    items = new ArrayList<GameObject>();
    platforms = new ArrayList<GameObject>();
    //set the legal playground for all objects
    playbounds = new Rectangle2D.Float(-buffer,-buffer,windowWidth+2*buffer,windowHeight+2*buffer);
    //make a new player
    player = new Player(playerStartX,playerStartY,this);
    //Create a director to generate content
    director = new Director(this);
    /** TEST CODE
    //spawn platforms
    for (int i = 0; i < 10; i++)
      platforms.add(new Platform(i*800, i*100, 60,20, -1*int(random(50)), 1));
    //spawn items
    **/
  }//end method init
  
  public void tick() {
    if (mode==PLAYING) {
      //advance the player
      player.tick();
      //advance all the game objects
      for (int i = 0; i < platforms.size(); i++) platforms.get(i).tick();
      for (int i = 0; i < items.size(); i++) items.get(i).tick();
      
      //do bounds checking
      //if the player is out of bounds end, the game
      if(!inBounds(player))  lose();
      
      //for all other objects, remove them from the play area
      for (int i = 0; i < platforms.size(); i++) 
        if (inBounds(platforms.get(i))) platforms.remove(i);
      for (int i = 0; i < items.size(); i++) 
        if (inBounds(items.get(i))) items.remove(i);  
      director.tick();
      /** TEST CODE
      //spawn more platforms to keep the game going
      if(platforms.isEmpty())    
            for (int j = 0; j < 10; j++)
              platforms.add(new Platform(windowWidth, (int)random(windowHeight), (int)random(50,200),(int)random(15,50), -1*(int(random(50))+10), 0));
      */
    }
    else if (mode==PAUSEMENU) {
    }
    else if (mode==ENDMENU) {
    }
    else if (mode==STARTMENU) {
    }
  }//end method tick()

  public boolean inBounds(GameObject obj){
      return !(playbounds.contains(obj.getBoundingBox()) || playbounds.intersects(obj.getBoundingBox()));
  }
  public void draw() {
    for (GameObject item : items) { ((Item)item).draw(); }
    //player.draw();
    for (GameObject platform : platforms) { ((Platform)platform).draw(); }  
  }
  public void win(){}
  public void lose(){player.reset(); player.numDeaths++;}
}//end class Game

