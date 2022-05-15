int lensWidth, lensHeight, screenWidth, screenHeight;
PImage head, convexLens, concaveLens, convexHalfLens, candle, F, LED, switchArrow, pointArrow;
float objectX, objectY, focusLength, screenX, blurValue, imgWidth, imgHeight;
String anyLens, anyObject;
PGraphics pg;
boolean speechBubbleIs;
void setup() {
  fullScreen();
  lensWidth = width/48;
  lensHeight = 7*lensWidth;
  screenWidth = lensWidth/3;
  screenHeight = lensHeight;
  head = loadImage("https://live.staticflickr.com/65535/52029525367_24dca468c9_o.png");
  head.resize(width/10, 0);
  convexLens = loadImage("https://live.staticflickr.com/65535/51915402909_7ddccffdc8_o.png");
  convexLens.resize(lensWidth, lensHeight);
  concaveLens = loadImage("https://live.staticflickr.com/65535/51915697630_1ab41135e4_o.png");
  concaveLens.resize(lensWidth, lensHeight);
  candle = loadImage("https://live.staticflickr.com/65535/52022417332_30ef1f0fd3_o.png");
  candle.resize(0, 100);
  F = loadImage("https://live.staticflickr.com/65535/52037725306_ff76e9fce0_o.png");
  F.resize(0, 100);
  LED = loadImage("https://live.staticflickr.com/65535/52036686892_3362bbeea0_o.png");
  LED.resize(0, 100);
  switchArrow = loadImage("https://live.staticflickr.com/65535/52037688016_0b5f3d255d_o.png");
  switchArrow.resize(2*lensWidth, 0);
  pointArrow = loadImage("https://live.staticflickr.com/65535/52038360807_79526007ed_o.png");
  pointArrow.resize(0, switchArrow.height);
  objectX = width/2-600;
  objectY = height/2-candle.height;
  focusLength = 250;
  screenX = width/2+600;
  blurValue = 0;
  anyLens = "convexLens";
  anyObject = "F";
  pg = createGraphics(screenHeight, screenHeight/2);
  noFill();
  stroke(255);
  strokeWeight(3);
  textSize(width/75);
  textAlign(CENTER, CENTER);
  imgWidth = F.width;
  imgHeight = F.height;
  speechBubbleIs = false;
}
void draw() {
  backgroundSetting();
  if (anyObject == "F") {
    opticalPathDisplay(F);
    objectDisplay(F);
    screenDisplay(F);
    button(F);
    operation(F);
    imgWidth = F.width;
    imgHeight = F.height;
  } else if (anyObject == "LED") {
    opticalPathDisplay(LED);
    objectDisplay(LED);
    screenDisplay(LED);
    button(LED);
    operation(LED);
    imgWidth = LED.width;
    imgHeight = LED.height;
  } else if (anyObject == "candle") {
    opticalPathDisplay(candle);
    objectDisplay(candle);
    screenDisplay(candle);
    button(candle);
    operation(candle);
    imgWidth = candle.width;
    imgHeight = candle.height;
  }
}
