class FButton extends FGameObject {
  PImage pressed;
  PImage unpressed;
  int stage;
  FButton(float x_, float y_, PImage pressed_, PImage unpressed_) {
    super(x_, y_);
    pressed = pressed_;
    unpressed = unpressed_;
    attachImage(unpressed);
    stage = 1;
  }
  void act() {
    if (isTouching("Brick")||isTouching("FPlayer_blue")||isTouching("FPlayer_red")) {
      stage=-1;
      attachImage(pressed);
    } else {
      stage=1;
      attachImage(unpressed);
    }
  }
  int getStage() {

    return stage;
  }
}
