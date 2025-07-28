class Ball{
   FCircle ball;
   
   Ball(){
   ball = new FCircle(30);
   ball.setDensity(2);
   ball.setRestitution(0.8);
   ball.setVelocity(100, 100);
   ball.setPosition(random(300, width-300), 0);
   world.add(ball);
  }
  
  boolean hitbox(FBox ground){
   ArrayList<FContact> contactList = ball.getContacts();
   int i =0;
   while(i<contactList.size()){
     FContact myContact = contactList.get(i);
     if(myContact.contains(ground)){
       return true;
     }
     i++;
   }
   return false;
 }
 
}
