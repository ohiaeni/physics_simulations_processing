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
      if (dist(width - remortController.width / 10, (3 + 10 * i) * remortController.height / 90, mouseX, mouseY) < remortController.width / 20) {
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
      if (dist(width - remortController.width / 10, (7 + 10 * i) * remortController.height / 90, mouseX, mouseY) < remortController.width / 20) {
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
