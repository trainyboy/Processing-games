import processing.sound.*;
SoundFile gamemusic;
SoundFile intromusic;
SoundFile correct;
SoundFile incorrect;
SoundFile button;
PFont text;
boolean match_no = true;
boolean timesup = true;
int mode = 0;
int maxnum =0;
int gifcounting = 0;
int tomatch = 0;
int wrong = 0;
int num =0;
int y = 0;
int increase = 0;
int counter =0;
int counternum = 0;
color[] Word_Color = {#FF0000, #0000FF, #FFFF00, #800080, #A52A2A, #008000, #4B0082, #FFA500};
String[] Color_String = {"RED", "BLUE", "YELLOW", "PURPLE", "BROWN", "GREEN", "INDIGO", "ORANGE"};
PImage[] gif;
void setup(){
  text = createFont("texts.ttf", 128);
  button = new SoundFile(this, "mouse.mp3");
  correct = new SoundFile(this, "correct.mp3");
  incorrect = new SoundFile(this, "wrong.mp3");
  intromusic = new SoundFile(this, "loading.mp3");
  gamemusic = new SoundFile(this, "game.mp3");
  size(1000, 1000);
  gif = new PImage[100];
  for(int i=0;i<100;i++){
    if(i<10){
      gif[i] = loadImage("frame_00"+i+"_delay-0.04s.gif");
    }
    else{
      gif[i] = loadImage("frame_0"+i+"_delay-0.04s.gif");
    }
  }
}
void draw(){
  if(mode == 0){
    if(!intromusic.isPlaying()){
      intromusic.play();
    }
    if(gifcounting == 99){
      gifcounting = 0;
    }
    image(gif[gifcounting], 0, 0, 1000, 1000);
    gifcounting++;
    strokeWeight(8);
    if(mouseX>=300&&mouseX<=700&&mouseY>=300&&mouseY<=600){
      fill(#000000);
    }
    else{
      fill(#00FFFFFF);
    }
    textFont(text);
    rect(300, 300, 400, 200);
    textSize(100);
    textAlign(CENTER, CENTER);
    fill(255);
    text("START", 500, 400);
    strokeWeight(3); 
  }
  else{
    if(mode == 2){
      if(!intromusic.isPlaying()){
        gamemusic.pause();
        intromusic.play();
      }
      
      end_page();
      if(mouseX>=300&&mouseX<=700&&mouseY>=400&&mouseY<=600){
        fill(#000000);
      }
      else{
        fill(#00FFFFFF);
      }
      textFont(text);
      rect(300, 400, 400, 200);
      strokeWeight(8);
      textSize(100);
      textAlign(CENTER, CENTER);
      fill(#EDF719);
      text("RESTART", 500, 500);
      strokeWeight(3);
    }
    if(mode==1){
      if(!gamemusic.isPlaying()){
      intromusic.pause();
      gamemusic.play();
      }
    if(timesup==true){
      timesup=false;
      y=0;
      Game_Background();
      random_number();
    }
      Game_Background();
      fill(Word_Color[tomatch]);
      textSize(128);
      textAlign(CENTER, CENTER);
      text(Color_String[num], 500, y);
      y=y+5+increase;
      if(y>=1000){
       wrong++;
       print(wrong);
       incorrect.play();
       timesup=true;
      }
      if(wrong>=3){
        mode = 2;
      }
    }
  }
}

void random_number(){
  if((int)random(0, 2)==0){
    match_no = true;
  }
  else{
    match_no = false;
      tomatch = (int)random(0, 6);
  }
 if(match_no){ 
    tomatch = (int)random(0,6);
    num = tomatch;
  }
  else{
    num = (int)random(0, 6);
    while(num==tomatch){
      num = (int)random(0, 6);
    }
  }
}
void Game_Background(){
  fill(#000000);
  rect(0, 0, 500, 1000);
  fill(255);
  rect(500, 0, 500, 1000);
  textAlign(CENTER, CENTER);
  fill(255);
  strokeWeight(10);
  textFont(text);
  text("Match", 250, 200);
  fill(#000000);
  text("Don't", 750, 150);
  text("Match", 750, 300);
  strokeWeight(3);
}
void mousePressed(){
  if(mode == 2){
     mode=0;
     timesup = true;
     wrong = 0;
     increase =0;
     counter=0;
     counternum=0;
     button.play();
  }
  else if(mode == 0){
    if(mouseX>=300&&mouseX<=700&&mouseY>=300&&mouseY<=600){
      mode++;
      button.play();
    }
  }
  else if(mouseX>=0&&mouseX<=500&&mouseY>=0&&mouseY<=1000){
    if(num==tomatch){
      counter++;
      correct.play();
    }
    else{
      wrong++;
      incorrect.play();
    }
    timesup=true;
  }
  else{
    if(num!=tomatch){
      counter++;
      correct.play();
    }
    else{
      wrong++;
      incorrect.play();
    }
    timesup=true;
  }
  if(counternum+3==counter){
    counternum = counter;
    increase++;
  }
  if(wrong>=3){
    mode = 2;
  }
}
void end_page(){
  maxnum = max(maxnum, counter);
  background(255);
  textFont(text);
  fill(#000000);
  textAlign(CENTER, CENTER);
  text("Final Score: " + counter, 500, 150);
  text("Best Score: " + maxnum, 500, 300);
}
