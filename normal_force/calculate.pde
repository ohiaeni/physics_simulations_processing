void calculate() {
  if (clickedCount == true) {
    count ++;
  }
  material.materialY = GROUND_HEI - (5*width/6-material.materialX) * tan(slopeTheta);
}
