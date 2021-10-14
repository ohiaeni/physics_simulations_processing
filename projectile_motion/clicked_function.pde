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
    b1 = new Ball(50, 9 * height / 10 - radi, 100, 45, 1, 10, 1, 50, 9 * height / 10 - radi);
    b2 = new Ball(50, 9 * height / 10 - radi, 100, 30, 2, 10, 1, 50, 9 * height / 10 - radi);
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
          } else {
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
          } else {
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
