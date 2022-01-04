Car bwm;
randomLed[] leds;
// test case data -----------------------------
int[][] road = {{300,30},{1500,30},{3000,30}};
int max_speed_km_h = 90; // km/h
/*---------------------------------------------*/
PVector end;
boolean running = true;
PImage carimg, roadimg,red_,green;
float max_speed;
void setup() {
  size(800, 600);
  max_speed = max_speed_km_h/3.6; // m/s
  println(max_speed);
  carimg = loadImage("car_top.png");
  roadimg = loadImage("road.jpg");
  red_ = loadImage("red.png");
  green = loadImage("green.png");
  end = new PVector(0, 0);
  end.x = road[road.length-1][0];
  bwm = new Car(0, height/2, max_speed, 0);
  leds = new randomLed[road.length];
  for (int i=0; i<leds.length; i++) {
    leds[i] = new randomLed(road[i][0], height/2-height/6, road[i][1]);
  }
}
void draw() {
  background(0);
  for(int i = 0; i<round(6*end.x/width);i++){
    image(roadimg, i*width+width/2-max(bwm.position.x,width/2), bwm.position.y, width, height/3);
  }
  if (running) {
    
    bwm.update();
    bwm.show();
    for (int i=0; i<leds.length; i++) {
      leds[i].update();
      leds[i].show();
    }
    for (int i=0; i<leds.length; i++) {
      if (leds[i].check_car(bwm)) {
        reset(max_speed_km_h-1);
      }
    }
    
    
    
    fill(255);
    textAlign(CENTER,CENTER);
    textSize(50);
    text("current speed : "+max_speed_km_h+"Km/h",max(bwm.position.x,width/2),height*2/3+height/4);
    
  }
  else{
    textAlign(CENTER,CENTER);
    textSize(50);
    fill(255,40,255*sin(millis()/100));
    text("the solution is : "+max_speed_km_h+"Km/h",width/2,height/2);
  }
  if (end.x<bwm.position.x) {
    running = false;
  }
}
void reset(int speed) {

  max_speed_km_h = speed;
  max_speed = speed/3.6;
  bwm.velocity = new PVector(max_speed, 0);
  bwm.position.x = 0;
  translate(0, 0);
  for(randomLed p:leds){
    p.time_passed = 0;
    p.is_red = false;
  }
}
