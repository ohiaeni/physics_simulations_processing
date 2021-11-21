void timer() {
  image(stop_watch, width-stop_watch.width, height-stop_watch.height);
  if (clicked_count == false) {
    image(start_button, width-4*stop_watch.width/5, height-stop_watch.height+11*stop_watch.height/20);
  }
  if (clicked_count == true) {
    image(stop_button, width-4*stop_watch.width/5, height-stop_watch.height+11*stop_watch.height/20);
    count ++;
  }
  text(nf(count/60, 1, 2)+"s", width-stop_watch.width, height-stop_watch.height, stop_watch.width, 3*stop_watch.height/4);
}
