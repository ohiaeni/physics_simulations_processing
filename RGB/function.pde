void time_count() {
  if (clickedCount == true) {
    count++;
  }
}

void backGround() {
  background(0);
  image(head, 0, (height-head.height)/2);
  image(light, width-light.width, height/2-light.height/2);
  if (resetCount == false) {
    fill(r_i_change, g_i_change, b_i_change);
    ellipse(head.width/2-2*head.width/24, (height-head.height)/2+head.height/4, 3*head.width/5, head.height/3);
  }
}

void calculate() {
  if (mousePressed && mouseX >= width-9*remortController.width/10 && mouseX <= width-1*remortController.width/10) {
    if (dist(width-9*remortController.width/10+(r_i_change/255)*8*remortController.width/10, height-5*remortController.height/6, mouseX, mouseY)<3*width/200) {
      r_intensity = mouseX;
    }
    if (dist(width-9*remortController.width/10+(g_i_change/255)*8*remortController.width/10, height-3*remortController.height/6, mouseX, mouseY)<3*width/200) {
      g_intensity = mouseX;
    }
    if (dist(width-9*remortController.width/10+(b_i_change/255)*8*remortController.width/10, height-1*remortController.height/6, mouseX, mouseY)<3*width/200) {
      b_intensity = mouseX;
    }
  }
  r_i_change = map(r_intensity, width-9*remortController.width/10, width-1*remortController.width/10, 0, 255);
  g_i_change = map(g_intensity, width-9*remortController.width/10, width-1*remortController.width/10, 0, 255);
  b_i_change = map(b_intensity, width-9*remortController.width/10, width-1*remortController.width/10, 0, 255);
}

void remocon() {
  image(remortController, width-remortController.width, height-remortController.height);
  fill(255);
  stroke(0);
  ellipse(width-9*remortController.width/10+(r_i_change/255)*8*remortController.width/10, height-5*remortController.height/6, 3*width/200, 3*width/200);
  ellipse(width-9*remortController.width/10+(g_i_change/255)*8*remortController.width/10, height-3*remortController.height/6, 3*width/200, 3*width/200);
  ellipse(width-9*remortController.width/10+(b_i_change/255)*8*remortController.width/10, height-1*remortController.height/6, 3*width/200, 3*width/200);
  ellipse(width-9*remortController.width/10+(r_i_change/255)*8*remortController.width/10, height-5*remortController.height/6, 3*width/400, 3*width/400);
  ellipse(width-9*remortController.width/10+(g_i_change/255)*8*remortController.width/10, height-3*remortController.height/6, 3*width/400, 3*width/400);
  ellipse(width-9*remortController.width/10+(b_i_change/255)*8*remortController.width/10, height-1*remortController.height/6, 3*width/400, 3*width/400);
  if (clickedCount == false) {
    image(startButton, width/(24*6), height-startButton.height-width/(24*6));
  } else {
    image(stopButton, width/(24*6), height-stopButton.height-width/(24*6));
  }
  image(resetButton, startButton.width+3*width/(24*6), height-resetButton.height-width/(24*6));
}

void graph() {
  image(graph, width-graph.width, 0);
  image(spectrum, width-spectrum.width, graph.height);
  fill(255);
  for (int i = 0; i < 9; i++) {
    text(350+50*i, width-spectrum.width+i*spectrum.width/8, graph.height+spectrum.height);
  }
  for (int i = 0; i< 5; i++) {
    text(nf(0.5*i, 1, 1), width-graph.width-2*width/100, graph.height-i*graph.height/4+width/200);
  }
  text("(light_intensity)", width-graph.width+3*width/100, width/200);
  text("(wave_length[nm])", width-width/25, graph.height-width/100);
  for (int i = 0; i < dataArray.getRowCount(); i++) {
    float red = dataArray.getFloat(i, 1)*(r_i_change/255);
    float green = dataArray.getFloat(i, 2)*(g_i_change/255);
    float blue = dataArray.getFloat(i, 3)*(b_i_change/255);
    noStroke();
    fill(255);
    ellipse(width-graph.width+(i+30)*graph.width/400, graph.height-(red+green+blue)*graph.height/2, 5, 5);
    fill(255, 0, 0);
    ellipse(width-graph.width+(i+30)*graph.width/400, graph.height-red*graph.height/2, 5, 5);
    fill(0, 255, 0);
    ellipse(width-graph.width+(i+30)*graph.width/400, graph.height-green*graph.height/2, 5, 5);
    fill(0, 0, 255);
    ellipse(width-graph.width+(i+30)*graph.width/400, graph.height-blue*graph.height/2, 5, 5);
  }
}

void light_output() {
  if (clickedCount == true) {
    if (count % round(255/r_i_change)==0) {
      red.add(new Light(width-light.width, height/2-width/50, 'R'));
    }
    if (count % round(255/g_i_change)==0) {
      blue.add(new Light(width-light.width, height/2, 'G'));
    }
    if (count % round(255/b_i_change)==0) {
      green.add(new Light(width-light.width, height/2+width/50, 'B'));
    }
  }
  if (resetCount == true) {
    for (int i = 0; i < red.size(); i++) {
      red.clear();
    }
    for (int i = 0; i < green.size(); i++) {
      green.clear();
    }
    for (int i = 0; i < blue.size(); i++) {
      blue.clear();
    }
  } else {
    for (int i = 0; i < red.size(); i++) {
      if (red.get(i).posx < head.width-width/25) {
        red.remove(i);
      }
    }
    for (int i = 0; i < green.size(); i++) {
      if (green.get(i).posx < head.width-width/25) {
        green.remove(i);
      }
    }
    for (int i = 0; i < blue.size(); i++) {
      if (blue.get(i).posx < head.width-width/25) {
        blue.remove(i);
      }
    }
  }
}
