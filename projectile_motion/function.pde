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

void time_count() {
  if (clickedCount == true) {
    count ++;
  }
}
