import java.util.ArrayList;
public class Game {
  public final int STARTMENU=0, PAUSEMENU=1, ENDMENU=2, PLAYING=3;
  public int mode;
  public ArrayList<GameObject> gameobjects = new ArrayList<GameObject>();

  int outerBoundary = 100;
  public Game() {
  }
  
  public void init() {
    mode=PLAYING;
    gameobjects = new ArrayList<GameObject>();
    for (int i = 0; i < 10; i++)
      gameobjects.add(new Platform(i*10, i*50, 60,20, -1*int(random(50)), 1));
  }//end method init
  
  public void tick() {
    if (mode==PLAYING) {
      for (int i = gameobjects.size()-1; i>=0; i--) {
        gameobjects.get(i).tick();
        PVector pos = gameobjects.get(i).getPos();
        // checking if the object is out of bounds, then remove
        if (pos.x < -1*outerBoundary || pos.x > windowWidth+outerBoundary || pos.y < -1*outerBoundary || pos.y > windowHeight+outerBoundary)
          gameobjects.remove(i);
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
    for (GameObject obj:gameobjects) {
      obj.draw();
    }
    println("size: " + gameobjects.size());
  }
}//end class Game

