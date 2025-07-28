class FGem extends FGameObject{
  String colors;
  FGem(float x_, float y_, String colors_){
    super(x_, y_);
    colors = colors_;
    if(colors.equals("blue")){
      attachImage(gem_blue);
    }
    else if(colors.equals("red")){
      attachImage(gem_red);
    }
    setStatic(true);
    setSensor(true);
  }
  void act(){
    if(colors.equals("blue")&&isTouching("FPlayer_blue")){
      
      blue_gem_counter += 1;
      gem.play();
      
      objects.remove(this);
      world.remove(this);
    }
    if(colors.equals("red")&&isTouching("FPlayer_red")){
      gem.play();
      red_gem_counter++;
      
      objects.remove(this);
      world.remove(this);
    }
  }
}
