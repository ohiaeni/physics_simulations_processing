void screenDisplay(PImage img) {
  float a = width/2-objectX;
  float b = a*focusLength/(a-focusLength);
  float m = b/a;
  if (anyLens != "concaveLens") {
    if (a > focusLength) {
      blurValue = map(b+width/2-screenX, width/2, 0, 100, 0);
      if (abs(blurValue) > 38) {
        blurValue = 38;
      }
      pg.beginDraw();
      pg.background(0);
      pg.pushMatrix();
      pg.translate(screenHeight/2-img.width*m/2, 0);
      pg.scale(-1, -1);
      if (anyLens == "halfPartition") {
        pg.tint(255, 100);
      }
      if (anyLens == "stripePartition") {
        pg.tint(255, 75);
        if (height/2+img.height*m < height/2+candle.height-lensHeight/12 || height/2+img.height*m > height/2+candle.height+lensHeight/12) {
          pg.tint(255, 100);
        }
      }
      pg.image(img, -img.width*m, -img.height*m, img.width*m, img.height*m);
      pg.tint(255, 255);
      pg.popMatrix();
      pg.filter(BLUR, abs(blurValue));
      pg.endDraw();
      image(pg, screenX-screenHeight/2+screenWidth/2, height/2-screenHeight-10);
      if (speechBubbleIs == true) {
        speechBubble(screenX+screenHeight/2+75, height/2-screenHeight-10-30+img.height*m, 100, 60, nf(img.height*m/50, 1, 1), color(255), "left");
      }
      noFill();
      stroke(0, 255, 0);
      rect(screenX-screenHeight/2+screenWidth/2, height/2-3*screenHeight/2-10, screenHeight, screenHeight);
      stroke(255);
      dashedLine(screenX-screenHeight/2+screenWidth/2, height/2-screenHeight-10, screenX+screenHeight/2+screenWidth/2, height/2-screenHeight-10);
      fill(255, 150);
      rect(screenX, height/2-screenHeight/2, screenWidth, screenHeight);
      stroke(0, 255, 0);
      line(screenX, height/2-screenHeight/2, screenX, height/2+screenHeight/2);
      stroke(255);
      line(screenX, height/2+lensHeight/2, screenX, 3*height/4);
      fill(100);
      rect(screenX-25, 3*height/4-25, 50, 25);
      if (speechBubbleIs == true) {
        speechBubble(screenX, 3*height/4+50, 100, 60, nf((screenX-width/2)/50, 1, 1), color(255), "top");
      }
      strokeWeight(1);
      fill(255);
      for (int i = 0; i < screenHeight/2; i+= 10) {
        if ( i % 50 ==0) {
          stroke(255, 255);
          line(screenX-screenHeight/2+screenWidth/2, height/2-screenHeight+i-10, screenX+screenHeight/2+screenWidth/2+7, height/2-screenHeight+i-10);
          stroke(255, 50);
          line(screenX-screenHeight/2+screenWidth/2, height/2-screenHeight+i-10, screenX+screenHeight/2+screenWidth/2, height/2-screenHeight+i-10);
          text(i/50, screenX+screenHeight/2+screenWidth/2+width/50, height/2-screenHeight+i-10);
        }
        stroke(255, 50);
        line(screenX-screenHeight/2+screenWidth/2, height/2-screenHeight+i-10, screenX+screenHeight/2+screenWidth/2, height/2-screenHeight+i-10);
      }
      strokeWeight(3);
      stroke(255, 0, 0);
      noFill();
      rect(screenX+screenWidth/2-img.width/2, height/2-screenHeight-10, img.width, img.height);
      stroke(255, 255);
    }
  }
}
