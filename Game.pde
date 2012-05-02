import java.util.ArrayList;
import java.awt.geom.*;

public class Game {
  public final int STARTMENU=0, PAUSEMENU=1, ENDMENU=2, PLAYING=3;
  public int mode;
  public ArrayList<GameObject> gameobjects;
  Rectangle2D playbounds;
  public int buffer;
  Player player;
  int playerStartX=20;
  int  playerStartY=40;
  public Game() {
  }

  public void init() {
    mode=PLAYING;
    buffer = 50;
    gameobjects = new ArrayList<GameObject>();
    playbounds = new Rectangle2D.Float(-buffer, -buffer, windowWidth+2*buffer, windowHeight+2*buffer);
    //for (int i = 0; i < 5; i++)
    //gameobjects.add(new Platform(i*800, i*100, 60,20, -1*int(random(50)), 1));
    player = new Player(playerStartX, playerStartY, gameobjects);
  }//end method init

  public void tick() {
    if (mode==PLAYING) {
      player.tick();
      println(gameobjects.size());
      if (!playbounds.contains(player.getBoundingBox())) {
        player.reset(playerStartX, playerStartY);
        player.numDeaths++;
      }

      for (int i = 0; i < gameobjects.size(); i++) {
        // advance all the game objects one time step
        gameobjects.get(i).tick();
        // checking if the object is out of bounds, then remove
        if (!(playbounds.contains(gameobjects.get(i).getBoundingBox()) 
          || playbounds.intersects(gameobjects.get(i).getBoundingBox()))) gameobjects.remove(i);
      }
      if (gameobjects.isEmpty())    
        for (int j = 0; j < 5; j++)
          gameobjects.add(new Platform(windowWidth, j*100+100, (int)random(50, 200), (int)random(15, 50), -1*(int(random(15))), 0));
    }
    else if (mode==PAUSEMENU) {
    }
    else if (mode==ENDMENU) {
    }
    else if (mode==STARTMENU) {
    }
  }//end method tick()


  public void draw() {
    for (GameObject obj:gameobjects) { 
      obj.draw();
    }  
    player.draw();
  }
}//end class Game

