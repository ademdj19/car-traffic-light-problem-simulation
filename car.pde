class Car{
  PVector position = new PVector(0,0);
  PVector velocity = new PVector(0,0);
  Car(float x,float y,float vx,float vy){
    position.x = x;
    position.y = y;
    velocity.x = vx;
    velocity.y = vy;
  }
  void show(){
    fill(255,0,0);
    rectMode(CENTER);
    //rect(position.x,position.y,20,20);
    imageMode(CENTER);
    image(carimg,position.x,position.y,60,40);

  }
  void update(){
    position.x += velocity.x/frameRate;
    position.y += velocity.y/frameRate; 
    if(position.x>width/2){
      translate(-position.x+width/2,0);
    }
  }
}
