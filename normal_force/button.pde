void button() {
  //remocon
  image(remocon, 0, 0);
  text(nf(degrees(slopeTheta), 1, 1)+"°", 5*remocon.width/12, remocon.height/12, remocon.width/3, remocon.height/2);
  text(nf(material.materialWeight, 1, 1)+"kg", 5*remocon.width/12, 5*remocon.height/12, remocon.width/3, remocon.height/2);
  text(nf(gravity, 1, 1), 5*remocon.width/12, 9*remocon.height/12, remocon.width/3, remocon.height/2);
  
  //button
  if (clickedCount == false) {
    image(startButton, width-width/6+width/(24*6), height-startButton.height-width/(24*6));
  } else {
    image(stopButton, width-width/6+width/(24*6), height-stopButton.height-width/(24*6));
  }
  image(resetButton, width-width/(6*2)+width/(24*6), height-resetButton.height-width/(24*6));
  
  //sortButton
  stroke(0);
  rect(5*width/6, 0, width/18, width/18);
  text(str(1), 5*width/6, width/72, width/18, width/18);
  rect(5*width/6+width/18, 0, width/18, width/18);
  text(str(2), 5*width/6+width/18, width/72, width/18, width/18);
  rect(5*width/6+2*width/18, 0, width/18, width/18);
  text(str(3), 5*width/6+2*width/18, width/72, width/18, width/18);
  stroke(255, 0, 0);
  if (sort == 1) {
    rect(5*width/6, 0, width/18, width/18);
  } else if (sort == 2) {
    rect(5*width/6+width/18, 0, width/18, width/18);
  } else if (sort == 3) {
    rect(5*width/6+2*width/18, 0, width/18, width/18);
  }
}
