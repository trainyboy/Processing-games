class FLever extends FGameObject { //<>//
  PImage lever;
  int stage;
  int frames;
  FLever(float x_, float y_, PImage lever_) {
    super(x_, y_);

    lever=lever_;
    attachImage(lever_);
    stage=-1;
    frames =0;
  }
  void act() {
    frames++;
    
    if (frames>100&&(isTouching("FPlayer_blue")||isTouching("FPlayer_red"))) {
      stage*=-1;
      if (stage==-1) {
        attachImage(reverseImage(lever));
      } else {
        attachImage(lever);
      }
      frames=0;
    }
  }
  int ifpressed() {
    return stage;
  }
}
