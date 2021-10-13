PImage panelButton1, panelButton2, remortController, startButton, stopButton, resetButton;
int hm = 1000;
SOUND[] sounds = new SOUND[hm];
float posx, posy, posx0, posy0, speed, count, COUNT;
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
  for (int i = 0; i< hm; i++) {
    sounds[i] = new SOUND(50, 0, i);
  }
  posx = 50;
  posx0 = 50;
  posy = height/2;
  posy0 = height/2;
  speed = 340; 
  count = 0;
  COUNT = 0;
  resetCount = true;
  clickedCount = false;
  panelCount = false;
  textSize(width/100);
  textAlign(CENTER, CENTER);
}
void draw() {
  backGround();
  for (int i = 0; i < hm; i++) {
    sounds[i].calculation();
  }
  calculation();
  for (int i = 0; i < hm; i++) {
    sounds[i].display();
  }
  display();
  panel();
} 
void mouseClicked() {
  if ( width/(24*6)< mouseX && mouseX < startButton.width+width/(24*6) && height-startButton.height-width/(24*6) < mouseY && mouseY < height-width/(24*6)) {   
    if (clickedCount == false) {
      clickedCount = true;
      resetCount = false;
    } else {
      clickedCount = false;
    }
  }
  if (3*width/(24*6)+startButton.width< mouseX && mouseX < 3*width/(24*6)+startButton.width+resetButton.width && height-resetButton.height-width/(24*6) < mouseY && mouseY < height-width/(24*6)) {
    posx = posx0;
    posy = posy0;
    clickedCount = false;
    resetCount = true;
    count = 0;
    COUNT = 0;
  }
  if (0 < mouseX && mouseX < panelButton1.width && 0 < mouseY && mouseY < panelButton1.height) {
    if (panelCount == false) {
      panelCount = true;
    } else {
      panelCount = false;
    }
  }
  if (dist(9*remortController.width/10, panelButton1.height+3*remortController.height/10, mouseX, mouseY) < remortController.width/20 && panelCount == true) {
    speed+=10;
  }
  if (dist(9*remortController.width/10, panelButton1.height+7*remortController.height/10, mouseX, mouseY) < remortController.width/20 && panelCount == true) {
    if (speed > 0) {
      speed-=10;
    }
  }
}
class SOUND {
  float soundx, radi;
  int number;
  SOUND(float x, float r, int n) {
    soundx = x;
    radi = r;
    number = n;
  }
  void calculation() {
    if (resetCount == true) {
      radi = 0;
    }
    if ( number <= COUNT && clickedCount == true) {
      radi += 340/fps;
    }
    soundx = posx0 + number * speed * 0.1;
  }
  void display() {
    noFill();
    ellipse(soundx, height/2, radi*2, radi*2);
  }
}
void backGround() {
  background(255);
  stroke(0, 100);
  for (int i = 0; i< width-50; i+=10) {
    if (i % 100 == 0) {
      strokeWeight(2);
    } else {
      strokeWeight(1);
    }
    line(i+50, 0, i+50, height);
  }
  for (int i =0; i< height/2; i+=10) {
    if (i % 100 == 0) {
      strokeWeight(2);
    } else {
      strokeWeight(1);
    }
    line(50, height/2+i, width, height/2+i);
    line(50, height/2-i, width, height/2-i);
  }
  stroke(0);
}
void calculation() {
  if (clickedCount == true) {
    count++;
    posx = speed*count/fps+posx0;
    if (count %  int(fps/10) == 0) {
      COUNT ++;
    }
  }
}
void display() {
  fill(0);
  ellipse(posx, posy, 20, 20);
}
void panel() {
  if (panelCount == false) {
    image(panelButton1, 0, 0);
  } else {
    image(panelButton2, 0, 0);
    image(remortController, 0, panelButton1.height);
    fill(255);
    text(speed+"m/s", 2*remortController.width/5, panelButton1.height, remortController.width/3, remortController.height);
    noFill();
  }
  if (clickedCount == false) {
    image(startButton, width/(24*6), height-startButton.height-width/(24*6));
  } else {
    image(stopButton, width/(24*6), height-startButton.height-width/(24*6));
  }
  image(resetButton, 3*width/(24*6)+startButton.width, height-resetButton.height-width/(24*6));
}