void backGround(){
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

void time_count(){
  count++;
}
