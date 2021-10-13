int hm = 100;
WAVE[] waves1 = new WAVE[100], waves2 = new WAVE[100];
int count, COUNT, fps;
void setup() {
    fullScreen();
    for (int i = 0; i < hm; i++) {
        waves1[i] = new WAVE(width / 4, height / 2, i, 0);
        waves2[i] = new WAVE(width / 2, height / 2, i, 0);
    }
    count = 0;
    COUNT = 0;
    fps = 60;
    frameRate(fps);
    textSize(width / 100);
    textAlign(CENTER, CENTER);
}

void draw() {
    background(0);
    stroke(255, 50);
    fill(255);
    for (int i = 0; i < height / 2; i += 10) {
        if (i % 100 == 0) {
            strokeWeight(3);
            text(i, width / 2 - width / 100, height / 2 + i);
            text(i, width / 2 - width / 100, height / 2 - i);
        } else {
            strokeWeight(1);
        }
        line(0, height / 2 - i, width, height / 2 - i);
        line(0, height / 2 + i, width, height / 2 + i);
    }
    for (int i = 0; i < width / 2; i += 10) {
        if (i % 100 == 0) {
            strokeWeight(3);
            text(i, width / 2 + i, height / 2 + width / 100);
            text(i, width / 2 - i, height / 2 + width / 100);
        } else {
            strokeWeight(1);
        }
        line(width / 2 - i, 0, width / 2 - i, height);
        line(width / 2 + i, 0, width / 2 + i, height);
    }
    count++;
    if (count % fps == 0) {
        COUNT++;
    }
    for (int i = 0; i < hm; i++) {
        waves1[i].display();
        waves2[i].display();
    }
    if (mousePressed) {
        for (int i = 0; i < hm; i++) {
            waves1[i].posx = mouseX;
            waves1[i].posy = mouseY;
        }
    }
}
class WAVE {
    float posx, posy, radi;
    int number;
    WAVE(float x, float y, int n, float r) {
        posx = x;
        posy = y;
        number = n;
        radi = r;
    }
    void display() {
        if (number < COUNT) {
            radi++;
        }
        noFill();
        for (int i = 0; i < 10; i++) {
            strokeWeight(50 - 5 * i);
            stroke(0, 100, 0, 30);
            ellipse(posx, posy, radi * 2, radi * 2);
        }
    }
}
