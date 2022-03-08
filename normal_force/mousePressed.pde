void mousePressed() {
  if (width-width/6+width/(24*6) < mouseX && mouseX < width-width/6+width/(24*6)+startButton.width && height-startButton.height-width/(24*6) < mouseY && mouseY < height-width/(24*6)) {
    if (clickedCount == true) {
      clickedCount = false;
    } else {
      clickedCount =true;
      resetCount = false;
    }
  }
  if (width-width/(6*2)+width/(24*6) < mouseX && mouseX < width-width/(6*2)+width/(24*6)+resetButton.width && height-startButton.height-width/(24*6) < mouseY && mouseY < height-width/(24*6)) {
    resetCount = true;
    clickedCount = false;
    slopeTheta = radians(20);
    gravity = 9.8;
    count = 0;
    material = new Material(REFERENCE_POINT, GROUND_HEI - SLOPE_WID * tan(slopeTheta), 1, 20, 1);
  }
  if (clickedCount == false) {
    if (dist(remocon.width-remocon.width/10, remocon.width/10, mouseX, mouseY)<remocon.width/20) {
      slopeTheta += PI / 3600;
      if (slopeTheta >= radians(89)) {
        slopeTheta = radians(89);
      }
    }
    if (dist(remocon.width-remocon.width/10, remocon.height/2-remocon.width/10, mouseX, mouseY)<remocon.width/20) {
      slopeTheta -= PI / 3600;
      if (slopeTheta <= 0) {
        slopeTheta = 0;
      }
    }
  }
  if (5*width/6 < mouseX && mouseX < 5*width/6+width/18 && 0 < mouseY && mouseY < width/18) {
    sort = 1;
  }
  if (5*width/6+width/18 < mouseX && mouseX < 5*width/6+2*width/18 && 0 < mouseY && mouseY < width/18) {
    sort = 2;
  }
  if (5*width/6+2*width/18 < mouseX && mouseX < width && 0 < mouseY && mouseY < width/18) {
    sort = 3;
  }
}

void longPressed() {
  if (mousePressed && dist(remocon.width-remocon.width/10, remocon.width/10, mouseX, mouseY)<remocon.width/20) {
    slopeTheta += PI / 3600;
    if (slopeTheta >= radians(89)) {
      slopeTheta = radians(89);
    }
  } else if (mousePressed && dist(remocon.width-remocon.width/10, remocon.height/3-remocon.width/10, mouseX, mouseY)<remocon.width/20) {
    slopeTheta -= PI / 3600;
    if (slopeTheta <= 0) {
      slopeTheta = 0;
    }
  } else if (mousePressed && dist(remocon.width-remocon.width/10, remocon.height/3+remocon.width/10, mouseX, mouseY)<remocon.width/20) {
    material.materialWeight+= 0.1;
  } else if (mousePressed && dist(remocon.width-remocon.width/10, 2*remocon.height/3-remocon.width/10, mouseX, mouseY)<remocon.width/20) {
    material.materialWeight-=0.1;
    if (material.materialWeight <= 1) {
      material.materialWeight = 1;
    }
  } else if (mousePressed && dist(remocon.width-remocon.width/10, 2*remocon.height/3+remocon.width/10, mouseX, mouseY)<remocon.width/20) {
    gravity+=0.1;
  } else if (mousePressed && dist(remocon.width-remocon.width/10, remocon.height-remocon.width/10, mouseX, mouseY)<remocon.width/20) {
    gravity-=0.1;
    if (gravity <= 9.8) {
      gravity = 9.8;
    }
  }
}
