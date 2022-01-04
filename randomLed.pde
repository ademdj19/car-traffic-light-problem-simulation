class randomLed {
  PVector position = new PVector(0, 0);
  float periode = 0;
  float time_passed = 0;
  double prt = 0;
  boolean is_red = false;
  randomLed(float x, float y, float T) {
    position.x = x;
    position.y = y;
    periode = T;
  }
  void show() {
    noStroke();
    PImage img;
    if(is_red){
      fill(255,0,0);
      stroke(255,0,0);
      img = red_;
    }
    else{
      fill(0,255,0);
      stroke(0,255,0);
      img = green;
    }
    //ellipse(position.x, position.y, 50, 50);
    line(position.x, height/3,position.x,2*height/3);
    image(img,position.x, position.y, 50, 50);
    textAlign(CENTER, CENTER);
    text(floor(time_passed/1000), position.x, position.y-60);
  }
  void update() {
    time_passed += millis() - prt;
    prt = millis();
    if (time_passed/1000 >= periode) {
      if (is_red) {
        is_red = false;
      }else{
        is_red = true;
      }
      time_passed = 0;
    }
    println(time_passed);
  }
  boolean check_car(Car car) {
    float distance = position.x-car.position.x;
    if (distance >=-0.1 && distance <=0 && (is_red||time_passed/1000 == 0)) {
      return true;
    }
    return false;
  }
}
