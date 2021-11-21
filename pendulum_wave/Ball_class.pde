class Ball {
  float posx, posy, speed, theta, theta0, Long;
  Ball(float L, float t0) {
    Long = L;
    theta0 = t0;
  }
  void move() {
    theta = theta0*sin(count*sqrt(gravity/(Long*60)));
    posx = width/2+Long*sin(theta);
    posy = 100+Long*cos(theta);
  }
  void display() {
    line(width/2, 100, posx, posy);
    image(weight, posx-radi, posy-radi, radi*2, radi*2);
  }
}
