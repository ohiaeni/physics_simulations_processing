void mousePressed() {
  if (width/3-panel_button1.width < mouseX && mouseX < width/3 && 0 < mouseY && mouseY < panel_button1.height) {
    b1.panelCount ++;
    if (b1.panelCount == 2) {
      b1.panelCount = 0;
    }
  }
  if (2*width/3-panel_button1.width < mouseX && mouseX < 2*width/3 && 0 < mouseY && mouseY < panel_button1.height) {
    b2.panelCount ++;
    if (b2.panelCount == 2) {
      b2.panelCount = 0;
    }
  }
  if (width-3*width/(24*6)-reset_button.width-start_button.width < mouseX && mouseX < width-3*width/(24*6)-reset_button.width && height-start_button.height-width/(24*6) < mouseY && mouseY < height-start_button.height-width/(24*6)+start_button.height) {
    if (clicked_count == true) {
      clicked_count = false;
    } else {
      clicked_count = true;
    }
  }
  if (width-reset_button.width-width/(24*6) < mouseX && mouseX < width-reset_button.width-width/(24*6)+reset_button.width && height-reset_button.height-width/(24*6) < mouseY && mouseY < height-width/(24*6)) {
    clicked_count = false;
    count = 0;
    b1 = new Ball(500, 8);
    b2 = new Ball(500, 12);
    b1.theta = radians(b1.theta0)*cos(sqrt(gravity/(b1.string_length))*count*1.2);
    b2.theta = radians(b2.theta0)*cos(sqrt(gravity/(b2.string_length))*count*1.2);
  }
  if (clicked_count == false) {
    for (int n = 0; n < 2; n++) {
      for (int i = 0; i< 3; i++) {
        if (dist(n*width/3+remort_controller.width-remort_controller.width/10, i*remort_controller.height/2+remort_controller.width/10, mouseX, mouseY)<remort_controller.width/20) {
          if (n == 0) {
            if (i == 0 && b1.theta0 < 15) {
              b1.theta0 ++;
            } else if (i == 1 && b1.string_length <height-100) {
              b1.string_length+=50;
            }
          }
          if (n == 1) {
            if (i == 0 && b2.theta0 < 15) {
              b2.theta0 ++;
            } else if (i == 1 && b2.string_length <height-100) {
              b2.string_length+=50;
            }
          }
        }
        if (dist(n*width/3+remort_controller.width-remort_controller.width/10, (i+1)*remort_controller.height/2-remort_controller.width/10, mouseX, mouseY)<remort_controller.width/20) {
          if (n == 0) {
            if (i == 0 && b1.theta0 > 0) {
              b1.theta0 --;
            } else if (i == 1 && b1.string_length > 50) {
              b1.string_length-=50;
            }
          }
          if (n == 1) {
            if (i == 0 && b2.theta0 > 0) {
              b2.theta0 --;
            } else if (i == 1 && b2.string_length > 50) {
              b2.string_length-=50;
            }
          }
        }
      }
    }
  }
  if (width-grid_button1.width < mouseX && mouseX < width && 0 < mouseY && mouseY < grid_button1.height) {
    if (grid_count == true) {
      grid_count = false;
    } else {
      grid_count = true;
    }
  }
}
