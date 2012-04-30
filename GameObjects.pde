import java.awt.geom.*;

//BASE CLASS FOR GAME OBJECTS
public abstract class GameObject{
        PVector pos,vel,accel;
        int mywidth,myheight;
	color mycolor;
	PImage img;
        //constructors
	public GameObject(PVector pos,PVector vel,PVector accel,int mywidth,int myheight,color mycolor,PImage img){
            this.pos = pos;
            this.vel = vel;
            this.accel = accel;
            this.mywidth = mywidth;
            this.myheight = myheight;
            this.mycolor = mycolor;
            this.img = img;
        }
        public GameObject(int x,int y,int mywidth, int myheight,float dx, float dy){
            this(new PVector(x,y),new PVector(dx,dy),new PVector(1,1),mywidth,myheight,color(128),null);
        }
        public GameObject(){this((int)random(windowWidth),(int)random(windowHeight),60,20,random(-80.0,80.0)/fRate,random(-40,40.0)/fRate);}
        //Getters
	public PVector getPos(){return pos;}
	public PVector getVel(){return vel;}
	public PVector getAccel(){return accel;}
        public int getWidth(){return mywidth;}
        public int getHeight(){return myheight;}
	public PImage getImg(){return img;}
        public Rectangle2D getBoundingBox(){return new Rectangle2D.Float(pos.x,pos.y,mywidth,myheight);}
	//Setters
	public void setPos(PVector pos){this.pos = pos;}
	public void setPos(int x,int y){pos.x=x; pos.y=y;}
	public void setVel(PVector vel){this.vel=vel;}
	public void setVel(float dx,float dy){vel.x=dx;vel.y=dy;}
	public void setAccel(PVector accel){this.accel=accel;}
	public void setAccel(float ax,float ay){accel.x=ax;accel.y=ay;}
	public void setImg(PImage img){this.img = img;}
        public void setWidth(int mywidth){this.mywidth = mywidth;}
        public void setHeight(int myheight){this.myheight = myheight;}
	//Others
        public void tick(){}
        public void move(){
            //update position and velocity
            pos.add(vel);
            vel.add(accel);
        }
	public void draw(){}
        public boolean collidesWith(GameObject obj){
          Rectangle2D objbounds = obj.getBoundingBox();
          return getBoundingBox().intersects(objbounds.getX(), objbounds.getY(), objbounds.getWidth(),objbounds.getHeight());
        }
}
