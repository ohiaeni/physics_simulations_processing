void arrow(float a, float b, String n) {
  if (n == "gravity") {
    triangle(a, b, a - MINIMUM_UNIT / 2, b - MINIMUM_UNIT / 2, a + MINIMUM_UNIT / 2, b - MINIMUM_UNIT / 2);
  } else if (n == "vertical") {
    triangle(a, b, a + MINIMUM_UNIT / 2 * (sin(slopeTheta) - cos(slopeTheta)), b - MINIMUM_UNIT / 2 * (cos(slopeTheta) + sin(slopeTheta)), a + MINIMUM_UNIT / 2 * (sin(slopeTheta) + cos(slopeTheta)), b + MINIMUM_UNIT / 2 * ( -cos(slopeTheta) + sin(slopeTheta)));
  } else if (n == "holizonal") {
    triangle(a, b, a - MINIMUM_UNIT / 2 * (sin(slopeTheta) + cos(slopeTheta)), b + MINIMUM_UNIT / 2 * (cos(slopeTheta) - sin(slopeTheta)), a - MINIMUM_UNIT / 2 * ( -sin(slopeTheta) + cos(slopeTheta)), b - MINIMUM_UNIT / 2 * (cos(slopeTheta) + sin(slopeTheta)));
  } else if (n == "normal") {
    triangle(a, b, a - MINIMUM_UNIT / 2 * (sin(slopeTheta) + cos(slopeTheta)), b + MINIMUM_UNIT / 2 * (cos(slopeTheta) - sin(slopeTheta)), a + MINIMUM_UNIT / 2 * (cos(slopeTheta) - sin(slopeTheta)), b + MINIMUM_UNIT / 2 * (sin(slopeTheta) + cos(slopeTheta)));
  }
}
