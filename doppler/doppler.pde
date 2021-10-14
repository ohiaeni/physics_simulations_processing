PImage panelButton1, panelButton2, remortController, startButton, stopButton, resetButton;
ArrayList<SOUND> sounds;
float posx, posy, speed, count;
boolean resetCount, clickedCount, panelCount;
float fps = 60;
void setup() {
  fullScreen();
  panelButton1 = loadImage("https://live.staticflickr.com/65535/51564193876_f9b9bcea03_o.png");
  panelButton1.resize(width/9, 0);
  panelButton2 = loadImage("https://live.staticflickr.com/65535/51564881204_9a92af5b7b_o.png");
  panelButton2.resize(width/9, 0);
  remortController = loadImage("https://live.staticflickr.com/65535/51567566194_0d0a427593_o.png");
  remortController.resize(width/6, 0);
  startButton = loadImage("https://live.staticflickr.com/65535/51563400792_8950903254_o.png");
  startButton.resize(5*width/72, 0);
  stopButton = loadImage("https://live.staticflickr.com/65535/51563400782_aace81f8ba_o.png");
  stopButton.resize(5*width/72, 0);
  resetButton = loadImage("https://live.staticflickr.com/65535/51564881144_0248886998_o.png");
  resetButton.resize(5*width/72, 0);
  frameRate(fps);
  sounds = new ArrayList<SOUND>();
  posx = 50;
  posy = height/2;
  speed = 340; 
  count = 0;
  resetCount = true;
  clickedCount = false;
  panelCount = false;
  textSize(width/100);
  textAlign(CENTER, CENTER);
}

void draw() {
  backGround();
  panel();
  time_count();
  for (int i=0; i<sounds.size(); i++) {
    sounds.get(i).calculation();
    sounds.get(i).display();
  }
  sound_source();
  sound_output();
}
