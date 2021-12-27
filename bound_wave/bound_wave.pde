int fps = 60; //<>//
float radi;
int hm = 101;
float gravity = 980;
float count;
Ball[] balls = new Ball[hm];
void setup() {
  fullScreen();
  frameRate(fps);
  radi = width/(2*hm);
  for (int i = 0; i< hm; i++) {
    balls[i] = new Ball((width/hm)*i+radi, radi, 0.01*i);
  }
  textAlign(CENTER, CENTER);
  textSize(width/100);
}
void draw() {
  background(0);
  stroke(255);
  for (int i = 0; i < 11; i++) {
    line(0, radi+i*(height-2*radi)/10, width, radi+i*(height-2*radi)/10);
  }
  fill(0);
  rect(width/2-1*width/10-width/100, height/2-(radi+(height-2*radi)/10)/2, width/10, radi+(height-2*radi)/10);
  rect(width/2+width/100, height/2-(radi+(height-2*radi)/10)/2, width/10, radi+(height-2*radi)/10);
  fill(255);
  text("ALIGNMENT", width/2-1*width/10-width/100, height/2-(radi+(height-2*radi)/10)/2, width/10, radi+(height-2*radi)/10);
  text("RANDOM", width/2+width/100, height/2-(radi+(height-2*radi)/10)/2, width/10, radi+(height-2*radi)/10);
  for (int i = 0; i<hm; i++) {
    balls[i].calculation();
    balls[i].display();
  }
}
class Ball {
  float posx, posy, repulsion, speed;
  int boundCount;
  float count;
  Ball(float x, float y, float r) {
    posx = x;
    posy = y;
    repulsion = r;
  }
  void calculation() {
    count++;
    if (boundCount==0) {
      posy = 0.5*gravity*sq(count/fps)+radi;
    } else {
      posy = -speed*count/fps+0.5*gravity*sq(count/fps)+height-radi;
    }

    if (posy + radi> height) {
      boundCount ++;
      count=0;
      speed = pow(repulsion, boundCount)*sqrt(2*gravity*(height-2*radi));
    }
  }
  void display() {
    fill(255);
    ellipse(posx, posy, radi*2, radi*2);
  }
}
void mouseClicked() {
  if (width/2-1*width/10-width/100 < mouseX && mouseX < width/2-1*width/10-width/100+width/10 && height/2-(radi+(height-2*radi)/10)/2 < mouseY && mouseY < height/2-(radi+(height-2*radi)/10)/2+radi+(height-2*radi)/10) {
    for (int i = 0; i< hm; i++) {
      balls[i] = new Ball((width/hm)*i+radi, radi, 0.01*i);
    }
  }
  if (width/2+width/100 < mouseX && mouseX < width/2+width/100+width/10 && height/2-(radi+(height-2*radi)/10)/2 < mouseY && mouseY < height/2-(radi+(height-2*radi)/10)/2+radi+(height-2*radi)/10) {
    for (int i = 0; i< hm; i++) {
      balls[i] = new Ball(random(radi, width-radi), radi, 0.01*i);
    }
  }
}
