PImage head, light, remortController, startButton, stopButton, resetButton, spectrum, graph; //<>//
boolean clickedCount, resetCount;
Table dataArray;
float r_intensity, g_intensity, b_intensity, r_i_change, g_i_change, b_i_change;
int count, fps;
ArrayList<Light> red, green, blue;

void setup() {
  fullScreen();
  head = loadImage("https://live.staticflickr.com/65535/51575428715_f441600187_o.png");
  head.resize(8*width/18, 0);
  light = loadImage("https://live.staticflickr.com/65535/51575428680_03dd6f8be3_o.png");
  light.resize(5*width/18, 0);
  remortController = loadImage("https://live.staticflickr.com/65535/51575428650_47984b2577_o.png");
  remortController.resize(5*width/18, 0);
  startButton = loadImage("https://live.staticflickr.com/65535/51563400792_8950903254_o.png");
  startButton.resize(5*width/72, 0);
  stopButton = loadImage("https://live.staticflickr.com/65535/51563400782_aace81f8ba_o.png");
  stopButton.resize(5*width/72, 0);
  resetButton = loadImage("https://live.staticflickr.com/65535/51564881144_0248886998_o.png");
  resetButton.resize(5*width/72, 0);
  spectrum = loadImage("https://live.staticflickr.com/65535/51575456450_fb631bc801_o.png");
  spectrum.resize(width/2, 0);
  graph = loadImage("https://live.staticflickr.com/65535/51577434655_71995dd63f_o.png");
  graph.resize(width/2, 0);
  clickedCount = false;
  resetCount = true;
  dataArray = loadTable("https://dl.dropboxusercontent.com/s/952h9n9b3hrfd4y/rgbData.csv", "header");
  r_intensity = width-9*remortController.width/10;
  g_intensity = width-9*remortController.width/10;
  b_intensity = width-9*remortController.width/10;
  r_i_change = 0;
  g_i_change = 0;
  b_i_change = 0;
  count = 0;
  fps = 60;
  red = new ArrayList<Light>();
  green = new ArrayList<Light>();
  blue = new ArrayList<Light>();
  frameRate(fps);
  textSize(width/100);
  textAlign(CENTER, CENTER);
}

void draw() {
  time_count();
  backGround();
  calculate();
  remocon();
  light_output();
  for (int i=0; i<red.size(); i++) {
    red.get(i).display();
  }
  for (int i=0; i<green.size(); i++) {
    green.get(i).display();
  }
  for (int i=0; i<blue.size(); i++) {
    blue.get(i).display();
  }
  graph();
}
