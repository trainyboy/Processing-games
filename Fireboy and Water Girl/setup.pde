import fisica.*;
import processing.sound.*;
FWorld world;

SoundFile game;
SoundFile death;
SoundFile gem;
PFont text;

color back = #2c2e0b;
color wall = #b4b4b4;
color red_trap_door  = #ed1c24;
color blue_trap_door = #4d6df3;
color red_spawn = #990030;
color blue_spawn = #99d9ea;
color blue_lever = #2f3699;
color red_lever = #ffa3b1;
color green_water = #22b14c;
color red_water = #6f3198;
color blue_water = #00b7ef;
color blue_door = #9c5a3c;
color red_door = #ff7e00;

color blue_gem = #6e8af0;
color red_gem = #e83f52;
color brick = #e8823f;
color button = #f5e49c;
color trap_door_up = #709ad1;

PImage intro;
PImage gem_blue, gem_red;
PImage brick_;
PImage up_trap_door;
PImage button_, button_pressed;
PImage map1, img, map2;
PImage water_red_c, water_red_l, water_red_r;
PImage water_green_c, water_green_l, water_green_r;
PImage water_blue_c, water_blue_l, water_blue_r;
PImage door_blue, door_red;
PImage lever_blue, lever_red;
PImage game_wall;
PImage purple_trap_c, purple_trap_r, purple_trap_l;
PImage grey_trap_c, grey_trap_r, grey_trap_l;
PImage brown_trap_c, brown_trap_r, brown_trap_l;
PImage open_door, end;

int mode;
int gridSize;
int blue_gem_counter=0;
int red_gem_counter=0;
int starttime;
int endtime;

boolean upkey, downkey, leftkey, rightkey, wkey, skey, dkey, akey, qkey, ekey;
boolean hasloadplayer_blue;
boolean hasloadplayer_red;
boolean istrue = false;
boolean hascheck, hascheckbeg;

PImage[] blue_idle;
PImage[] blue_run;
PImage[] blue_jump;
PImage[] blue_action;
PImage[] red_idle;
PImage[] red_run;
PImage[] red_jump;
PImage[] red_action;


ArrayList<FGameObject> objects;
FLever blue_lever_tmp, red_lever_tmp;
FPlayer_blue player1;
FPlayer_red player2;
FDoor red_door_box;
FDoor blue_door_box;
FButton abutton;
void setup() {
  map1 = loadImage("level1.png");
  map2 = loadImage("map2.png");


  gridSize = 32;
  fullScreen(P2D);


  //character animation blue
  blue_idle = new PImage[1];
  blue_idle[0] = loadImage("blue_idle.png");
  blue_idle[0].resize(gridSize, gridSize);

  blue_run = new PImage[2];
  blue_run[0] = loadImage("blue_run0.png");
  blue_run[1] = loadImage("blue_run1.png");
  blue_run[0].resize(gridSize, gridSize);
  blue_run[1].resize(gridSize, gridSize);

  blue_jump = new PImage[2];
  blue_jump[0] = loadImage("blue_jump0.png");
  blue_jump[1] = loadImage("blue_jump1.png");
  blue_jump[0].resize(gridSize, gridSize);
  blue_jump[1].resize(gridSize, gridSize);
  blue_action = blue_idle;

  //chacater animation red
  red_idle = new PImage[1];
  red_idle[0] = loadImage("idle0.png");

  red_run = new PImage[2];
  red_run[0] = loadImage("run.png");
  red_run[1] = loadImage("run0.png");

  red_jump = new PImage[1];
  red_jump[0] = loadImage("jump0.png");
  //red_jump[0].resize(gridSize, gridSize);
  red_action = red_idle;


  water_red_c = loadImage("red_water_center.png");
  water_red_l = loadImage("red_water_left.png");
  water_red_r = loadImage("red_water_right.png");
  water_green_c = loadImage("green_water_center.png");
  water_green_l = loadImage("green_water_left.png");
  water_green_r = loadImage("green_water_right.png");
  water_blue_c = loadImage("blue_water_center.png");
  water_blue_l = loadImage("blue_water_left.png");
  water_blue_r = loadImage("blue_water_right.png");

  //doors
  door_blue = loadImage("blue_door.png");
  door_red = loadImage("red_door.png");
  open_door = loadImage("open_door.png");

  //levers && button
  lever_blue = loadImage("blue_lever.png");
  lever_red = loadImage("red_lever.png");
  button_ = loadImage("blue_button.png");
  button_pressed = loadImage("button_pressed.png");
  //wall
  game_wall = loadImage("wall.png");

  //resize
  water_red_c.resize(gridSize, gridSize);
  water_red_l.resize(gridSize, gridSize);
  water_red_r.resize(gridSize, gridSize);
  water_green_c.resize(gridSize, gridSize);
  water_green_l.resize(gridSize, gridSize);
  water_green_r.resize(gridSize, gridSize);
  water_blue_c.resize(gridSize, gridSize);
  water_blue_l.resize(gridSize, gridSize);
  water_blue_r.resize(gridSize, gridSize);
  door_blue.resize(2*gridSize, 3*gridSize);
  door_red.resize(2*gridSize, 3*gridSize);
  open_door.resize(2*gridSize, 3*gridSize);
  lever_blue.resize(gridSize, gridSize);
  lever_red.resize(gridSize, gridSize);
  game_wall.resize(gridSize+5, gridSize+5);
  button_.resize(gridSize, gridSize/2);
  button_pressed.resize(gridSize, gridSize/2);
  //trapdoor
  purple_trap_c = loadImage("purple_trapdoor_center.png");
  purple_trap_r = loadImage("purple_trapdoor_right.png");
  purple_trap_l = loadImage("purple_trapdoor_left.png");
  grey_trap_c = loadImage("grey_trapdoor_center.png");
  grey_trap_r = loadImage("grey_trapdoor_right.png");
  grey_trap_l = loadImage("grey_trapdoor_left.png");
  brown_trap_c = loadImage("brown_trapdoor_center.png");
  brown_trap_r = loadImage("brown_trapdoor_right.png");
  brown_trap_l = loadImage("brown_trapdoor_left.png");

  purple_trap_c.resize(gridSize, gridSize);
  purple_trap_r.resize(gridSize, gridSize);
  purple_trap_l.resize(gridSize, gridSize);
  grey_trap_c.resize(gridSize, gridSize);
  grey_trap_r.resize(gridSize, gridSize);
  grey_trap_l.resize(gridSize, gridSize);
  brown_trap_c.resize(gridSize, gridSize);
  brown_trap_r.resize(gridSize, gridSize);
  brown_trap_l.resize(gridSize, gridSize);

  //others
  brick_ = loadImage("block.png");
  gem_blue = loadImage("blue_gem.png");
  gem_red = loadImage("red_gem.png");
  brick_.resize(gridSize, gridSize);
  gem_blue.resize(gridSize, gridSize);
  gem_red.resize(gridSize, gridSize);



  //intialize variable
  objects = new ArrayList<FGameObject>();
  hasloadplayer_blue = false;
  hasloadplayer_red = false;
  Fisica.init(this);
  mode=-1;

  //loads
  game = new SoundFile(this, "Soundtrack.mp3");
  death = new SoundFile(this, "dying.mp3");
  gem = new SoundFile(this, "gem.mp3");

  game.play();

  intro = loadImage("intro.jpg");
  intro.resize(width, height);
  end = loadImage("end.png");
  end.resize(width, height);

  //font
  text = createFont("gametext.otf", 80);
}

//interactions
void keyReleased() {
  if (key=='S'||key=='s')skey=false;
  if (key=='W'||key=='w')wkey=false;
  if (key=='A'||key=='a')akey=false;
  if (key=='D'||key=='d')dkey=false;
  if (key=='Q'||key=='q')qkey=false;
  if (key=='E'||key=='e')ekey=false;
  if (keyCode==DOWN)downkey=false;
  if (keyCode==UP)upkey=false;
  if (keyCode==LEFT)leftkey=false;
  if (keyCode==RIGHT)rightkey=false;
}
void keyPressed() {
  if (key=='S'||key=='s')skey=true;
  if (key=='W'||key=='w')wkey=true;
  if (key=='A'||key=='a')akey=true;
  if (key=='D'||key=='d')dkey=true;
  if (key=='Q'||key=='q')qkey=true;
  if (key=='E'||key=='e')ekey=true;
  if (keyCode==DOWN)downkey=true;
  if (keyCode==UP)upkey=true;
  if (keyCode==LEFT)leftkey=true;
  if (keyCode==RIGHT)rightkey=true;
}
