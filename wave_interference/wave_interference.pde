WAVE[] waves1 = new WAVE[100], waves2 = new WAVE[100];
int count, fps;
void setup() {
  fullScreen();
  for (int i = 0; i < hm; i++) {
    waves1[i] = new WAVE(width / 4, height / 2, i, 0);
    waves2[i] = new WAVE(width / 2, height / 2, i, 0);
  }
  count = 0;
  fps = 60;
  frameRate(fps);
  textSize(width / 100);
  textAlign(CENTER, CENTER);
}

void draw() {
  backGround();
  for (int i = 0; i < hm; i++) {
    waves1[i].display();
    waves2[i].display();
  }
  if (mousePressed) {
    for (int i = 0; i < hm; i++) {
      waves1[i].posx = mouseX;
      waves1[i].posy = mouseY;
    }
  }
}
