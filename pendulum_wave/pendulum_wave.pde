Table dataArray; //<>//
PImage weight, stop_watch, stop_button, start_button;
int hm = 100;
Ball[] balls = new Ball[hm];
float gravity, radi, count;
boolean clicked_count;
void setup() {
  fullScreen();
  dataArray = loadTable("https://dl.dropboxusercontent.com/s/a4mwnazwmgqmn87/pendulumData.csv", "header");
  weight = loadImage("https://live.staticflickr.com/65535/51671503863_cb9cfd611d_o.png");
  stop_watch = loadImage("https://live.staticflickr.com/65535/51690867829_8f5dbb4793_o.png");
  stop_button = loadImage("https://live.staticflickr.com/65535/51690183358_0389d79046_o.png");
  start_button = loadImage("https://live.staticflickr.com/65535/51690597879_33e64e02d9_o.png");
  for (int i = 0; i < hm; i++) {
    balls[i] = new Ball(dataArray.getFloat(i, 3), asin(100/dataArray.getFloat(i, 3)));
  }
  gravity = 200;
  radi = width/100;
  count = 0;
  clicked_count = false;
  textSize(width/25);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(255);
  for (int i = 0; i< hm; i++) {
    balls[i].move();
    balls[i].display();
  }
  timer();
}
