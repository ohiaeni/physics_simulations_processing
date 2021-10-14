PImage panelButton1, panelButton2, remortController1, remortController2, startButton, stopButton, resetButton, timer;
PrintWriter file;
int fps, trajectoryCount, radi, number;
boolean clickedCount, panelCount, resetCount;
float gravity, count, timerCount;
PGraphics pg;
Ball b1, b2;
void setup() {
    fullScreen();
    panelButton1 = loadImage("https://live.staticflickr.com/65535/51564193876_f9b9bcea03_o.png");
    panelButton1.resize(width / 9, 0);
    panelButton2 = loadImage("https://live.staticflickr.com/65535/51564881204_9a92af5b7b_o.png");
    panelButton2.resize(width / 9, 0);
    remortController1 = loadImage("https://live.staticflickr.com/65535/51565380455_ef50babf79_o.png");
    remortController1.resize(width / 6, 0);
    remortController2 = loadImage("https://live.staticflickr.com/65535/51565132884_72d0a3da71_o.png");
    remortController2.resize(width / 6, 0);
    startButton = loadImage("https://live.staticflickr.com/65535/51563400792_8950903254_o.png");
    startButton.resize(5 * width / 72, 0);
    stopButton = loadImage("https://live.staticflickr.com/65535/51563400782_aace81f8ba_o.png");
    stopButton.resize(5 * width / 72, 0);
    resetButton = loadImage("https://live.staticflickr.com/65535/51564881144_0248886998_o.png");
    resetButton.resize(5 * width / 72, 0);
    timer = loadImage("https://live.staticflickr.com/65535/51571742538_2fc8db5a00_o.png");
    timer.resize(width / 6, 0);
    file = createWriter("test.csv");
    fps = 60;
    trajectoryCount = 0;
    radi = 30;
    number = 0;
    clickedCount = false;
    panelCount = false;
    resetCount = true;
    gravity = 9.8;
    count = 0;
    timerCount = 0;
    pg = createGraphics(width, height);
    b1 = new Ball(50, 9 * height / 10 - radi, 100, 45, 1, 10, 1, 50, 9 * height / 10 - radi);
    b2 = new Ball(50, 9 * height / 10 - radi, 100, 30, 2, 10, 1, 50, 9 * height / 10 - radi);
    frameRate(fps);
    textSize(width / 100);
    textAlign(CENTER, CENTER);
}
void draw() {
    if (clickedCount == true) {
        count ++;
    }
    data();
    backGround();
    remocon();
    b1.calculation();
    b2.calculation();
    b1.display();
    b2.display();
}

void mouseClicked() {
    if (width - panelButton1.width < mouseX && mouseX < width && 0 < mouseY && mouseY < panelButton1.height) {
        if (panelCount == true) {
            panelCount = false;
        } else {
            panelCount = true;
        }
    }
    if (width - width / 6 + width / (24 * 6) < mouseX && mouseX < width - width / 6 + width / (24 * 6) + startButton.width && height - startButton.height - width / (24 * 6) < mouseY && mouseY < height - width / (24 * 6)) {
        if (clickedCount == true) {
            clickedCount = false;
        } else {
            clickedCount = true;
            resetCount = false;
        }
    }
    if (width - width / (6 * 2) + width / (24 * 6) < mouseX && mouseX < width - width / (6 * 2) + width / (24 * 6) + resetButton.width && height - startButton.height - width / (24 * 6) < mouseY && mouseY < height - width / (24 * 6)) {
        resetCount = true;
        clickedCount = false;
        b1 = new Ball(50,9 * height / 10 - radi, 100, 45, 1, 10, 1, 50, 9 * height / 10 - radi);
        b2 = new Ball(50,9 * height / 10 - radi, 100, 30, 2, 10, 1, 50, 9 * height / 10 - radi);
        count = 0;
        trajectoryCount = 0;
        number = 0;
    }
    if (dist(width - (width / 6) - timer.width / 10, height - 7 * timer.height / 10, mouseX, mouseY) < timer.width / 20) {
        timerCount++;
    }
    if (dist(width - (width / 6) - timer.width / 10, height - 3 * timer.height / 10, mouseX, mouseY) < timer.width / 20) {
        timerCount--;
        if (timerCount < 0) {
            timerCount = 0;
        }
    }
    if (panelCount == true && clickedCount == false) {
        for (int j = 0; j < 2; j++) {
            for (int i = 0; i < 5; i++) {
                if (dist(width - (width / 6) * (1 - j) - remortController1.width / 10, panelButton1.height + (3 + 10 * i) * remortController1.height / 50, mouseX, mouseY) < remortController1.width / 20) {
                    if (j == 0) {
                        if (i == 0) {
                            b1.speed++;
                        } else if (i == 1) {
                            b1.theta++;
                        } else if (i == 2) {
                            b1.weight++;
                        } else if (i == 3) {
                            b1.posy0 -= 10;
                        } else if (i == 4) {
                            b1.konstant += 0.1;
                        }
                    } else{
                        if (i == 0) {
                            b2.speed++;
                        } else if (i == 1) {
                            b2.theta++;
                        } else if (i == 2) {
                            b2.weight++;
                        } else if (i == 3) {
                            b2.posy0 -= 10;
                        } else if (i == 4) {
                            b2.konstant += 0.1;
                        }
                    }
                }
                if (dist(width - (width / 6) * (1 - j) - remortController1.width / 10, panelButton1.height + (7 + 10 * i) * remortController1.height / 50, mouseX, mouseY) < remortController1.width / 20) {
                    if (j == 0) {
                        if (i == 0) {
                            b1.speed--;
                        } else if (i == 1) {
                            b1.theta--;
                        } else if (i == 2) {
                            b1.weight--;
                        } else if (i == 3 && b1.posy0 < 9 * height / 10 - radi) {
                            b1.posy0 += 10;
                        } else if (i == 4 && b1.konstant > 0) {
                            b1.konstant -= 0.1;
                            if (b1.konstant < 0.1) {
                                b1.konstant = 0;
                            }
                        }
                    } else{
                        if (i == 0) {
                            b2.speed--;
                        } else if (i == 1) {
                            b2.theta--;
                        } else if (i == 2) {
                            b2.weight--;
                        } else if (i == 3 && b2.posy0 < 9 * height / 10 - radi) {
                            b2.posy0 += 10;
                        } else if (i == 4 && b2.konstant > 0) {
                            b2.konstant -= 0.1;
                            if (b2.konstant < 0.1) {
                                b2.konstant = 0;
                            }
                        }
                    }
                }
            }
        }
    }
}
void data() {
    if (count % fps == 0 && count > 0 && clickedCount == true) {
        if (number == 0) {
            file.print("b1-speed");
            file.print(",");
            file.print(b1.speed + "m/s");
            file.print(",");
            file.print("b1-theta");
            file.print(",");
            file.print(b1.theta + "degrees");
            file.print(",");
            file.print("b1-weight");
            file.print(",");
            file.print(b1.weight + "kg");
            file.print(",");
            file.print("b1-konstant");
            file.print(",");
            file.print(b1.konstant);
            file.print(",");
            file.println();
            file.print("b2-speed");
            file.print(",");
            file.print(b2.speed + "m/s");
            file.print(",");
            file.print("b2-theta");
            file.print(",");
            file.print(b2.theta + "degrees");
            file.print(",");
            file.print("b2-weight");
            file.print(",");
            file.print(b2.weight + "kg");
            file.print(",");
            file.print("b2-konstant");
            file.print(",");
            file.print(b2.konstant);
            file.print(",");
            file.println();
            file.print("second");
            file.print(",");
            file.print(",");
            file.print("Ball1-positionX");
            file.print(",");
            file.print(",");
            file.print("Ball1-positionY");
            file.print(",");
            file.print(",");
            file.print("Ball2-positionX");
            file.print(",");
            file.print(",");
            file.print("Ball2-positionY");
            file.print(",");
            file.print(",");
            file.println();  
            file.print(0);
            file.print(",");
            file.print("s");
            file.print(",");
            file.print(b1.posx0 - 50);
            file.print(",");
            file.print("m");
            file.print(",");
            file.print(9 * height / 10 - radi - b1.posy0);
            file.print(",");
            file.print("m");
            file.print(",");
            file.print(b2.posx0 - 50);
            file.print(",");
            file.print("m");
            file.print(",");
            file.print(9 * height / 10 - radi - b2.posy0);
            file.print(",");
            file.print("m");
            file.print(",");
            file.println();
        }
        number ++;
        file.print(number);
        file.print(",");
        file.print("s");
        file.print(",");
        file.print(b1.posx - 50);
        file.print(",");
        file.print("m");
        file.print(",");
        file.print(9 * height / 10 - radi - b1.posy);
        file.print(",");
        file.print("m");
        file.print(",");
        file.print(b2.posx - 50);
        file.print(",");
        file.print("m");
        file.print(",");
        file.print(9 * height / 10 - radi - b2.posy);
        file.print(",");
        file.print("m");
        file.print(",");
        file.println();
        if (number == timerCount && timerCount != 0) {
            file.flush();
            file.close();
            exit();
        }
    }
}
void backGround() {
    background(255);
    pg.beginDraw();
    if (clickedCount == true) {
        trajectoryCount++;
        if (trajectoryCount % 60 == 0) {
            pg.fill(255, 0, 0, 20);
            pg.ellipse(b1.posx, b1.posy, radi * 2, radi * 2);
            pg.fill(0, 0, 255, 20);
            pg.ellipse(b2.posx, b2.posy, radi * 2, radi * 2);
        }
        if (trajectoryCount % 10 == 0) {
            pg.fill(255, 0, 0);
            pg.ellipse(b1.posx, b1.posy, 5, 5);
            pg.fill(0, 0, 255);
            pg.ellipse(b2.posx, b2.posy, 5, 5);
        }
    }
    if (resetCount == true) {
        pg.fill(255);
        pg.rect(0, 0, width, height);
    }
    pg.endDraw();
    image(pg, 0, 0);
    stroke(0, 100);
    for (int i = 0; i < 9 * height / 10; i += 10) {
        if (i % 100 == 0) {
            strokeWeight(2);
        } else {
            strokeWeight(1);
        }
        line(50, 9 * height / 10 - radi - i, width, 9 * height / 10 - radi - i);
    }
    for (int i = 0; i < width; i += 10) {
        if (i % 100 == 0) {
            strokeWeight(2);
        } else {
            strokeWeight(1);
        }
        line(i + 50, 0, i + 50, 9 * height / 10 - radi);
    }
    fill(100, 150);
    rect(0, height - height / 10, width, height / 10);
    fill(0);
    for (int i = 0; i < width - 50; i += 100) {
        text(i, 50 + i, 9 * height / 10 - 15);
    }
    for (int i = 0; i < 9 * height / 10; i += 100) {
        text(i, 20, 9 * height / 10 - i - radi);
    }
}

void remocon() {
    fill(0);
    if (panelCount == false) {
        image(panelButton1, width - width / 9, 0);
    } else {
        image(panelButton2, width - width / 9, 0);
        image(remortController1, width - width / 3, panelButton1.height);
        image(remortController2, width - width / 6, panelButton1.height);
        for (int i = 0; i < 8; i ++) {
            if (i == 0) {
                text(b1.speed + "m/s", width - width / 3 + 2 * remortController1.width / 5, panelButton1.height + remortController1.height / 5 * i, remortController1.width / 3, remortController1.height / 5);
                text(b2.speed + "m/s", width - width / 6 + 2 * remortController2.width / 5, panelButton1.height + remortController2.height / 5 * i, remortController2.width / 3, remortController2.height / 5);
            } else if (i == 1) {
                text(str(b1.theta), width - width / 3 + 2 * remortController1.width / 5, panelButton1.height + remortController1.height / 5 * i, remortController1.width / 3, remortController1.height / 5);
                text(str(b2.theta), width - width / 6 + 2 * remortController2.width / 5, panelButton1.height + remortController2.height / 5 * i, remortController2.width / 3, remortController2.height / 5);
            } else if (i == 2) {
                text(b1.weight + "kg", width - width / 3 + 2 * remortController1.width / 5, panelButton1.height + remortController1.height / 5 * i, remortController1.width / 3, remortController1.height / 5);
                text(b2.weight + "kg", width - width / 6 + 2 * remortController2.width / 5, panelButton1.height + remortController2.height / 5 * i, remortController2.width / 3, remortController2.height / 5);
            } else if (i == 3) {
                text(int(9 * height / 10 - radi - b1.posy0) + "m", width - width / 3 + 2 * remortController1.width / 5, panelButton1.height + remortController1.height / 5 * i, remortController1.width / 3, remortController1.height / 5);
                text(int(9 * height / 10 - radi - b2.posy0) + "m", width - width / 6 + 2 * remortController2.width / 5, panelButton1.height + remortController2.height / 5 * i, remortController2.width / 3, remortController2.height / 5);
            } else if (i == 4) {
                text(nf(b1.konstant, 1, 1), width - width / 3 + 2 * remortController1.width / 5, panelButton1.height + remortController1.height / 5 * i, remortController1.width / 3, remortController1.height / 5);
                text(nf(b2.konstant, 1, 1), width - width / 6 + 2 * remortController2.width / 5, panelButton1.height + remortController2.height / 5 * i, remortController2.width / 3, remortController2.height / 5);
            }
        }
    }
    fill(0);
    text("[m]", 0, 0, 50, 50);
    text("[m]", width - 50, 9 * height / 10 - 50, 50, 50);
    if (clickedCount == false) {
        image(startButton, width - width / 6 + width / (24 * 6), height - startButton.height - width / (24 * 6));
    } else {
        image(stopButton, width - width / 6 + width / (24 * 6), height - stopButton.height - width / (24 * 6));
    }
    image(resetButton, width - width / (6 * 2) + width / (24 * 6), height - resetButton.height - width / (24 * 6));
    image(timer, width - 2 * width / 6, height - timer.height);
    if (timerCount != 0) {
        text(nf((timerCount - count / 60.0), 1, 2) + "s", width - width / 3 + 2 * timer.width / 5, height - timer.height, timer.width / 3, timer.height);
    } else {
        text(0 + "s", width - width / 3 + 2 * timer.width / 5, height - timer.height, timer.width / 3, timer.height);
    }
}
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