class Light {
  float posx, posy, clr;
  char type;
  int intensity;
  Light(float x, float y, char t) {
    posx = x;
    posy = y;
    type = t;
  }
  void display() {
    noStroke();
    if (type == 'R') {
      fill(255, 0, 0, 90);
    } else if (type == 'G') {
      fill(0, 255, 0, 90);
    } else {
      fill(0, 0, 255, 90);
    }
    if (clickedCount ==true) {
      posx -= 10;
    }
    ellipse(posx, posy, width/50, width/50);
  }
}
