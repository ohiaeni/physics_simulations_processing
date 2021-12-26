class WAVE1 {
  float posx, posy, theta, time;
  int number;
  boolean fixed;
  WAVE1(float x, float y, float t, int n, boolean f) {
    posx = x;
    posy = y;
    theta = t;
    number = n;
    fixed = f;
  }
  void calculate() {
    if (number < time) {
      if (theta > -30) {
        theta --;
      }
    } else {
      theta = 0;
    }
    time+=speed;
    posy = (height/100)*sin(radians(6*theta));
  }
}

class WAVE2 {
  float posx, posy, theta, time;
  int number;
  boolean fixed;
  WAVE2(float x, float y, float t, int n, boolean f) {
    posx = x;
    posy = y;
    theta = t;
    number = n;
    fixed = f;
  }
  void calculate() {
    if (number < time-hm) {
      if (fixed_count == false) {
        if (theta > -30) {
          theta --;
        }
      } else {
        if (theta < 30) {
          theta ++;
        }
      }
    } else {
      theta = 0;
    }
    time+=speed;
    posy = (height/100)*sin(radians(6*theta));
  }
}

class MEDIUM {
  float posx, posy;
  int number;
  MEDIUM(float x, float y, int n) {
    posx = x;
    posy = y;
    number = n;
  }
  void calculate() {
    float sum = 0;
    for (int i = 0; i < waves1.size(); i++) {
      if (i % hm == number) {
        sum += waves1.get(i).posy;
      }
    }
    for (int i = 0; i < waves2.size(); i++) {
      if (i % hm == number) {
        sum += waves2.get(i).posy;
      }
    }
    posy = sum;
  }
  void display() {
    strokeWeight(5);
    stroke(0);
    line(posx+100, posy+height/2, number*(width-200)/hm+100, height/2);
    strokeWeight(1);
    noStroke();
    fill(255, 255, 0);
    ellipse(posx+100, posy+height/2, 10, 10);
  }
}
