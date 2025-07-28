class FPlayer_red extends FGameObject {
  int frame;
  int direction;
  int currentframe;
  FBox groundcheck;

  FPlayer_red(float x_, float y_) {
    super(x_, y_);
    setPosition(x, y);
    frame=0;
    direction=R;
    //currentframe = ;
    setRotatable(false);
    groundcheck();
  }

  void act() {
    animate();
    updatePosition();
    handleInput();
  }
  void handleInput() {
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (abs(vy)<0.1) {
      red_action = red_idle;
    }
    //change back to 150
    if (leftkey) {
      red_action=red_run    ;
      setVelocity(-200, vy);
      direction = L;
    }
    if (rightkey) {
      red_action=red_run;
      setVelocity(200, vy);
      direction = R;
    }
    if (upkey&&(objectIsTouching(groundcheck, "game_wall")||objectIsTouching(groundcheck, "half_red_water")||objectIsTouching(groundcheck, "redtrap door"))) {
      setVelocity(vx, -400);
    }
    if (abs(vy)>0.1)red_action = red_jump;
  }
  void animate() {
    if (frame>=red_action.length)frame=0;
    if (frameCount%5==0) {
      if (direction==R) {
        attachImage(red_action[frame]);
      }
      if (direction ==L) {
        attachImage(reverseImage(red_action[frame]));
      }
      frame++;
    }
  }
  void updatePosition() {
    groundcheck.setPosition(getX(), getY()+0.5*gridSize);
  }
  void groundcheck() {
    groundcheck = new FBox(gridSize/4, gridSize/4);
    groundcheck.setPosition(x, y+0.5*gridSize);
    groundcheck.setSensor(true);
    groundcheck.setName("groundcheck");
    groundcheck.setNoStroke();
    groundcheck.setNoFill();
    world.add(groundcheck);
  }
  boolean gettouch(){
    if(isTouching("red_door")){
      return true;
    }
    else{
      return false;
    }
  }
}
