void trajectory() {
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
}

void backGround() {
  stroke(0);
  strokeWeight(2);
  noFill();
  for (int x = 0; x < 3; x++) {
    for (int y = 0; y < 2; y++) {
      rect(5 * width / 18 * x, height / 2 * y, 5 * width / 18, height / 2);
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

void time_count() {
  if (clickedCount == true) {
    count++;
  }
}
