PImage remortController, spring, startButton, stopButton, resetButton, ball;
PGraphics pg1, pg2;
boolean clickedCount, resetCount;
int fps;
float count;
Spring s1, s2;

void setup() {
  fullScreen();
  remortController = loadImage("https://live.staticflickr.com/65535/51568237564_681294ee80_o.png");
  remortController.resize(width / 6, 0);
  spring = loadImage("https://live.staticflickr.com/65535/51567567161_a3af5e269e_o.png");
  spring.resize(width / (18), 0);
  startButton = loadImage("https://live.staticflickr.com/65535/51563400792_8950903254_o.png");
  startButton.resize(5 * width / 72, 0);
  stopButton = loadImage("https://live.staticflickr.com/65535/51563400782_aace81f8ba_o.png");
  stopButton.resize(5 * width / 72, 0);
  resetButton = loadImage("https://live.staticflickr.com/65535/51564881144_0248886998_o.png");
  resetButton.resize(5 * width / 72, 0);
  ball = loadImage("https://live.staticflickr.com/65535/51567551611_daec8ec816_o.png");
  ball.resize(height / 20, 0);
  pg1 = createGraphics(5 * width / 18, height / 2);
  pg2 = createGraphics(5 * width / 18, height / 2);
  clickedCount = false;
  resetCount = true;
  fps = 60;
  count = 0;
  frameRate(fps);
  textAlign(CENTER, CENTER);
  textSize(width / 100);
  s1 = new Spring(1, 1, 1, 100, 1);
  s2 = new Spring(1, 1, 1, 100, 2);
}

void draw() {
  trajectory();
  backGround();
  remocon();
  time_count();
  s1.calculate();
  s1.display();
  s2.calculate();
  s2.display();
}
