void mousePressed() {
  if (width/(24*6) < mouseX && mouseX < width/(24*6)+startButton.width && height-startButton.height-width/(24*6) < mouseY && mouseY < height-width/(24*6)) {
    if (clickedCount == true) {
      clickedCount = false;
    } else {
      clickedCount =true;
      resetCount = false;
    }
  }
  if (startButton.width+3*width/(24*6) < mouseX && mouseX < startButton.width+3*width/(24*6)+resetButton.width && height-startButton.height-width/(24*6) < mouseY && mouseY < height-width/(24*6)) {
    resetCount = true;
    clickedCount = false;
    count = 0;
    r_intensity=width-9*remortController.width/10;
    g_intensity=width-9*remortController.width/10;
    b_intensity=width-9*remortController.width/10;
    r_i_change = 0;
    g_i_change = 0;
    b_i_change = 0;
  }
}
