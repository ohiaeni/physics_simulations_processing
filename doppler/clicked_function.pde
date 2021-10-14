void mouseClicked() {
  if ( width/(24*6)< mouseX && mouseX < startButton.width+width/(24*6) && height-startButton.height-width/(24*6) < mouseY && mouseY < height-width/(24*6)) {   
    if (clickedCount == false) {
      clickedCount = true;
      resetCount = false;
    } else {
      clickedCount = false;
    }
  }
  if (3*width/(24*6)+startButton.width< mouseX && mouseX < 3*width/(24*6)+startButton.width+resetButton.width && height-resetButton.height-width/(24*6) < mouseY && mouseY < height-width/(24*6)) {
    posx = 50;
    clickedCount = false;
    resetCount = true;
    count = 0;
    for (int i=0; i<sounds.size(); i++) {
      sounds.clear();
    }
  }
  if (0 < mouseX && mouseX < panelButton1.width && 0 < mouseY && mouseY < panelButton1.height) {
    if (panelCount == false) {
      panelCount = true;
    } else {
      panelCount = false;
    }
  }
  if (dist(9*remortController.width/10, panelButton1.height+3*remortController.height/10, mouseX, mouseY) < remortController.width/20 && panelCount == true) {
    speed+=10;
  }
  if (dist(9*remortController.width/10, panelButton1.height+7*remortController.height/10, mouseX, mouseY) < remortController.width/20 && panelCount == true) {
    if (speed > 0) {
      speed-=10;
    }
  }
}
