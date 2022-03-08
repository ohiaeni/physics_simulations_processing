void rectMaterial(float a, float b) {
  stroke(0);
  fill(255);
  quad(a, b, a + MATERIAL_HEI * sin(slopeTheta), b - MATERIAL_HEI * cos(slopeTheta), a + MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta), b + MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta), a + MATERIAL_WID * cos(slopeTheta), b + MATERIAL_WID * sin(slopeTheta));
  fill(0);
  float ARROW_LENGTH = material.materialWeight * gravity;
  if (sort == 1) {
    //gravity line
    dashedLine(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2, b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2, a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2, b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH, 1);
    arrow(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2, b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH, "gravity");
    dashedLine(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2, b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH, a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2 - ARROW_LENGTH * sin(slopeTheta) * cos(slopeTheta), b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH * sq(cos(slopeTheta)), 1);
    dashedLine(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2, b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH, a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2 + ARROW_LENGTH * sin(slopeTheta) * cos(slopeTheta), b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH * sq(sin(slopeTheta)), 1);
    line(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2, b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2, a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2 - ARROW_LENGTH * sin(slopeTheta) * cos(slopeTheta), b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH * sq(cos(slopeTheta)));
    arrow(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2 - ARROW_LENGTH * sin(slopeTheta) * cos(slopeTheta), b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH * sq(cos(slopeTheta)), "vertical");
    line(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2, b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2, a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2 + ARROW_LENGTH * sin(slopeTheta) * cos(slopeTheta), b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH * sq(sin(slopeTheta)));
    arrow(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2 + ARROW_LENGTH * sin(slopeTheta) * cos(slopeTheta), b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH * sq(sin(slopeTheta)), "holizonal");
  }
  if (sort == 2) {
    //gravity line's vertical component
    dashedLine(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2, b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2, a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2 - ARROW_LENGTH * sin(slopeTheta) * cos(slopeTheta), b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH * sq(cos(slopeTheta)), 1);
    dashedLine(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2, b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2, a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2 + ARROW_LENGTH * sin(slopeTheta) * cos(slopeTheta), b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH * sq(sin(slopeTheta)), 1);
    arrow(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2 + ARROW_LENGTH * sin(slopeTheta) * cos(slopeTheta), b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH * sq(sin(slopeTheta)), "holizonal");
    arrow(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2 - ARROW_LENGTH * sin(slopeTheta) * cos(slopeTheta), b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH * sq(cos(slopeTheta)), "vertical");
    line(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2, b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2, a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2, b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH);
    arrow(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2, b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH, "gravity");
    dashedLine(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2, b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH, a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2 - ARROW_LENGTH * sin(slopeTheta) * cos(slopeTheta), b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH * sq(cos(slopeTheta)), 1);
    dashedLine(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2, b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH, a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2 + ARROW_LENGTH * sin(slopeTheta) * cos(slopeTheta), b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH * sq(sin(slopeTheta)), 1);
  }
  if (sort == 3) {
    //gravity line's holizonal component
    line(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2, b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2, a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2, b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH);
    arrow(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2, b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + ARROW_LENGTH, "gravity");
  }
  //normal force
  stroke(255, 0, 0);
  fill(255, 0, 0);
  line(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2 - MATERIAL_HEI / 2 * sin(slopeTheta) - MINIMUM_UNIT / 2 * cos(slopeTheta), b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + MATERIAL_HEI / 2 * cos(slopeTheta) - MINIMUM_UNIT / 2 * sin(slopeTheta), a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2 - MATERIAL_HEI / 2 * sin(slopeTheta) - MINIMUM_UNIT / 2 * cos(slopeTheta) + ARROW_LENGTH * cos(slopeTheta) * sin(slopeTheta), b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + MATERIAL_HEI / 2 * cos(slopeTheta) - MINIMUM_UNIT / 2 * sin(slopeTheta) - ARROW_LENGTH * sq(cos(slopeTheta)));
  arrow(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2 - MATERIAL_HEI / 2 * sin(slopeTheta) - MINIMUM_UNIT / 2 * cos(slopeTheta) + ARROW_LENGTH * cos(slopeTheta) * sin(slopeTheta), b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + MATERIAL_HEI / 2 * cos(slopeTheta) - MINIMUM_UNIT / 2 * sin(slopeTheta) - ARROW_LENGTH * sq(cos(slopeTheta)), "normal");
}

void circleMaterial(float a, float b) {
  ellipse(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2, b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2, 200, 200);
  line(a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2, b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2, a + (MATERIAL_WID * cos(slopeTheta) + MATERIAL_HEI * sin(slopeTheta)) / 2, b + (MATERIAL_WID * sin(slopeTheta) - MATERIAL_HEI * cos(slopeTheta)) / 2 + 100);
}
