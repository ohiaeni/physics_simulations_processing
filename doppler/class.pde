class SOUND {
  float soundx, radi;
  SOUND(float x, float r) {
    soundx = x;
    radi = r;
  }
  void calculation() {
    if (resetCount == true) {
      radi = 0;
    }
    if (clickedCount == true) {
      radi += 340/fps;
    }
  }
  void display() {
    noFill();
    ellipse(soundx, height/2, radi*2, radi*2);
  }
}
