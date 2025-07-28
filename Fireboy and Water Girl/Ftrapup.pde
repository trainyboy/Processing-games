class FTrapup extends FTrapdoor {
  float originalY; // To store the original y position

  FTrapup(float x_, float y_, FLever tmp, PImage img_) {
    super(x_, y_, tmp, img_);
    attachImage(img);
    setStatic(true);
    originalY = y_; // Save the original y position
    setRotatable(false);
    setFriction(1.5);
  }

  void act() {
    if (lever.ifpressed() == 1) {
      MovetoPosition();
    } else {
      Moveback();
    }
  }

  void MovetoPosition() {
    if (getY() > originalY - 64) { // Move up until it reaches the target position
      setStatic(false);
      setVelocity(0, -100); // Move up
    } else {
      setStatic(true);
      setVelocity(0, 0);
    }
  }

  void Moveback() {
    if (getY() < originalY) { // Move down until it reaches the original position
      setStatic(false);
      setVelocity(0, 100); // Move down
    } else {
      setStatic(true);
      setVelocity(0, 0);
    }
  }
}
