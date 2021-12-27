void back_ground_1() {
  background(255);
  pg.beginDraw();
  if (count % fps == 0) {
    pg.ellipse(b1.posx, b1.posy, radi*2, radi*2);
    pg.ellipse(b2.posx, b2.posy, radi*2, radi*2);
  }
  if (reset_count == true) {
    pg.fill(255);
    pg.rect(0, 0, width, height);
  }
  pg.endDraw();
  image(pg, 0, 0);
  if (grid_count == true) {
    for (int i = radi; i < width; i+=10) {
      if ((i-radi) % 50 == 0) {
        strokeWeight(1.5);
      } else {
        strokeWeight(0.5);
      }
      line(i, 0, i, height);
    }
  }
}
void back_ground_2() {
  fill(255);
  stroke(255);
  for (int i = 0; i < width; i+=50) {
    line(radi+i, b1.posy+radi, radi+i, b1.posy+radi+height/100);
    line(radi+i, b2.posy+radi, radi+i, b2.posy+radi+height/100);
    text(i/50, radi+i, b1.posy+radi+height/50);
    text(i/50, radi+i, b2.posy+radi+height/50);
  }
  stroke(0);
}
void remocon() {
  if (panel_count == false) {
    image(panel_button1, width-panel_button1.width, 0);
  } else {
    image(panel_button2, width-panel_button2.width, 0);
    image(remort_controller, width-remort_controller.width, panel_button1.height);
    fill(0);
    for (int i = 0; i < 4; i++) {
      if (i == 0) {
        text(int(b1.velocity0)+"cm/s", width-2*remort_controller.width/5, panel_button1.height+remort_controller.height/8+remort_controller.height/4*i);
      } else if (i == 1) {
        text(int(b1.acceleration)+"cm/ss", width-2*remort_controller.width/5, panel_button1.height+remort_controller.height/8+remort_controller.height/4*i);
      } else if (i == 2) {
        text(int(b2.velocity0)+"cm/s", width-2*remort_controller.width/5, panel_button1.height+remort_controller.height/8+remort_controller.height/4*i);
      } else {
        text(int(b2.acceleration)+"cm/ss", width-2*remort_controller.width/5, panel_button1.height+remort_controller.height/8+remort_controller.height/4*i);
      }
    }
    fill(255);
  }
  if (grid_count == false) {
    image(grid_button1, width-panel_button1.width-grid_button1.width, 0);
  } else {
    image(grid_button2, width-panel_button2.width-grid_button2.width, 0);
  }
  if (clicked_count == false) {
    image(start_button, width-3*width/(24*6)-reset_button.width-start_button.width, height-start_button.height-width/(24*6));
  } else {
    image(stop_button, width-3*width/(24*6)-reset_button.width-stop_button.width, height-stop_button.height-width/(24*6));
  }
  image(reset_button, width-reset_button.width-width/(24*6), height-reset_button.height-width/(24*6));
  image(timer, 0, 0);
  text(nf(count/fps, 1, 2)+"s", 3*timer.width/5, timer.height/2);
}

void calculate() {
  if (clicked_count == true) {
    count++;
  }
}
