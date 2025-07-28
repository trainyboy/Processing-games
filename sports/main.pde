import fisica.*;
void setup(){
  
  one = #3C3E27;
  two = #DDEC42;
  changemode = new Button("Restart", 800, 600, 400, 200, one, two);
  wkey = false;
  skey = false;
  upkey = false;
  downkey = false;
  dkey = false;
  leftkey = false;
  mode = 0;
  fullScreen();
  createWorld();
  leftplayer();
  rightplayer();
  wall();
  goalright = new FBox(50, 400);
  goalleft = new FBox(50, 400);
  rbasket();
  lbasket();
  lscore = 0;
  rscore = 0;
  one_ = new Ball();
  three_ = new Ball();
  two_ = new Ball();
  four_ = new Ball();
}
void draw(){
  click();
  if(mode == 0){
    game();
  }
  else if(mode == 1){
   end();
  }
}
void game(){
  background(blue);
  textSize(40);
  text(lscore, 200, 200);
  text(rscore, 1400, 200);
  
  controls();
  if(one_.hitbox(goalright)||two_.hitbox(goalright)||three_.hitbox(goalright)||four_.hitbox(goalright)){
    rscore++;
  }
  if(one_.hitbox(goalleft)||two_.hitbox(goalleft)||three_.hitbox(goalleft)||four_.hitbox(goalleft)){
    lscore++;
  }
  world.draw();
  world.step();
  if(rscore>=10||lscore>=10){
    mode = 1;
  }
}

void end(){
  String totext = "";
  background(blue);
  if(rscore>lscore){
    totext = "Right Player won !!!";
  }
  else if(lscore>rscore){
    totext = "Left Player won !!!";
  }
  else{
    totext = "It Is A Tie!!!!";
  }
  fill(255);
  textSize(60);
  text(totext, 800,  300);
  changemode.show();
  if(changemode.clicked == true){
    mode = 0;
    println(mode);
    lscore = 0;
    rscore =0;
  }
}
