/*
variable numbers are in lowercase
 constant numbers are in uppercase
 */


PImage startButton, stopButton, resetButton, remocon;
float slopeTheta, gravity, count;
float SLOPE_WID, GROUND_HEI, MATERIAL_WID, MATERIAL_HEI, REFERENCE_POINT, MINIMUM_UNIT;
int sort;
boolean clickedCount, resetCount;
Material material;


void setup() {

  fullScreen();

  startButton = loadImage("https://live.staticflickr.com/65535/51563400792_8950903254_o.png");
  startButton.resize(5*width/72, 0);
  stopButton = loadImage("https://live.staticflickr.com/65535/51563400782_aace81f8ba_o.png");
  stopButton.resize(5*width/72, 0);
  resetButton = loadImage("https://live.staticflickr.com/65535/51564881144_0248886998_o.png");
  resetButton.resize(5*width/72, 0);
  remocon = loadImage("https://live.staticflickr.com/65535/51923700024_1fdd8110a1_o.png");
  remocon.resize(width/6, 0);

  slopeTheta = radians(20);
  gravity = 9.8;
  count = 0;

  SLOPE_WID = 2 * width / 3;
  GROUND_HEI = 9 * height / 10;
  MATERIAL_WID = width / 12;
  MATERIAL_HEI = height / 8;
  REFERENCE_POINT = (width - SLOPE_WID) / 2;
  MINIMUM_UNIT = width / 100;

  sort = 1;

  clickedCount = false;
  resetCount = true;

  //Material class content is Material(materialX, materialY, friction, materialWeight, materialSort)
  material = new Material(REFERENCE_POINT, GROUND_HEI - SLOPE_WID * tan(slopeTheta), 1, 20, 1);

  textSize(2 * MINIMUM_UNIT);
  textAlign(CENTER);
  strokeWeight(5);
}


void draw() {

  background(255);
  slope();
  button();
  longPressed();
  calculate();
  material.calculate();
  material.display();
}
