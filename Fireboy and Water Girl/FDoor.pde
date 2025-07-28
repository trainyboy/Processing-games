class FDoor extends FGameObject {
  PImage istouching;
  PImage nottouching;
  String which_player;
  FDoor(float x_, float y_, PImage istouch, PImage nottouch, String player) {
    super(x_, y_);
    istouching = istouch;
    nottouching = nottouch;
    which_player = player;
  }
  void act() {
    if (isTouching(which_player)) {
      attachImage(istouching);
    } else {
      attachImage(nottouching);
    }
  }
}
