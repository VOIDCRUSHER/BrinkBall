import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

import processing.opengl.*;

Minim minim;
AudioPlayer song;
BeatDetect beat;

Game brinkball;
int fRate = 30;
int windowWidth = 800;
int windowHeight = 600;
int buffer = 100;

void setup() { 
  size(windowWidth, windowHeight, OPENGL);
  frameRate(fRate);
  brinkball = new Game();
  brinkball.init();
  minim = new Minim(this);
  beat = new BeatDetect();
  song = minim.loadFile("sample.mp3", 1024);

  song.play();
  song.loop();


} 

void draw() { 
  background(0);
  //radar.draw();
  brinkball.tick();
  brinkball.draw();
}

 
void stop()
{
  song.close();
  minim.stop();
  super.stop();
}


