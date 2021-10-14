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
