FWorld world; 
Button changemode;
Boolean wkey, skey, dkey, upkey, downkey, leftkey;
int rscore, lscore, mode;
color blue   = color(29, 178, 242);
FPoly box, rbox;
Ball one_, two_, three_, four_;
color one, two;
FBox wallmid, goalright, goalleft;
void createWorld(){
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 980);
  world.setEdges();
}

void keyPressed(){
  if(key == 'w'||key == 'W'){wkey = true;}
  if(key == 's'||key == 'S'){skey = true;}
  if(key == 'd'||key == 'D'){dkey = true;}
  if(keyCode == UP){upkey = true;}
  if(keyCode == LEFT){leftkey = true;}
  if(keyCode == DOWN){downkey = true;}
}
void keyReleased(){
  if(key == 'd'||key == 'D'){dkey = false;}
  if(key == 'w'||key == 'W'){wkey = false;}
  if(key == 's'||key == 'S'){skey = false;}
  if(keyCode == UP){upkey = false;}
  if(keyCode == DOWN){downkey = false;}
  if(keyCode == LEFT){leftkey = false;}
}

void leftplayer(){
  float scaleFactor = 1; // 50% scale factor

  float[] xPoints = {
    150, 200, 200, 275, 275, 200, 200, 150, 150, 75, 75, 150
  };

  float[] yPoints = {
    250, 250, 150, 150, 100, 100, 25, 25, 100, 100, 150, 150
  };

  for (int i = 0; i < xPoints.length; i++) {
    xPoints[i] *= scaleFactor;
    yPoints[i] *= scaleFactor;
  }

  box = new FPoly();
  for (int i = 0; i < xPoints.length; i++) {
    box.vertex(xPoints[i], yPoints[i]);
    //println(xPoints[i]+" "+yPoints[i]);
  }
  
  world.add(box);
} 
void rightplayer(){
  float scaleFactor = 0.5;

  float[] xPoints = {600, 700, 700, 850, 850, 700, 700, 600, 600, 450, 450, 600};
  float[] yPoints = {500, 500, 300, 300, 200, 200, 50, 50, 200, 200, 300, 300};

  for (int i = 0; i < xPoints.length; i++) {
    xPoints[i] *= scaleFactor;
    yPoints[i] *= scaleFactor;
  } 
  rbox = new FPoly();
  for (int i = 0; i < xPoints.length; i++) {
    rbox.vertex(xPoints[i], yPoints[i]);
  }
  world.add(rbox);
  rbox.setPosition(1000, 100);
}

void controls() {
  //left
  if (wkey) {
    box.setVelocity(200, 0);
  } else if (skey) {
    box.setVelocity(-200, 0);
  }
  if (dkey) {
   box.setAngularVelocity(20);
  }
  //right
  if (upkey) {
    rbox.setVelocity(200, 0);
  } else if (downkey) {
    rbox.setVelocity(-200, 0);
  }
  if (leftkey) {
   rbox.setAngularVelocity(20);
  }
  
}
void wall() {
    wallmid = new FBox(50, height/2);
    wallmid.setPosition(width/2, height-200);
    wallmid.setVelocity(0, 0);  // Set velocity to zero
    wallmid.setAngularVelocity(0);  // Set angular velocity to zero
    wallmid.setStatic(true);
    world.add(wallmid);
  }
 
 void rbasket(){
   goalright.setStatic(true);
   goalright.setPosition(15, 400);
   world.add(goalright);
 }
 void lbasket(){
   goalleft.setStatic(true);
   goalleft.setPosition(1650, 400);
   world.add(goalleft);
 }
 
 
 
