float r, k, a, theta, x, y;
int i, N, makisu;
float r_max;
PImage remocon, formula;

void setup() {
  fullScreen();
  noStroke();
  k = 0.05;
  a = 0.2;
  makisu = 6;
  N = 10000;
  remocon = loadImage("https://live.staticflickr.com/65535/52104311296_f0bcdfc84a_o.png");
  remocon.resize(width/6, 0);
  formula = loadImage("https://live.staticflickr.com/65535/52104819780_b73dd49acb_o.png");
  formula.resize(width/6, 0);
  textSize(width/50);
  textAlign(CENTER);
}
void draw() {
  backgroundSetting();
  pushMatrix();
  rotate(PI);
  translate(-width/2, -height/2);
  fill(0);
  r_max = k * exp(a * (makisu * PI));
  noStroke();
  for (int i = 0; i<N; i++) {
    theta = (makisu * PI / N) * i;
    r = k * exp(a * theta);
    x = r * cos(theta)*(3*height/8)/ r_max;
    y = r * sin(theta)*(3*height/8) /r_max;
    ellipse(x, y, 3, 3);
  }
  popMatrix();
}

void backgroundSetting() {
  background(200);
  fill(255);
  rect(width/2-3*height/8, height/8, 3*height/4, 3*height/4);
  stroke(0, 50);
  for (int i = 0; i <50; i++) {
    line(width/2-3*height/8, height/8+3*height/4*i/50, width/2+3*height/8, height/8+3*height/4*i/50);
    line(width/2-3*height/8+3*height/4*i/50, height/8, width/2-3*height/8+3*height/4*i/50, height/8+3*height/4);
  }
  image(remocon, 0, 0);
  text(nf(k, 1, 2), 5*remocon.width/12, remocon.height/12, remocon.width/3, remocon.height/2);
  text(nf(a, 1, 2), 5*remocon.width/12, 5*remocon.height/12, remocon.width/3, remocon.height/2);
  text(str(makisu), 5*remocon.width/12, 9*remocon.height/12, remocon.width/3, remocon.height/2);
  image(formula, 0, remocon.height);
}

void mousePressed() {
  if (dist(remocon.width-remocon.width/10, remocon.width/10, mouseX, mouseY)<remocon.width/20) {
    k+=0.05;
  }
  if (dist(remocon.width-remocon.width/10, remocon.height/3-remocon.width/10, mouseX, mouseY)<remocon.width/20) {
    k-=0.05;
    if (k < 0.05) {
      k = 0.05;
    }
  }
  if (dist(remocon.width-remocon.width/10, remocon.height/3+remocon.width/10, mouseX, mouseY)<remocon.width/20) {
    a+=0.05;
  }
  if (dist(remocon.width-remocon.width/10, 2*remocon.height/3-remocon.width/10, mouseX, mouseY)<remocon.width/20) {
    a-=0.05;
    if (a < 0.05) {
      a = 0.05;
    }
  }
  if (dist(remocon.width-remocon.width/10, 2*remocon.height/3+remocon.width/10, mouseX, mouseY)<remocon.width/20) {
    makisu++;
  }
  if (dist(remocon.width-remocon.width/10, remocon.height-remocon.width/10, mouseX, mouseY)<remocon.width/20) {
    makisu--;
    if (makisu < 1) {
      makisu = 1;
    }
  }
}
