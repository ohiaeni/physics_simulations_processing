void clicked_function() {
  if (stopper_x > width-100-stopper.width && stopper_y > height/2-stopper.height/4 && stopper_y < height/2+stopper.height/4) {
    stopper_x = width-stopper.width-5-(width-200)/hm;
    stopper_y = height/2-stopper.height/8;
    fixed_count = true;
  } else {
    fixed_count = false;
  }
  if (mousePressed) {
    if (clicked_count == true && dist(100, height/2+button.height/2, mouseX, mouseY) < button.height) {
      push = true;
      for (int i = 0; i < hm; i++) {
        waves1.add(new WAVE1(i*(width-200)/hm, 100, waves1.size(), i, true));
      }
      for (int i = 0; i < hm; i++) {
        waves2.add(new WAVE2(i*(width-200)/hm, 100, waves2.size(), hm-i-2, true));
      }
    }
    if (stopper_x < mouseX && mouseX < stopper_x + stopper.width && stopper_y < mouseY && mouseY < stopper_y + stopper.height) {
      stopper_x = mouseX-stopper.width/2;
      stopper_y = mouseY-stopper.height/2;
    }
  } else {
    push = false;
  }
  if (dist(mouseX, mouseY, slider_pos, height/2+2*button.height+slider.height/2) < 20 && mousePressed) {
    slider_pos = mouseX;
  }
  if (slider_pos < 100-button.width/2+slider.width/10) {
    slider_pos = 100-button.width/2+slider.width/10;
  }
  if (slider_pos > 100-button.width/2+9*slider.width/10) {
    slider_pos = 100-button.width/2+9*slider.width/10;
  }
  speed = map(slider_pos, 100-button.width/2+slider.width/10, 100-button.width/2+9*slider.width/10, 0, 1);
}

void mousePressed() {
  if (width-3*width/18+width/(24*6)< mouseX && mouseX < width-3*width/18+start_button.width+width/(24*6) && height-start_button.height-width/(24*6) < mouseY && mouseY < height-width/(24*6)) {
    if (clicked_count == true) {
      clicked_count = false;
    } else {
      clicked_count = true;
    }
  }
  if (width-3*width/18+3*width/(24*6)+start_button.width< mouseX && mouseX < width-3*width/18+3*width/(24*6)+start_button.width+reset_button.width && height-reset_button.height-width/(24*6) < mouseY && mouseY < height-width/(24*6)) {
    clicked_count = true;
    for (int i = 0; i < waves1.size(); i++) {
      waves1.clear();
    }
    for (int i = 0; i < waves2.size(); i++) {
      waves2.clear();
    }
    for (int i = 0; i< hm; i++) {
      mediums[i] = new MEDIUM(i*(width-200)/hm, 0, i);
    }
    stopper_x = width-stopper.width-5-(width-200)/hm;
    stopper_y = height/2-stopper.height/8;
  }
}
