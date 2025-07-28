class FTrapdoor extends FGameObject {
  FLever lever;
  FButton Button;
  PImage img;

  FTrapdoor(float x_, float y_, FLever tmp, PImage img_) {
    super(x_, y_);
    lever = tmp;
    img = img_;
    setStatic(true);
    setSensor(false);
    setFriction(1.5);
  }
  FTrapdoor(float x_, float y_, FButton tmp, PImage img_){
    super(x_, y_);
    Button = tmp;
    img = img_;
    setStatic(true);
    setSensor(false);
  }

  void act() {
    if(Button==null){
      if (lever.ifpressed() == -1) {
        attachImage(img);
        setSensor(false);
      } else {
        attachImage(null);
        setNoFill();
        setNoStroke();
        setSensor(true);
      }
    }
    if(lever == null){
      if(Button.getStage()== 1){
        attachImage(img);
        setSensor(false);
      }
      else{
        attachImage(null);
        setNoFill();
        setNoStroke();
        setSensor(true);
      }
    }
  }
}
