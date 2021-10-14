class Spring {
  float posx, posy, konstant, weight;
  int combination, amplitude, number;
  Spring(float k, float w, int c, int a, int n) {
    konstant = k;
    weight = w;
    combination = c;
    amplitude = a;
    number = n;
  }

  void calculate() {
    float s_konstant;
    if (combination == 1) {
      s_konstant = konstant;
    } else if (combination == 2) {
      s_konstant = 2 * konstant;
    } else {
      s_konstant = sq(konstant) / (2 * konstant);
    }
    posx = amplitude * - cos(sqrt(s_konstant / weight) * (count / fps) + PI / 2);
    posy = amplitude * sin(sqrt(s_konstant / weight) * (count / fps) + PI / 2) + height / 4;
  }

  void display() {
    float d;
    if (number == 1) {
      d = 0;
    } else {
      d = height / 2;
    }
    strokeWeight(3);
    stroke(0, 50);
    line(0, height / 4 + d, 15 * width / 18, height / 4 + d);
    line(0, height / 4 + d - amplitude, 15 * width / 18, height / 4 + d - amplitude);
    line(0, height / 4 + d + amplitude, 15 * width / 18, height / 4 + d + amplitude);
    if (combination == 1) {
      line((5 * width / 18) / 2, d, (5 * width / 18) / 2, 10 + d);
      image(spring, (5 * width / 18) / 2 - spring.width / 2, 10 + d, spring.width, posy - 20 - ball.height / 2);
      line((5 * width / 18) / 2, posy - 10 - ball.height / 2 + d, (5 * width / 18) / 2, posy - ball.height / 2 + d);
    }
    if (combination == 2) {
      line((5 * width / 18) / 2, d, (5 * width / 18) / 2, 10 + d);
      line((5 * width / 18) / 4, 10 + d, 3 * (5 * width / 18) / 4, 10 + d);
      line((5 * width / 18) / 4, 10 + d, (5 * width / 18) / 4, 15 + d);
      line(3 * (5 * width / 18) / 4, 10 + d, 3 * (5 * width / 18) / 4, 15 + d);
      image(spring, (5 * width / 18) / 4 - spring.width / 2, 15 + d, spring.width, posy - 30 - ball.height / 2);
      image(spring, 3 * (5 * width / 18) / 4 - spring.width / 2, 15 + d, spring.width, posy - 30 - ball.height / 2);
      line((5 * width / 18) / 4, posy - 15 - ball.height / 2 + d, (5 * width / 18) / 4, posy - 10 - ball.height / 2 + d);
      line(3 * (5 * width / 18) / 4, posy - 15 - ball.height / 2 + d, 3 * (5 * width / 18) / 4, posy - 10 - ball.height / 2 + d);
      line((5 * width / 18) / 4, posy - 10 - ball.height / 2 + d, 3 * (5 * width / 18) / 4, posy - 10 - ball.height / 2 + d);
      line((5 * width / 18) / 2, posy - 10 - ball.height / 2 + d, (5 * width / 18) / 2, posy - ball.height / 2 + d);
    }
    if (combination == 3) {
      line((5 * width / 18) / 2, d, (5 * width / 18) / 2, 10 + d);
      image(spring, (5 * width / 18) / 2 - spring.width / 2, 10 + d, spring.width, (posy - 30 - ball.height / 2) / 2);
      line((5 * width / 18) / 2, (posy - 30 - ball.height / 2) / 2 + 10 + d, (5 * width / 18) / 2, (posy - 30 - ball.height / 2) / 2 + 20 + d);
      image(spring, (5 * width / 18) / 2 - spring.width / 2, (posy - 30 - ball.height / 2) / 2 + 20 + d, spring.width, (posy - 30 - ball.height / 2) / 2);
      line((5 * width / 18) / 2, posy - 10 - ball.height / 2 + d, (5 * width / 18) / 2, posy - ball.height / 2 + d);
    }
    image(ball, (5 * width / 18) / 2 - ball.width / 2, posy - ball.height / 2 + d);
    noFill();
    ellipse(5 * width / 18 + (5 * width / 18) / 2, height / 4 + d, amplitude * 2, amplitude * 2);
    line(5 * width / 18 + (5 * width / 18) / 2, height / 4 + d, 5 * width / 18 + (5 * width / 18) / 2 + posx, posy + d);
    image(ball, 5 * width / 18 + (5 * width / 18) / 2 - ball.width / 2 + posx, posy - ball.height / 2 + d);
    stroke(0, 100);
    for (int i = 0; i < 5 * width / 18; i += 6 * 2) {
      if (i % 60 == 0) {
        strokeWeight(2);
      } else {
        strokeWeight(1);
      }
      line(10 * width / 18 + i, d, 10 * width / 18 + i, height / 2 + d);
    }
    for (int i = 0; i < height / 4; i += 5 * 2) {
      if (i % 50 == 0) {
        strokeWeight(2);
      } else {
        strokeWeight(1);
      }
      line(10 * width / 18, height / 4 - i + d, 15 * width / 18, height / 4 - i + d);
      line(10 * width / 18, height / 4 + i + d, 15 * width / 18, height / 4 + i + d);
    }
    strokeWeight(4);
    stroke(0);
    line(10 * width / 18, d, 10 * width / 18, height / 2 + d);
    line(10 * width / 18, height / 4 + d, 15 * width / 18, height / 4 + d);
    fill(0);
    triangle(10 * width / 18, d, 10 * width / 18 - height / 75, height / 75 + d, 10 * width / 18 + height / 75, height / 75 + d);
    triangle(15 * width / 18, height / 4 + d, 15 * width / 18 - height / 75, height / 4 + d - height / 75, 15 * width / 18 - height / 75, height / 4 + d + height / 75);
    strokeWeight(1);
    for (int i = 0; i < height / 4 - 50; i += 50) {
      text(i, 10 * width / 18 - width / 100, height / 4 - i + d);
      text( -i, 10 * width / 18 - width / 100, height / 4 + i + d);
    }
    for (int i = 60; i < 5 * width / 18; i += 60) {
      text(int(i / 60), 10 * width / 18 + i, height / 4 + d + width / 100);
    }
  }
}
