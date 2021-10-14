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
            radi++;
        noFill();
        for (int i = 0; i < 10; i++) {
            strokeWeight(50 - 5 * i);
            stroke(0, 100, 0, 30);
            ellipse(posx, posy, radi * 2, radi * 2);
        }
    }
}
