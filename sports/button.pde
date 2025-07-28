class Button{
 int x, y, w, h;
 boolean clicked;
 color highlight, normal;
 String text;
 PImage img;
 Button(String t, int _x, int _y, int _w, int _h, color norm, color high){
   x=_x;
   y=_y;
   w=_w;
   h=_h;
   text =t;
   highlight = high;
   normal = norm;
   clicked = false;
  } 
  Button(PImage _img, int _x, int _y, int _w, int _h, color norm, color high){
   x=_x;
   y=_y;
   w=_w;
   h=_h;
   img=_img;
   highlight = high;
   normal = norm;
   clicked = false;
  } 
  boolean touchingMouse(){
    if(mouseX>x-w/2 && mouseX <x+w/2 && mouseY>y-h/2 && mouseY <y+h/2){
      return true;
    }
    else{
      return false;
    }
  }
  void checkforClick(){
    if(mouseReleased&&touchingMouse()){
      clicked = true;
    }
    else{
      clicked = false;
    }
  }
   boolean checkClick(){
    if(mouseReleased&&touchingMouse()){
      return true;
    }
    else{
      return false;
    }
  }
  void drawRect() {
    rectMode(CENTER);
    if(touchingMouse()){
      fill(highlight);
    }
    else{
      fill(normal);
    }
    stroke(0);
    strokeWeight(4);
    rect(x, y, w, h, 30);
  }
  void drawLabel(){
     textAlign(CENTER, CENTER);
     if(touchingMouse()){
      fill(normal);
      }
      else{
      fill(highlight);
    }
    if(img==null){
      textSize(w/4);
      text(text, x, y);
    }
    else{
      imageMode(CENTER);
      image(img, x, y, w, h);
    }
  }
  void show(){
    drawRect();
    checkforClick(); 
    if(clicked == true){
      mode =0;
    }
    drawLabel();
   }
}
