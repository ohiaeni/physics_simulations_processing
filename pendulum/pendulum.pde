int radi, fps;
boolean clicked_count, grid_count;
float gravity, count, timer_count;
PImage ball, remort_controller, panel_button1, panel_button2, start_button, stop_button, reset_button, grid_button1, grid_button2, timer;
PrintWriter file;
Ball b1, b2;
void setup() {
  fullScreen();
  radi = width/50;
  fps = 60;
  clicked_count = false;
  grid_count = false;
  gravity = 9.8;
  count = 0;
  ball = loadImage("https://live.staticflickr.com/65535/51671503863_cb9cfd611d_o.png");
  ball.resize(width/18, 0);
  remort_controller = loadImage("https://live.staticflickr.com/65535/51671943434_7875403763_o.png");
  remort_controller.resize(width/6, 0);
  panel_button1 = loadImage("https://live.staticflickr.com/65535/51564193876_f9b9bcea03_o.png");
  panel_button1.resize(width/9, 0);
  panel_button2 = loadImage("https://live.staticflickr.com/65535/51564881204_9a92af5b7b_o.png");
  panel_button2.resize(width/9, 0);
  start_button = loadImage("https://live.staticflickr.com/65535/51673047512_5eeef070b7_o.png");
  start_button.resize(5*width/72, 0);
  stop_button = loadImage("https://live.staticflickr.com/65535/51674520944_fec8f44a10_o.png");
  stop_button.resize(5*width/72, 0);
  reset_button = loadImage("https://live.staticflickr.com/65535/51674724605_d816b9c9f2_o.png");
  reset_button.resize(5*width/72, 0);
  grid_button1 = loadImage("https://live.staticflickr.com/65535/51685319741_3fdcf2eb27_o.png");
  grid_button1.resize(width/9, 0);
  grid_button2 = loadImage("https://live.staticflickr.com/65535/51686220835_3dd44a922d_o.png");
  grid_button2.resize(width/9, 0);
  timer = loadImage("https://live.staticflickr.com/65535/51571742538_2fc8db5a00_o.png");
  timer.resize(width / 6, 0);
  file = createWriter("test.csv");
  b1 = new Ball(500, 8);
  b2 = new Ball(500, 12);
  b1.theta = radians(b1.theta0)*cos(sqrt(gravity/(b1.string_length/float(50*100)))*count/fps);
  b2.theta = radians(b2.theta0)*cos(sqrt(gravity/(b2.string_length/float(50*100)))*count/fps);
  textAlign(CENTER, CENTER);
  textSize(width/100);
}

void draw() {
  background(255);
  if (clicked_count== true) {
    count++;
  }
  background_setting();
  b1.controller(0);
  b2.controller(width/3);
  b1.calculate(0);
  b2.calculate(width/3);
  b1.display(0);
  b2.display(width/3);
  b1.calculate(2*width/3);
  b2.calculate(2*width/3);
  tint(255, 150);
  stroke(0, 150);
  b1.display(2*width/3);
  b2.display(2*width/3);
  tint(255);
  stroke(0);
  button();
  data();
}
