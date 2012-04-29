//BASE CLASS FOR GAME OBJECTS
public abstract class GameObject{
  PVector pos,vel,accel;
	color mycolor;
	PImage img;
	
	//Getters
	public PVector getPos(){return pos;}
	public PVector getVel(){return vel;}
	public PVector getAccel(){return accel;}
	public PImage getImg(){return img;}
	//Setters
	public void setPos(PVector pos){this.pos = pos;}
	public void setPos(int x,int y){pos.x=x; pos.y=y;}
	public void setVel(PVector vel){this.vel=vel;}
	public void setVel(float dx,float dy){vel.x=dx;vel.y=dy;}
	public void setAccel(PVector accel){this.vel=accel;}
	public void setAccel(float ax,float ay){accel.x=ax;accel.y=ay;}
	public void setImg(PImage img){this.img = img;}
	//Others
	public void draw(){}
}