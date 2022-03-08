void slope() {
  fill(255);
  stroke(0);
  triangle(REFERENCE_POINT, GROUND_HEI - SLOPE_WID * tan(slopeTheta), REFERENCE_POINT, GROUND_HEI, REFERENCE_POINT + SLOPE_WID, GROUND_HEI);
  fill(0);
  text(nf(degrees(slopeTheta), 1, 1)+"°", REFERENCE_POINT + SLOPE_WID - SLOPE_WID / 10, GROUND_HEI - 5);
  noFill();
  arc(REFERENCE_POINT + SLOPE_WID, GROUND_HEI, SLOPE_WID / 10, SLOPE_WID / 10, PI, PI + slopeTheta);
  line(REFERENCE_POINT + SLOPE_WID, GROUND_HEI, REFERENCE_POINT + SLOPE_WID + 2 * MATERIAL_HEI * sin(slopeTheta), GROUND_HEI - 2 * MATERIAL_HEI * cos(slopeTheta));
}
