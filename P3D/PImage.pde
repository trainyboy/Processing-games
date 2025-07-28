PImage diamond;

float rotx, roty; 


void setup(){
   size(800, 800, P3D);
   diamond = loadImage("Diamond.png");
   
   textureMode(NORMAL);
}

void draw(){
  background(0);
  pushMatrix();
  translate(width/2, height/2, 0);
  scale(200);
  rotateX(rotx);
  rotateY(roty);
  beginShape();
  noStroke();
  beginShape(QUADS);
  texture(diamond);
  // Top face
vertex(0, 0, 0, 0, 0);
vertex(1, 0, 0, 1, 0);
vertex(1, 0, 1, 1, 1);
vertex(0, 0, 1, 0, 1);

// Bottom face
vertex(0, 1, 0, 0, 0);
vertex(1, 1, 0, 1, 0);
vertex(1, 1, 1, 1, 1);
vertex(0, 1, 1, 0, 1);

// Front face
vertex(0, 0, 1, 0, 0);
vertex(1, 0, 1, 1, 0);
vertex(1, 1, 1, 1, 1);
vertex(0, 1, 1, 0, 1);

// Back face
vertex(0, 0, 0, 0, 0);
vertex(1, 0, 0, 1, 0);
vertex(1, 1, 0, 1, 1);
vertex(0, 1, 0, 0, 1);

// Left face
vertex(0, 0, 0, 0, 0);
vertex(0, 0, 1, 1, 0);
vertex(0, 1, 1, 1, 1);
vertex(0, 1, 0, 0, 1);

// Right face
vertex(1, 0, 0, 0, 0);
vertex(1, 0, 1, 1, 0);
vertex(1, 1, 1, 1, 1);
vertex(1, 1, 0, 0, 1);
endShape();
  popMatrix();
}

void mouseDragged(){
  rotx = rotx+(pmouseY-mouseY)*0.01;
  roty = roty+(pmouseX-mouseX)*0.01;
}
