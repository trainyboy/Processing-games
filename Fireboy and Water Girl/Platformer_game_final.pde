
void draw() {
  if(mode == -1){
    hascheck = false;
    if(hascheckbeg==false){
      starttime=millis();
      hascheckbeg = true;
    }
    red_gem_counter=0;
    blue_gem_counter=0;
    imageMode(CENTER);
    image(intro, width/2, height/2);
  }
  else if(mode == 2){
    imageMode(CENTER);
    image(end, width/2, height/2);
    textMode(CENTER);
    fill(255);
    textSize(80);
    textFont(text, 80);
    text("The End", width/2-160, height/2-100);
    String tmp_red = "Red Gem Collected"+" "+ red_gem_counter+" "+"out of 11";
    textSize(40);
    text(tmp_red, width/2-350, height/2+40);
    String tmp_blue = "Blue Gem Collected"+" "+ blue_gem_counter+" "+"out of 8";
    text(tmp_blue, width/2-350, height/2+100);
    if(hascheck == false){
       endtime = millis();
       hascheck = true;
    }
    String timer = "Your time is "+ (endtime-starttime)/1000/60 + ": "+((endtime-starttime)/1000)%60;
    text(timer, width/2-200, height/2+160);
  }
  else if (mode == 0&&istrue == false) {
    loadWorld(map1);
    istrue = true;
  } else if (mode == 1&&istrue == false) {
    world.clear();
    objects = new ArrayList<FGameObject>();
    loadWorld(map2);
    istrue = true;
  }
  if(mode ==0||mode == 1){
    change_level();
    background(back);
    drawWorld();
    actWorld();
    stroke(255);
    textSize(50);
  }
  if(mode==-1&&keyPressed == true){
      mode=0;
      hascheckbeg = false;
  }
  if(mode==2&&keyPressed == true){
      mode=-1;
  }
}

void change_level() {
  if (player1.gettouch()==true&&player2.gettouch()==true) {
    mode++;
    hasloadplayer_blue = false;
    hasloadplayer_red = false;
    istrue = false;
  }
}
void drawWorld() {
  world.step();
  drawboundry();
}
void loadWorld(PImage img) {
  world = new FWorld(-2000, -2000, 6000, 6000);
  world.setGravity(0, 900);

  for (int y=0; y<img.height; y++) {
    for (int x=0; x< img.width; x++) {
      color c = img.get(x, y);

      //wall
      if (c==wall) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.attachImage(game_wall);
        b.setStatic(true);
        b.setFriction(1.5);
        b.setName("game_wall");
        world.add(b);
      }

      //wall spawn
      if (c==red_water&&img.get(x+1, y)==wall) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.attachImage(water_red_r);
        b.setStatic(true);
        b.setSensor(true);
        b.setName("right_red_water");
        b.setSensor(true);
        world.add(b);
        FBox half = new FBox(gridSize, 0.5*gridSize);
        half.setPosition(x*gridSize, y*gridSize+0.25*gridSize);
        half.setStatic(true);
        half.setSensor(false);
        half.setName("half_red_water");
        half.setNoStroke();
        half.setNoFill();
        world.add(half);
      } else if (c==red_water&&img.get(x-1, y)==wall) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.attachImage(water_red_l);
        b.setSensor(true);
        b.setStatic(true);
        b.setName("left_red_water");
        b.setSensor(true);
        world.add(b);
        FBox half = new FBox(gridSize, 0.5*gridSize);
        half.setPosition(x*gridSize, y*gridSize+0.25*gridSize);
        half.setStatic(true);
        half.setSensor(false);
        half.setName("half_red_water");
        half.setNoStroke();
        half.setNoFill();
        world.add(half);
      } else if (c==red_water) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.attachImage(water_red_c);
        b.setStatic(true);
        b.setSensor(true);
        b.setName("center_red_water");
        b.setSensor(true);
        world.add(b);
        FBox half = new FBox(gridSize, 0.5*gridSize);
        half.setPosition(x*gridSize, y*gridSize+0.25*gridSize);
        half.setStatic(true);
        half.setSensor(false);
        half.setName("half_red_water");
        half.setNoStroke();
        half.setNoFill();
        world.add(half);
      }
      if (c==blue_water&&img.get(x+1, y)==wall) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.attachImage(water_blue_r);
        b.setStatic(true);
        b.setName("right_blue_water");
        b.setSensor(true);
        world.add(b);
        FBox half = new FBox(gridSize, 0.5*gridSize);
        half.setPosition(x*gridSize, y*gridSize+0.25*gridSize);
        half.setStatic(true);
        half.setSensor(false);
        half.setName("half_blue_water");
        half.setNoStroke();
        half.setNoFill();
        world.add(half);
      } else if (c==blue_water&&img.get(x-1, y)==wall) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.attachImage(water_blue_l);
        b.setStatic(true);
        b.setName("left_blue_water");
        b.setSensor(true);
        world.add(b);
        FBox half = new FBox(gridSize, 0.5*gridSize);
        half.setPosition(x*gridSize, y*gridSize+0.25*gridSize);
        half.setStatic(true);
        half.setSensor(false);
        half.setName("half_blue_water");
        half.setNoStroke();
        half.setNoFill();
        world.add(half);
      } else if (c==blue_water) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.attachImage(water_blue_c);
        b.setStatic(true);
        b.setName("center_blue_water");
        b.setSensor(true);
        world.add(b);
        FBox half = new FBox(gridSize, 0.5*gridSize);
        half.setPosition(x*gridSize, y*gridSize+0.25*gridSize);
        half.setStatic(true);
        half.setSensor(false);
        half.setName("half_blue_water");
        half.setNoStroke();
        half.setNoFill();
        world.add(half);
      }
      if (c==green_water&&img.get(x+1, y)==wall) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.attachImage(water_green_r);
        b.setStatic(true);
        b.setName("right_green_water");
        b.setSensor(true);
        world.add(b);
        FBox half = new FBox(gridSize, 0.5*gridSize);
        half.setPosition(x*gridSize, y*gridSize+0.25*gridSize);
        half.setStatic(true);
        half.setSensor(false);
        half.setName("half_green_water");
        half.setNoStroke();
        half.setNoFill();
        world.add(half);
      } else if (c==green_water&&img.get(x-1, y)==wall) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.attachImage(water_green_l);
        b.setStatic(true);
        b.setName("left_green_water");
        b.setSensor(true);
        world.add(b);
        FBox half = new FBox(gridSize, 0.5*gridSize);
        half.setPosition(x*gridSize, y*gridSize+0.25*gridSize);
        half.setStatic(true);
        half.setSensor(false);
        half.setName("half_green_water");
        half.setNoStroke();
        half.setNoFill();
        world.add(half);
      } else if (c==green_water) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.attachImage(water_green_c);
        b.setStatic(true);
        b.setName("center_green_water");
        b.setSensor(true);
        world.add(b);
        FBox half = new FBox(gridSize, 0.5*gridSize);
        half.setPosition(x*gridSize, y*gridSize+0.25*gridSize);
        half.setStatic(true);
        half.setSensor(false);
        half.setName("half_green_water");
        half.setNoStroke();
        half.setNoFill();
        world.add(half);
      }
      
      if (c==blue_door) {
        blue_door_box = new FDoor(gridSize, gridSize, open_door, door_blue, "FPlayer_blue");
        blue_door_box.setPosition(x*gridSize+30, y*gridSize+10);
        blue_door_box.setSensor(true);
        blue_door_box.setStatic(true);
        blue_door_box.setName("blue_door");
        objects.add(blue_door_box);
        print("added");
        world.add(blue_door_box);
      }
      if (c==red_door) {
        red_door_box = new FDoor(gridSize, gridSize, open_door, door_red, "FPlayer_red");
        red_door_box.setPosition(x*gridSize-30, y*gridSize+10);
        red_door_box.setSensor(true);
        red_door_box.setStatic(true);
        red_door_box.setName("red_door");
        objects.add(red_door_box);
        world.add(red_door_box);
      }
      if (c==blue_lever) {
        blue_lever_tmp = new FLever(gridSize, gridSize, lever_blue);
        blue_lever_tmp.setPosition(x*gridSize, y*gridSize);
        blue_lever_tmp.setName("blue_lever");
        blue_lever_tmp.setSensor(true);
        blue_lever_tmp.setStatic(true);
        objects.add(blue_lever_tmp);
        world.add(blue_lever_tmp);
      }
      if (c==red_lever) {
        red_lever_tmp = new FLever(gridSize, gridSize, lever_red);
        red_lever_tmp.setPosition(x*gridSize, y*gridSize);
        red_lever_tmp.setName("red_lever");
        red_lever_tmp.setSensor(true);
        red_lever_tmp.setStatic(true);
        objects.add(red_lever_tmp);
        world.add(red_lever_tmp);
      }
      if (c==button) {
        abutton = new FButton(x*gridSize, y*gridSize, button_pressed, button_);
        abutton.setPosition(x*gridSize, y*gridSize);
        abutton.setStatic(true);
        abutton.setSensor(true);
        objects.add(abutton);
        world.add(abutton);
      }
    }
  }
  for (int y=0; y<img.height; y++) {
    for (int x=0; x< img.width; x++) {
      color c = img.get(x, y);
      if (c==blue_spawn&&hasloadplayer_blue==false) {
        player1 = new FPlayer_blue(x*gridSize-gridSize, y*gridSize-gridSize);
        player1.setName("FPlayer_blue");
        player1.setStatic(false);
        player1.setGrabbable(true);
        world.add(player1);
        
        hasloadplayer_blue = true;
      }
      if (c==red_spawn&&hasloadplayer_red==false) {
        player2 = new FPlayer_red(x*gridSize-gridSize, y*gridSize-gridSize);
        player2.setName("FPlayer_red");
        player2.setStatic(false);
        player2.setGrabbable(true);
        world.add(player2);
        hasloadplayer_red = true;
      }
      if (c==blue_trap_door&&img.get(x+1, y)!=blue_trap_door) {
        FTrapdoor b = new FTrapdoor(x, y, blue_lever_tmp, purple_trap_r);
        b.setPosition(x*gridSize, y*gridSize);
        b.setName("bluetrap_door");
        objects.add(b);
        world.add(b);
      } else if (c==blue_trap_door&&img.get(x-1, y)!=blue_trap_door) {
        FTrapdoor b = new FTrapdoor(x, y, blue_lever_tmp, purple_trap_l);
        b.setPosition(x*gridSize, y*gridSize);
        b.setName("bluetrap_door");
        objects.add(b);
        world.add(b);
      } else if (c==blue_trap_door) {
        FTrapdoor b = new FTrapdoor(x, y, blue_lever_tmp, purple_trap_c);
        b.setPosition(x*gridSize, y*gridSize);
        b.setName("bluetrap_door");
        objects.add(b);
        world.add(b);
      }
      if (mode==0&&c==red_trap_door&&img.get(x+1, y)!=red_trap_door) {
        FTrapdoor b = new FTrapdoor(x, y, red_lever_tmp, grey_trap_r);
        b.setPosition(x*gridSize, y*gridSize);
        b.setName("redtrap door");
        objects.add(b);
        world.add(b);
      } else if (mode==0&&c==red_trap_door&&img.get(x-1, y)!=red_trap_door) {
        FTrapdoor b = new FTrapdoor(x, y, red_lever_tmp, grey_trap_l);
        b.setPosition(x*gridSize, y*gridSize);
        b.setName("redtrap door");
        objects.add(b);
        world.add(b);
      } else if (mode==0&&c==red_trap_door) {
        FTrapdoor b = new FTrapdoor(x, y, red_lever_tmp, grey_trap_c);
        b.setPosition(x*gridSize, y*gridSize);
        b.setName("redtrap door");
        objects.add(b);
        world.add(b);
      }
      if (mode==1&&c==red_trap_door&&img.get(x+1, y)!=red_trap_door) {
        FTrapdoor b = new FTrapdoor(x, y, abutton, grey_trap_r);
        b.setPosition(x*gridSize, y*gridSize);
        b.setName("redtrap door");
        objects.add(b);
        world.add(b);
      } else if (mode==1&&c==red_trap_door&&img.get(x-1, y)!=red_trap_door) {
        FTrapdoor b = new FTrapdoor(x, y, abutton, grey_trap_l);
        b.setPosition(x*gridSize, y*gridSize);
        b.setName("redtrap door");
        objects.add(b);
        world.add(b);
      } else if (mode==1&&c==red_trap_door) {
        FTrapdoor b = new FTrapdoor(x, y, abutton, grey_trap_c);
        b.setPosition(x*gridSize, y*gridSize);
        b.setName("redtrap door");
        objects.add(b);
        world.add(b);
      }
      if (mode==1&&c==trap_door_up&&img.get(x+1, y)!=trap_door_up) {
        FTrapup b = new FTrapup(x*gridSize, y*gridSize, red_lever_tmp, brown_trap_r);
        b.setPosition(x*gridSize, y*gridSize);
        b.setName("trapup");
        objects.add(b);
        world.add(b);
      } else if (mode==1&&c==trap_door_up&&img.get(x-1, y)!=trap_door_up) {
        FTrapup b = new FTrapup(x*gridSize, y*gridSize, red_lever_tmp, brown_trap_l);
        b.setPosition(x*gridSize, y*gridSize);
        b.setName("trapup");
        objects.add(b);
        world.add(b);
      } else if (mode==1&&c==trap_door_up) {
        FTrapup b = new FTrapup(x*gridSize, y*gridSize, red_lever_tmp, brown_trap_c);
        b.setPosition(x*gridSize, y*gridSize);
        b.setName("trapup");
        objects.add(b);
        world.add(b);
      }
      if (c==brick) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setName("Brick");
        b.attachImage(brick_);
        world.add(b);
      }
      if (c==blue_gem) {
        FGem b = new FGem(x*gridSize, y*gridSize, "blue");
        b.setPosition(x*gridSize, y*gridSize);
        objects.add(b);
        world.add(b);
      }
      if (c==red_gem) {
        FGem b = new FGem(x*gridSize, y*gridSize, "red");
        b.setPosition(x*gridSize, y*gridSize);
        objects.add(b);
        world.add(b);
      }
    }
  }
}
void actWorld() {
  player1.act();
  if (player1.isTouching("half_red_water")||player1.isTouching("half_green_water")) {
    //restart game
    death.play();
    player1.setPosition(player1.getposx(), player1.getposy());
    player2.setPosition(player2.getposx(), player2.getposy());
  }
  player2.act();
  if (player2.isTouching("half_blue_water")||player2.isTouching("half_green_water")) {
    death.play();
    //restart game
    player1.setPosition(player1.getposx(), player1.getposy());
    player2.setPosition(player2.getposx(), player2.getposy());
  }
  for (int i=0; i<objects.size(); i++) {
    FGameObject e = objects.get(i);
    e.act();
  }
}

void drawboundry() {
  float scale = 400 / get_distance();
  scale = max(scale, 0.9);
  scale = min(scale, 1.35);
  pushMatrix();
  translate(-getX_center()*scale+width/2, -getY_center()*scale+height/4);
  scale(scale);
  world.draw();
  popMatrix();
  fill(255);
}
float getX_center() {
  return (player1.getX() + player2.getX()) / 2;
}
float getY_center() {
  return (player1.getY() + player2.getY()) / 2;
}
float get_distance() {
  return dist(player1.getX(), player1.getY(), player2.getX(), player2.getY());
}
