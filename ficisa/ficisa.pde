import fisica.*;

//pallete
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color red  = color(74, 163, 57);
color green    = color(224, 80, 61);
color yellow = color(242, 215, 16);
color tofill = (#00FFFFFF);
color tofill1 = (#00FFFFFF);
//assets
PImage redBird;
int cloud1;
int cloud2;

FPoly topPlatform; 
FPoly bottomPlatform;
//fisica
FWorld world;
void setup() {
  //make window
  fullScreen();
  
  //load resources
  redBird = loadImage("kingpig.png");
  redBird.resize(25, 25);
  //initialise world
  makeWorld();

  //add terrain to world
 
  makeTopPlatform();
  makeBottomPlatform();
  cloud1=0;
  cloud2=200;
}


void drawCloud(float x, float y) {
  fill(200);
  noStroke();
   float cloudSize = 30;
  
  ellipse(x, y, cloudSize * 3, cloudSize * 2);
  
  ellipse(x - cloudSize, y - cloudSize, cloudSize * 1.5, cloudSize * 1.5);
  ellipse(x + cloudSize, y - cloudSize, cloudSize * 1.5, cloudSize * 1.5);
  ellipse(x + cloudSize * 2, y, cloudSize * 1.5, cloudSize * 1.5);
  ellipse(x - cloudSize * 2, y, cloudSize * 1.5, cloudSize * 1.5);
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
  world.setGravity(0, 900);
}

//===========================================================================================

void makeTopPlatform() {
  topPlatform = new FPoly();

  //plot the vertices of this platform
  topPlatform.vertex(-100, height*.1);
  topPlatform.vertex(width*0.8, height*0.4);
  topPlatform.vertex(width*0.8, height*0.4+100);
  topPlatform.vertex(-100, height*0.1+100);

  // define properties
  topPlatform.setStatic(true);
  topPlatform.setFillColor(brown);
  topPlatform.setFriction(0.1);

  //put it in the world
  world.add(topPlatform);
}

//===========================================================================================
void makeBottomPlatform() {
  bottomPlatform = new FPoly();

  //plot the vertices of this platform
  bottomPlatform.vertex(300, 300);
   bottomPlatform.vertex(300, 600);
   bottomPlatform.vertex(600, 600);
    bottomPlatform.vertex(600, 300);
     bottomPlatform.vertex(550, 300);
     bottomPlatform.vertex(550, 550);
     bottomPlatform.vertex(350, 550);
     bottomPlatform.vertex(350, 300);
  
  // define properties
  bottomPlatform.setStatic(true);
  bottomPlatform.setFillColor(brown);
  bottomPlatform.setFriction(10);

  //put it in the world
  world.add(bottomPlatform);
}


//===========================================================================================

void draw() {
  println("x: " + mouseX + " y: " + mouseY);
  background(blue);
  drawCloud(cloud1, 200.0);
  if (frameCount % 20 == 0) {  //Every 20 frames ...
    makeCircle();
    makeBlob();
    makeBox();
    makeBird();
  }
  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
  drawCloud(cloud2, 200.0);
  cloud1++;
  cloud2++;
  if(mouseX>=100&&mouseX<=300&&mouseY>=300&&mouseY<=400){
    tofill = (255);
  }
  else{
   tofill = (#00FFFFFF);
  }
  if(mouseX>=1400&&mouseX<=1600&&mouseY>=300&&mouseY<=400){
    tofill1 = (255);
  }
  else{
   tofill1 = (#00FFFFFF);
  }
  button(100, 300, tofill);
  button(1400, 300, tofill1);
}



//===========================================================================================

void makeCircle() {
  FCircle circle = new FCircle(50);
  circle.setPosition(random(width), -5);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(random(0, 2));

  //add to world
  world.add(circle);
}

//===========================================================================================

void makeBlob() {
  FBlob blob = new FBlob();

  //set visuals
  blob.setAsCircle(random(width), -5, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(yellow);

  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);

  //add to the world
  world.add(blob);
}

//===========================================================================================

void makeBox() {
  FBox box = new FBox(25, 25);
  box.setPosition(random(width), -5);

  //set visuals
  box.setStroke(0);
  box.setStrokeWeight(2);
  box.setFillColor(green);
  box.attachImage(redBird);
  //set physical properties
  box.setDensity(0.2);
  box.setFriction(1);
  box.setRestitution(0.8);
  world.add(box);
}
void button(int x, int y, color hex){
  fill(hex);
  rect(x, y, 200, 100);
}
void mousePressed(){
  if(mouseX>=100&&mouseX<=300&&mouseY>=300&&mouseY<=400){
    world.setGravity(0, 900);
  }
  if(mouseX>=1400&&mouseX<=1600&&mouseY>=300&&mouseY<=400){
    world.setGravity(0, 0);
  }
  
    
  
  //button(100, 300);
  //button(1400, 300);
}
//===========================================================================================

void makeBird() {
  FCircle bird = new FCircle(48);
  bird.setPosition(random(width), -5);

  
  //set physical properties
  bird.setDensity(0.8);
  bird.setFriction(1);
  bird.setRestitution(0.5);
  world.add(bird);
}
