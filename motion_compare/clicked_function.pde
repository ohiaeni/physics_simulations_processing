void mousePressed() {
  if (width-panel_button1.width-grid_button1.width < mouseX && mouseX <  width-panel_button1.width && 0 < mouseY && mouseY < grid_button1.height) {
    if (grid_count == false) {
      grid_count = true;
    } else {
      grid_count = false;
    }
  }
  if (width-panel_button1.width < mouseX && mouseX <  width && 0 < mouseY && mouseY < panel_button1.height) {
    if (panel_count == false) {
      panel_count = true;
    } else {
      panel_count = false;
    }
  }
  if (width-3*width/(24*6)-reset_button.width-start_button.width < mouseX && mouseX < width-3*width/(24*6)-reset_button.width && height-start_button.height-width/(24*6) < mouseY && mouseY < height-start_button.height-width/(24*6)+start_button.height) {
    if (clicked_count == false) {
      clicked_count = true;
      reset_count = false;
    } else {
      clicked_count = false;
    }
  }
  if (width-reset_button.width-width/(24*6) < mouseX && mouseX < width-reset_button.width-width/(24*6)+reset_button.width && height-reset_button.height-width/(24*6) < mouseY && mouseY < height-width/(24*6)) {
    clicked_count = false;
    count = 0;
    reset_count = true;
    b1 = new Ball(radi, height/2-height/25-radi, 10, 0);
    b2 = new Ball(radi, height-height/25-radi, 10, 0);
  }
  if (panel_count == true) {
    for (int i = 0; i < 4; i++) {
      if (dist(width-remort_controller.width/10, remort_controller.width/10+panel_button1.height+remort_controller.height/4*i, mouseX, mouseY)<remort_controller.width/20) {
        if (i == 0) {
          b1.velocity0++;
        } else if (i == 1) {
          b1.acceleration++;
        } else if (i == 2) {
          b2.velocity0++;
        } else {
          b2.acceleration++;
        }
      }
      if (dist(width-remort_controller.width/10, panel_button1.height+remort_controller.height/4-remort_controller.width/10+remort_controller.height/4*i, mouseX, mouseY)<remort_controller.width/20) {
        if (i == 0) {
          b1.velocity0--;
        } else if (i == 1) {
          b1.acceleration--;
        } else if (i == 2) {
          b2.velocity0--;
        } else {
          b2.acceleration--;
        }
      }
    }
  }
}
