import java.util.ArrayList;
import java.awt.geom.*;

public class Game {
  public final int STARTMENU=0, PAUSEMENU=1, ENDMENU=2, PLAYING=3;
  public int mode;
  public ArrayList<GameObject> gameobjects;
  Rectangle2D playbounds;
  public int buffer;
  public Game() {
  }
  
  public void init() {
    mode=PLAYING;
    gameobjects = new ArrayList<GameObject>();
    playbounds = new Rectangle2D.Float(-buffer,-buffer,windowWidth+2*buffer,windowHeight+2*buffer);
    for (int i = 0; i < 10; i++)
      gameobjects.add(new Platform(i*10, i*50, 60,20, -1*int(random(50)), 1));
  }//end method init
  
  public void tick() {
    if (mode==PLAYING) {
      for (int i = 0; i < gameobjects.size(); i++) {
        // advance all the game objects one time step
        gameobjects.get(i).tick();
        // checking if the object is out of bounds, then remove
        if (!playbounds.contains(gameobjects.get(i).getBoundingBox())) gameobjects.remove(i);
      }
    }
    else if (mode==PAUSEMENU) {
    }
    else if (mode==ENDMENU) {
    }
    else if (mode==STARTMENU) {
    }
  }//end method tick()


  public void draw() {
    for (GameObject obj:gameobjects) { obj.draw(); }
    println("size: " + gameobjects.size());
  }
}//end class Game

