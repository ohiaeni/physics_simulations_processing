void opticalPathDisplay(PImage img) {
  float a = width/2-objectX;
  float b, m, theta_1, theta_2;
  if (anyLens == "convexLens") {
    if (a > focusLength) {
      b = a*focusLength/(a-focusLength);
      m = b/a;
      theta_1 = atan((img.height*m+img.height)/b);
      theta_2 = atan(img.height/a);
      line(objectX, objectY, width/2, objectY);
      line(width/2, objectY, width-head.width, objectY+(width/2-head.width)*tan(theta_1));
      float theta_3 = atan((img.height/2+img.height*m)/b);
      line(objectX, objectY, width/2, objectY+img.height/2);
      line(width/2, objectY+img.height/2, width-head.width, (width/2-head.width)*tan(theta_3)+objectY+img.height/2);
      line(objectX, objectY, width-head.width, objectY+(a+width/2-head.width)*tan(theta_2));
      float theta_4 = atan((img.height*m-img.height/2)/b);
      line(objectX, objectY, width/2, height/2+img.height/2);
      line(width/2, height/2+img.height/2, width-head.width, (width/2-head.width)*tan(theta_4)+height/2+img.height/2);
      if (img.height*m < lensHeight/2) {
        line(objectX, objectY, width/2, height/2+img.height*m);
        line(width/2, height/2+img.height*m, width-head.width, height/2+img.height*m);
      }
    }
    if (a <= focusLength) {
      b = a*focusLength/(focusLength-a);
      m = b/a;
      theta_1 = atan(img.height/focusLength);
      theta_2 = atan(img.height/a);
      dashedLine(head.width, height/2-(width/2-head.width)*tan(theta_1)-img.height, width/2, objectY);
      dashedLine(head.width, height/2-(width/2-head.width)*tan(theta_2), objectX, objectY);
      line(objectX, objectY, width/2, objectY);
      line(width/2, objectY, width-head.width, objectY+(width/2-head.width)*tan(theta_1));
      line(objectX, objectY, width-head.width, objectY+(a+width/2-head.width)*tan(theta_2));
    }
  } else if (anyLens == "concaveLens") {
    b = a*focusLength/(a+focusLength);
    m = b/a;
    theta_1 = atan(img.height/focusLength);
    theta_2 = atan(img.height*m/focusLength);
    line(objectX, objectY, width/2, objectY);
    dashedLine(width/2-focusLength, height/2, width/2, height/2-(focusLength)*tan(theta_1));
    line(width/2, objectY, width-head.width, height/2-(width/2-head.width)*tan(theta_1)-img.height);
    line(objectX, objectY, width/2, height/2-img.height*m);
    line(width/2, height/2-img.height*m, width-head.width, height/2-img.height*m);
    dashedLine(width/2-b, height/2-img.height*m, width/2, height/2-img.height*m);
    dashedLine(width/2, height/2-img.height*m, width-head.width, height/2+(width/2-head.width)*tan(theta_2)-img.height*m);
    float theta_3 = atan(img.height/a);
    line(objectX, objectY, width-head.width, height/2+(width/2-head.width)*tan(theta_3));
  } else if (anyLens == "halfPartition") {
    if (a > focusLength) {
      b = a*focusLength/(a-focusLength);
      m = b/a;
      theta_1 = atan((img.height*m+img.height)/b);
      theta_2 = atan(img.height/a);
      line(objectX, objectY, width/2, objectY);
      line(width/2, objectY, width-head.width, objectY+(width/2-head.width)*tan(theta_1));
      float theta_3 = atan((img.height/2+img.height*m)/b);
      line(objectX, objectY, width/2, objectY+img.height/2);
      line(width/2, objectY+img.height/2, width-head.width, (width/2-head.width)*tan(theta_3)+objectY+img.height/2);
      line(objectX, objectY, width-head.width, objectY+(a+width/2-head.width)*tan(theta_2));
      line(objectX, objectY, width/2, height/2+img.height/2);
      if (img.height*m < lensHeight/2) {
        line(objectX, objectY, width/2, height/2+img.height*m);
      }
    }
    if (a <= focusLength) {
      b = a*focusLength/(focusLength-a);
      m = b/a;
      theta_1 = atan(img.height/focusLength);
      theta_2 = atan(img.height/a);
      dashedLine(head.width, height/2-(width/2-head.width)*tan(theta_1)-img.height, width/2, objectY);
      dashedLine(head.width, height/2-(width/2-head.width)*tan(theta_2), objectX, objectY);
      line(objectX, objectY, width/2, objectY);
      line(width/2, objectY, width-head.width, objectY+(width/2-head.width)*tan(theta_1));
      line(objectX, objectY, width-head.width, objectY+(a+width/2-head.width)*tan(theta_2));
    }
    fill(100);
    stroke(100);
    rect(width/2-lensWidth/2, height/2, lensWidth/2, lensHeight/2);
    stroke(255);
  } else if (anyLens == "stripePartition") {
    if (a > focusLength) {
      b = a*focusLength/(a-focusLength);
      m = b/a;
      theta_1 = atan((img.height*m+img.height)/b);
      theta_2 = atan(img.height/a);
      line(objectX, objectY, width/2, objectY);
      float theta_3 = atan((img.height/2+img.height*m)/b);
      line(objectX, objectY, width/2, objectY+img.height/2);
      line(width/2, objectY+img.height/2, width-head.width, (width/2-head.width)*tan(theta_3)+objectY+img.height/2);
      line(objectX, objectY, width/2, height/2);
      float theta_4 = atan((img.height*m-img.height/2)/b);
      line(objectX, objectY, width/2, height/2+img.height/2);
      line(width/2, height/2+img.height/2, width-head.width, (width/2-head.width)*tan(theta_4)+height/2+img.height/2);
      if (img.height*m < lensHeight/2) {
        line(objectX, objectY, width/2, height/2+img.height*m);
        if (height/2+img.height*m < height/2+candle.height-lensHeight/12 || height/2+img.height*m > height/2+candle.height+lensHeight/12) {
          line(width/2, height/2+img.height*m, width-head.width, height/2+img.height*m);
        }
      }
    }
    if (a <= focusLength) {
      b = a*focusLength/(focusLength-a);
      m = b/a;
      theta_1 = atan(img.height/focusLength);
      theta_2 = atan(img.height/a);
      dashedLine(head.width, height/2-(width/2-head.width)*tan(theta_1)-img.height, width/2, objectY);
      dashedLine(head.width, height/2-(width/2-head.width)*tan(theta_2), objectX, objectY);
      line(objectX, objectY, width/2, objectY);
      line(width/2, objectY, width-head.width, objectY+(width/2-head.width)*tan(theta_1));
      line(objectX, objectY, width-head.width, objectY+(a+width/2-head.width)*tan(theta_2));
    }
    fill(100);
    stroke(100);
    rect(width/2-lensWidth/2, height/2-lensHeight/12, lensWidth/2, lensHeight/6);
    rect(width/2-lensWidth/2, height/2-candle.height-lensHeight/12, lensWidth/2, lensHeight/6);
    rect(width/2-lensWidth/2, height/2+candle.height-lensHeight/12, lensWidth/2, lensHeight/6);
    stroke(255);
  }
}
