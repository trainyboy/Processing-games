class FGameObject extends FBox {
  final int L=-1;
  final int R =1;
  float x;
  float y;
  FGameObject() {
    super(gridSize, gridSize);
  }
  FGameObject(float x_, float y_) {
    super(gridSize, gridSize);
    x = x_;
    y = y_;
  }
  void act() {
  }
  boolean isTouching(String n) {
    ArrayList<FContact> contacts = getContacts();
    for (int i=0; i<contacts.size(); i++) {
      FContact fc = contacts.get(i);
      if (fc.contains(n)) {
        return true;
      }
    }
    return false;
  }

  boolean objectIsTouching(FBox first, String second) {
    ArrayList<FContact> contacts = first.getContacts();
    for (int i=0; i<contacts.size(); i++) {
      FContact fc = contacts.get(i);
      if (fc.contains(second)) {
        return true;
      }
    }
    return false;
  }
  float getposx() {
    return x;
  }
  float getposy() {
    return y;
  }
}
