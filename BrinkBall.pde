Game brinkball;
void setup(){ 
	size(800,600,OPENGL);
        frameRate(30);
        brinkball = new Game();
        brinkball.init();
} 
 
void draw(){ 
	brinkball.tick();        
} 
