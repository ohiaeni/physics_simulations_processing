ArrayList<WAVE> waves1, waves2;
int count, fps;
void setup() {
  fullScreen();
  waves1 = new ArrayList<WAVE>();
  waves2 = new ArrayList<WAVE>();
  count = 0;
  fps = 60;
  frameRate(fps);
  textSize(width / 100);
  textAlign(CENTER, CENTER);
}

void draw() {
  time_count();
  backGround();
  wave_output();
  for (int i = 0; i< waves1.size(); i++) {
    waves1.get(i).posx = mouseX;
    waves1.get(i).posy = mouseY;
    waves1.get(i).display();
  }
  for (int i = 0; i< waves2.size(); i++) {
    waves2.get(i).display();
  }
}
