class Ball {
  float posx, posy, speed, speedx, speedy, konstant, SPEED, posx0, posy0;
  int theta, number, weight;
  Ball(float x, float y, float s, int t, int n, int w, float k, float x_0, float y_0) {
    posx = x;
    posy = y;
    speed = s;
    theta = t;
    number = n;
    weight = w;
    konstant = k;
    posx0 = x_0;
    posy0 = y_0;
  }
  void calculation() {
    if (clickedCount == true) {
      if (posy >= 9 * height / 10 - radi && posx != 50) {
        posy = 9 * height / 10 - radi;
      } else {
        if (konstant >= 0.1) {
          posx = weight / konstant * speed * cos(radians(theta)) * ( -exp(( -konstant / weight) * (count / fps)) + 1) + posx0;
          posy = weight / konstant * ( -speed * sin(radians(theta)) - weight * gravity / konstant) * ( -exp(( -konstant / weight) * (count / fps)) + 1) + (weight * gravity / konstant) * count / fps + posy0;
        } else {
          posx = speed * cos(radians(theta)) * count / fps + posx0;
          posy = -speed * sin(radians(theta)) * (count / fps) + (0.5) * gravity * sq(count / fps) + posy0;
        }
      }
    } else if (resetCount == true) {
      posx = posx0;
      posy = posy0;
    }
  }

  void display() {
    if (number == 1) {
      fill(255, 0, 0, 100);
    }
    if (number == 2) {
      fill(0, 0, 255, 100);
    }
    strokeWeight(1);
    ellipse(posx, posy, radi * 2, radi * 2);
    if (clickedCount == false) {
      strokeWeight(3);
      line(posx, posy, posx + 100 * cos(radians( -theta)), posy + 100 * sin(radians( -theta)));
    }
  }
}
