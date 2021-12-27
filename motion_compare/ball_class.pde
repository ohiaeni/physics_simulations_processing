class Ball {
  float posx, posy, acceleration, velocity0;
  Ball(float x, float y, float v_0, float a) {
    posx = x;
    posy = y;
    velocity0 = v_0;
    acceleration = a;
  }
  
  void calculate() {
    if (clicked_count == true) {
      posx = velocity0 * 50 * (count/fps) + (1.0/2.0) * 50 * acceleration * (sq(count/fps)) + radi;
    }
  }

  void display() {
    strokeWeight(3);
    ellipse(posx, posy, radi*2, radi*2);
    point(posx, posy);
    strokeWeight(1);
    fill(100);
    rect(0, posy+radi, width, height/25);
    fill(255);
  }
}
