//class name's initials is uppercase
class Material {

  float materialX, materialY, friction, materialWeight;
  int materialSort;

  Material(float x, float y, float f, float m_w, int m_s) {
    materialX = x;
    materialY = y;
    friction = f;
    materialWeight = m_w;
    materialSort = m_s;
  }

  void calculate() {
    if (clickedCount == true) {
      materialX += gravity * sin(slopeTheta) * cos(slopeTheta) * (count / frameRate);
      materialY += gravity * sq(sin(slopeTheta)) * (count / frameRate);
    }
    if (materialX >= REFERENCE_POINT + SLOPE_WID - ((MATERIAL_WID) * cos(slopeTheta))) {
      materialX = REFERENCE_POINT + SLOPE_WID - ((MATERIAL_WID) * cos(slopeTheta));
      materialY = GROUND_HEI - (MATERIAL_WID * sin(slopeTheta));
    }
  }

  void display() {
    rectMaterial(materialX, materialY);
  }
}
