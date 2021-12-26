void image_display() {
  tint(255);
  if (push == true) {
    tint(255, 200, 200, 200);
  }
  image(button, 100-button.width/2, height/2+button.height/2);
  tint(255);
  if (fixed_count == true) {
    image(fixed_panel, 0, 0);
  } else {
    image(free_panel, 0, 0);
  }
  image(stopper, stopper_x, stopper_y);
  image(slider, 100-button.width/2, height/2+2*button.height);
  if (clicked_count == false) {
    image(start_button, width-3*width/18+width/(24*6), height-start_button.height-width/(24*6));
  } else {
    image(stop_button, width-3*width/18+width/(24*6), height-start_button.height-width/(24*6));
  }
  image(reset_button, width-3*width/18+3*width/(24*6)+start_button.width, height-reset_button.height-width/(24*6));
  stroke(0);
  fill(150);
  ellipse(slider_pos, height/2+2*button.height+slider.height/2, 25, 25);
  fill(200);
  ellipse(slider_pos, height/2+2*button.height+slider.height/2, 10, 10);
}
