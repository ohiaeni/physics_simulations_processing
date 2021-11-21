void background_setting() {
  for (int i = 0; i < 3; i++) {
    stroke(0, 100);
    if (grid_count == true) {
      for (float f = -width/6; f<width/6; f+=10) {
        if (f % 50 == 0) {
          strokeWeight(3);
        } else {
          strokeWeight(1);
        }
        line(f+width/3*i+width/6, 0, f+width/3*i+width/6, height);
      }
      for (float f = 0; f < height; f+=10) {
        if (f % 50 == 0) {
          strokeWeight(3);
        } else {
          strokeWeight(1);
        }
        line(width/3*i, f, width/3*i+width/3, f);
      }
    }
    noFill();
    stroke(0);
    strokeWeight(5);
    rect(width/3*i, 0, width/3, height);
  }
}

void button() {
  if (grid_count == false) {
    image(grid_button1, width-grid_button1.width, 0);
  } else {
    image(grid_button2, width-grid_button2.width, 0);
  }
  if (clicked_count == false) {
    image(start_button, width-3*width/(24*6)-reset_button.width-start_button.width, height-start_button.height-width/(24*6));
  } else {
    image(stop_button, width-3*width/(24*6)-reset_button.width-stop_button.width, height-stop_button.height-width/(24*6));
  }
  image(reset_button, width-reset_button.width-width/(24*6), height-reset_button.height-width/(24*6));
}
