void time_count() {
  count++;
}
void backGround() {
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
}
void wave_output() {
  if (count % fps ==0) {
    waves1.add(new WAVE(mouseX, mouseY, 0));
    waves2.add(new WAVE(width/2, height/2, 0));
  }
  for (int i = 0; i< waves1.size(); i++) {
    if (waves1.get(i).radi > dist(0, 0, width, height))
      waves1.remove(i);
  }
  for (int i = 0; i< waves2.size(); i++) {
    if (waves2.get(i).radi > dist(0, 0, width/2, height/2))
      waves2.remove(i);
  }
}
