PImage remortController, spring, startButton, stopButton, resetButton, ball;
PGraphics pg1, pg2;
boolean clickedCount, resetCount;
int fps;
float count;
Spring s1, s2;

void setup() {
    fullScreen();
    remortController = loadImage("https://live.staticflickr.com/65535/51568237564_681294ee80_o.png");
    remortController.resize(width / 6, 0);
    spring = loadImage("https://live.staticflickr.com/65535/51567567161_a3af5e269e_o.png");
    spring.resize(width / (18), 0);
    startButton = loadImage("https://live.staticflickr.com/65535/51563400792_8950903254_o.png");
    startButton.resize(5 * width / 72, 0);
    stopButton = loadImage("https://live.staticflickr.com/65535/51563400782_aace81f8ba_o.png");
    stopButton.resize(5 * width / 72, 0);
    resetButton = loadImage("https://live.staticflickr.com/65535/51564881144_0248886998_o.png");
    resetButton.resize(5 * width / 72, 0);
    ball = loadImage("https://live.staticflickr.com/65535/51567551611_daec8ec816_o.png");
    ball.resize(height / 20, 0);
    pg1 = createGraphics(5 * width / 18, height / 2);
    pg2 = createGraphics(5 * width / 18, height / 2);
    clickedCount = false;
    resetCount = true;
    fps = 60;
    count = 0;
    frameRate(fps);
    textAlign(CENTER, CENTER);
    textSize(width / 100);
    s1 = new Spring(1, 1, 1, 100, 1);
    s2 = new Spring(1, 1, 1, 100, 2);
}

void draw() {
    backGround();
    remocon();
    calculate();
    s1.calculate();
    s1.display();
    s2.calculate();
    s2.display();
}

void mouseClicked() {
    if (width - 3 * width / 18 + width / (24 * 6)< mouseX && mouseX < width - 3 * width / 18 + startButton.width + width / (24 * 6) && height - startButton.height - width / (24 * 6) < mouseY && mouseY < height - width / (24 * 6)) {   
        if (clickedCount == false) {
            clickedCount = true;
            resetCount = false;
        } else {
            clickedCount = false;
        }
    }
    if (width - 3 * width / 18 + 3 * width / (24 * 6) + startButton.width< mouseX && mouseX < width - 3 * width / 18 + 3 * width / (24 * 6) + startButton.width + resetButton.width && height - resetButton.height - width / (24 * 6) < mouseY && mouseY < height - width / (24 * 6)) {
        clickedCount = false;
        resetCount = true;
        count = 0;
        s1 = new Spring(1, 1, 1, 100, 1);
        s2 = new Spring(1, 1, 1, 100, 2);
    }
    if (resetCount == true) {
        for (int i = 0; i < 9; i++) {
            if (dist(width - remortController.width / 10,(3 + 10 * i) * remortController.height / 90, mouseX, mouseY) < remortController.width / 20) {
                if (i ==  0) {
                    s1.konstant++;
                } else if (i == 1) {
                    s1.combination++;
                    if (s1.combination > 3) {
                        s1.combination = 1;
                    }
                } else if (i == 2) {
                    s1.weight += 0.01;
                } else if (i == 3) {
                    s1.amplitude++;
                } else if (i == 5) {
                    s2.konstant++;
                } else if (i == 6) {
                    s2.combination++;
                    if (s2.combination > 3) {
                        s2.combination = 1;
                    }
                } else if (i == 7) {
                    s2.weight += 0.01;
                } else if (i == 8) {
                    s2.amplitude++;
                }
            }
            if (dist(width - remortController.width / 10,(7 + 10 * i) * remortController.height / 90, mouseX, mouseY) < remortController.width / 20) {
                if (i ==  0 && s1.konstant > 1) {
                    s1.konstant--;
                } else if (i == 1) {
                    s1.combination--;
                    if (s1.combination > 1) {
                        s1.combination = 3;
                    }
                } else if (i == 2 && s1.weight > 0.01) {
                    s1.weight -= 0.01;
                } else if (i == 3 && s1.amplitude > 1) {
                    s1.amplitude--;
                } else if (i == 5 && s2.konstant > 1) {
                    s2.konstant--;
                } else if (i == 6) {
                    s2.combination--;
                    if (s2.combination < 1) {
                        s2.combination = 3;
                    }
                } else if (i == 7 && s2.weight > 0.01) {
                    s2.weight -= 0.01;
                } else if (i == 8 && s2.amplitude > 1) {
                    s2.amplitude--;
                }
            }
        }
    }
}

void backGround() {
    background(255);
    pg1.beginDraw();
    pg1.fill(0);
    pg1.ellipse(count, s1.posy, 5, 5);
    if (resetCount ==  true) {
        pg1.fill(255);
        pg1.rect(0, 0, 5 * width / 18, height / 2);
    }
    pg1.endDraw();
    image(pg1, 10 * width / 18, 0);
    pg2.beginDraw();
    pg2.fill(0);
    pg2.ellipse(count, s2.posy, 5, 5);
    if (resetCount == true) {
        pg2.fill(255);
        pg2.rect(0, 0, 5 * width / 18, height / 2);
    }
    pg2.endDraw();
    image(pg2, 10 * width / 18, height / 2);
    stroke(0);
    strokeWeight(2);
    noFill();
    for (int x = 0; x < 3; x++) {
        for (int y = 0; y < 2; y++) {
            rect(5 * width / 18 * x,height / 2 * y, 5 * width / 18, height / 2);
        }
    }
}

void remocon() {
    image(remortController, width - 3 * width / 18, 0);
    strokeWeight(1);
    for (int i = 0; i < 9; i++) {
        if (i == 0) {
            text(s1.konstant + "N/m", width - width / 6 + 2 * remortController.width / 5, remortController.height / 9 * i, remortController.width / 3, remortController.height / 9);
        } else if (i == 1) {
            text(str(s1.combination), width - width / 6 + 2 * remortController.width / 5, remortController.height / 9 * i, remortController.width / 3, remortController.height / 9);
        } else if (i == 2) {
            text(round(s1.weight * 1000) + "g", width - width / 6 + 2 * remortController.width / 5, remortController.height / 9 * i, remortController.width / 3, remortController.height / 9);
        } else if (i == 3) {
            text(s1.amplitude + "cm", width - width / 6 + 2 * remortController.width / 5, remortController.height / 9 * i, remortController.width / 3, remortController.height / 9);
        } else if (i == 4) {
            text(nf(count / fps, 1, 2) + "s", width - width / 6 + 2 * remortController.width / 5, remortController.height / 9 * i, remortController.width / 3, remortController.height / 9);
        } else if (i == 5) {
            text(str(s2.konstant) + "N/m", width - width / 6 + 2 * remortController.width / 5, remortController.height / 9 * i, remortController.width / 3, remortController.height / 9);
        } else if (i == 6) {
            text(str(s2.combination), width - width / 6 + 2 * remortController.width / 5, remortController.height / 9 * i, remortController.width / 3, remortController.height / 9);
        } else if (i == 7) {
            text(round(s2.weight * 1000) + "g", width - width / 6 + 2 * remortController.width / 5, remortController.height / 9 * i, remortController.width / 3, remortController.height / 9);
        } else if (i == 8) {
            text(s2.amplitude + "cm", width - width / 6 + 2 * remortController.width / 5, remortController.height / 9 * i, remortController.width / 3, remortController.height / 9);
        }
    }
    if (clickedCount == false) {
        image(startButton, width - 3 * width / 18 + width / (24 * 6), height - startButton.height - width / (24 * 6));
    } else {
        image(stopButton, width - 3 * width / 18 + width / (24 * 6), height - startButton.height - width / (24 * 6));
    }
    image(resetButton, width - 3 * width / 18 + 3 * width / (24 * 6) + startButton.width, height - resetButton.height - width / (24 * 6));
}

void calculate() {
    if (clickedCount == true) {
        count++;
    }
}

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
            line((5 * width / 18) / 2, d,(5 * width / 18) / 2, 10 + d);
            image(spring,(5 * width / 18) / 2 - spring.width / 2, 10 + d, spring.width, posy - 20 - ball.height / 2);
            line((5 * width / 18) / 2, posy - 10 - ball.height / 2 + d,(5 * width / 18) / 2, posy - ball.height / 2 + d);
        }
        if (combination == 2) {
            line((5 * width / 18) / 2, d,(5 * width / 18) / 2, 10 + d);
            line((5 * width / 18) / 4, 10 + d, 3 * (5 * width / 18) / 4, 10 + d);
            line((5 * width / 18) / 4, 10 + d,(5 * width / 18) / 4, 15 + d);
            line(3 * (5 * width / 18) / 4, 10 + d, 3 * (5 * width / 18) / 4, 15 + d);
            image(spring,(5 * width / 18) / 4 - spring.width / 2, 15 + d, spring.width, posy - 30 - ball.height / 2);
            image(spring, 3 * (5 * width / 18) / 4 - spring.width / 2, 15 + d, spring.width, posy - 30 - ball.height / 2);
            line((5 * width / 18) / 4, posy - 15 - ball.height / 2 + d,(5 * width / 18) / 4, posy - 10 - ball.height / 2 + d);
            line(3 * (5 * width / 18) / 4, posy - 15 - ball.height / 2 + d, 3 * (5 * width / 18) / 4, posy - 10 - ball.height / 2 + d);
            line((5 * width / 18) / 4, posy - 10 - ball.height / 2 + d, 3 * (5 * width / 18) / 4, posy - 10 - ball.height / 2 + d);
            line((5 * width / 18) / 2, posy - 10 - ball.height / 2 + d,(5 * width / 18) / 2, posy - ball.height / 2 + d);
        }
        if (combination == 3) {
            line((5 * width / 18) / 2, d,(5 * width / 18) / 2, 10 + d);
            image(spring,(5 * width / 18) / 2 - spring.width / 2, 10 + d, spring.width,(posy - 30 - ball.height / 2) / 2);
            line((5 * width / 18) / 2,(posy - 30 - ball.height / 2) / 2 + 10 + d,(5 * width / 18) / 2,(posy - 30 - ball.height / 2) / 2 + 20 + d);
            image(spring,(5 * width / 18) / 2 - spring.width / 2,(posy - 30 - ball.height / 2) / 2 + 20 + d, spring.width,(posy - 30 - ball.height / 2) / 2);
            line((5 * width / 18) / 2, posy - 10 - ball.height / 2 + d,(5 * width / 18) / 2, posy - ball.height / 2 + d);
        }
        image(ball,(5 * width / 18) / 2 - ball.width / 2, posy - ball.height / 2 + d);
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
