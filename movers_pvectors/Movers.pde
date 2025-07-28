class Mover{
  PVector loc;
  PVector vel;
  float d;
  
  Mover(){
    d=100;
    loc= new PVector(random(0, width), random(0, height));
    vel = new PVector(1, 0);
    vel.setMag(random(1, 5));
    //vel.rotate(radians(45));rotate PVector
    vel.rotate(radians(45));
  }
  
  Mover(float x, float y){
    d=100;
    loc= new PVector(x, y);
    vel = new PVector(1, 0);
    vel.setMag(random(1, 5));
    //vel.rotate(radians(45));rotate PVector
    vel.rotate(radians(45));
  }
  
  void act(){
    move();
    bounceeOfEdge();
  }
  void move(){
    loc.add(vel);
  }
  void bounceeOfEdge(){
    if(loc.x<0||loc.x>width){
      vel.x=-vel.x;
    }
    if(loc.y<0||loc.y>height){
      vel.y=-vel.y;
    }
  }
  void showBody(){
    noStroke();
    fill(255, 50);
    circle(loc.x, loc.y, d);
  }
  void showConnections(){
    int i =0;
    while(i<movers.size()){
      float dist= dist(loc.x, loc.y, movers.get(i).loc.x, movers.get(i).loc.y);
      if(dist<=200){
        float a = map(dist, 0, 200, 255, 0);
        stroke(255, a);
        strokeWeight(2);
        line(loc.x, loc.y, movers.get(i).loc.x, movers.get(i).loc.y);
      }
      i++;
    }
  }
}
