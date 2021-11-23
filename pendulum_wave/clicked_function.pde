void mousePressed() {
  if (width-4*stop_watch.width/5 <mouseX && mouseX < width-4*stop_watch.width/5+start_button.width && height-stop_watch.height+11*stop_watch.height/20 < mouseY && mouseY < height-stop_watch.height+11*stop_watch.height/20+start_button.height) {
    if (clicked_count == false) {
      clicked_count =true;
    } else {
      clicked_count = false;
    }
  }
  if (width-4*stop_watch.width/5+start_button.width <mouseX && mouseX < width-4*stop_watch.width/5+2*start_button.width && height-stop_watch.height+11*stop_watch.height/20 < mouseY && mouseY < height-stop_watch.height+11*stop_watch.height/20+start_button.height) {
    for (int i = 0; i < hm; i++) {
      balls[i] = new Ball(dataArray.getFloat(i, 3), asin(100/dataArray.getFloat(i, 3)));
    }
    clicked_count = false;
    count = 0;
  }
}
