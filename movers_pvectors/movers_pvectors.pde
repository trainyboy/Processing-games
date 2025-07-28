ArrayList<Mover> movers;
void setup(){
  size(800, 800);
  movers = new ArrayList();//calling mover constructor
  //int i=0;
  //while(i<numofMovers){
   // movers.add(new Mover());
    //i++;
  //}
}
void mouseReleased(){
  movers.add(new Mover(mouseX, mouseY));
}
void draw(){
  background(#3C62CE);
  int i =0;
  while(i<movers.size()){
    movers.get(i).act();
    movers.get(i).showBody();
    movers.get(i).showConnections();
    i++;
  } 
}
