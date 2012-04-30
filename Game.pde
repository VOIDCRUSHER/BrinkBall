import java.util.ArrayList;
public class Game{
  public final int STARTMENU=0,PAUSEMENU=1,ENDMENU=2, PLAYING=3;
  public int mode;
  public ArrayList<GameObject> gameobjects;
  
  public void init(){
    mode=PLAYING;
    gameobjects = new ArrayList<GameObject>();
  }//end method init
  public void tick(){
    if(mode==PLAYING){
      for(GameObject obj:gameobjects){obj.tick();}
      ellipse(50,50,80,40);
    }
    else if(mode==PAUSEMENU){}
    else if(mode==ENDMENU){}
    else if(mode==STARTMENU){}
  }//end method tick()
}//end class Game
