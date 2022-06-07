float lightRotateTheta;
String strLightRotateTheta = "0";
PGraphics pg;
float n1, n2, n12;
float theta1, theta2;
float raysX, raysY;
float raysX2, raysY2;
float raysSpeed, raysSpeedX, raysSpeedY;
int count;
PImage rotateRemocon, nRemocon;
float boundary;
String simulationMode;
void setup() {
  fullScreen();
  lightRotateTheta=float(strLightRotateTheta);
  pg = createGraphics(width, height);
  n1 = 1;
  n2 = 1.5;
  n12 = n2/n1;
  theta1 = radians(lightRotateTheta);
  theta2 = asin(sin(theta1)/n12);
  raysX = width/2-(height/2-height/6)*sin(theta1);
  raysY = height/2+(height/2-height/6)*cos(theta1);
  raysX2 = width/2;
  raysY2 = height/2;
  raysSpeed = 5;
  raysSpeedX = raysSpeed*cos(theta1+PI/2);
  raysSpeedY = raysSpeed*sin(theta1+PI/2);
  count = 0;
  rotateRemocon = loadImage("https://live.staticflickr.com/65535/52105031535_0269fdf1ed_o.png");
  rotateRemocon.resize(width/6, 0);
  nRemocon = loadImage("https://live.staticflickr.com/65535/52112262666_9cf575b5a6_o.png");
  nRemocon.resize(width/6, 0);
  textAlign(CENTER);
  textSize(width/50);
  boundary = sin(theta1)/n12;
  simulationMode = "lineMax";
}

void draw() {
  background(0);
  if (simulationMode == "animation") {
    animationRays();
    animationBackgroundSetting();
    animationCalculate();
  }
  if (simulationMode == "line") {
    lineRays();
    lineBackgroundSetting();
    lineCalculate();
  }
  if (simulationMode == "animationMax") {
    animationMaxRays();
    animationMaxBackgroundSetting();
    animationMaxCalculate();
  }
  if (simulationMode == "lineMax") {
    lineMaxRays();
    lineMaxBackgroundSetting();
    lineMaxCalculate();
  }
  lightResource();
  operation();
  noFill();
  stroke(255);
  for (int i = 0; i< 4; i++) {
    fill(100);
    rect(width-(4-i)*width/8, 0, width/8, height/20, 100);
    fill(255);
    if (i == 0) {
      text("animation", width-(4-i)*width/8, 0, width/8, height/20);
    }
    if (i == 1) {
      text("animationMax", width-(4-i)*width/8, 0, width/8, height/20);
    }
    if (i == 2) {
      text("line", width-(4-i)*width/8, 0, width/8, height/20);
    }
    if (i == 3) {
      text("lineMax", width-(4-i)*width/8, 0, width/8, height/20);
    }
  }
  tableDisplay();
}
