void backGround() {
  background(255);
  stroke(0, 100);
  for (int i = 0; i< width-50; i+=10) {
    if (i % 100 == 0) {
      strokeWeight(2);
    } else {
      strokeWeight(1);
    }
    line(i+50, 0, i+50, height);
  }
  for (int i =0; i< height/2; i+=10) {
    if (i % 100 == 0) {
      strokeWeight(2);
    } else {
      strokeWeight(1);
    }
    line(50, height/2+i, width, height/2+i);
    line(50, height/2-i, width, height/2-i);
  }
  stroke(0);
}

void sound_source() {
  posx = speed*count/fps+50;
  fill(0);
  ellipse(posx, posy, 20, 20);
}

void sound_output() {
  if (count %  (fps/10) == 0 && clickedCount == true) {
    sounds.add(new SOUND(posx, 0));
  }
}

void time_count() {
  if (clickedCount == true) {
    count++;
  }
}

void panel() {
  if (panelCount == false) {
    image(panelButton1, 0, 0);
  } else {
    image(panelButton2, 0, 0);
    image(remortController, 0, panelButton1.height);
    fill(255);
    text(speed+"m/s", 2*remortController.width/5, panelButton1.height, remortController.width/3, remortController.height);
  }
  if (clickedCount == false) {
    image(startButton, width/(24*6), height-startButton.height-width/(24*6));
  } else {
    image(stopButton, width/(24*6), height-startButton.height-width/(24*6));
  }
  image(resetButton, 3*width/(24*6)+startButton.width, height-resetButton.height-width/(24*6));
}
