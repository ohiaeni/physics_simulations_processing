void lightResource() {
  strokeWeight(1);
  pushMatrix();
  translate(width/2, height/2);
  fill(0);
  stroke(255);
  rotate(radians((lightRotateTheta)));
  rect(-width/48, height/2-height/6, width/24, height/6);
  popMatrix();
}
