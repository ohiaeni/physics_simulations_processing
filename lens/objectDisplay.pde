void objectDisplay(PImage img) {
  float a = width/2-objectX;
  float b, m;
  line(objectX, height/2, objectX, 3*height/4);
  fill(100);
  rect(objectX-25, 3*height/4-25, 50, 25);
  if (speechBubbleIs == true) {
    speechBubble(objectX, 3*height/4+50, 100, 60, nf((width/2-objectX)/50, 1, 1), color(255), "top");
  }
  noFill();
  image(img, objectX-img.width/2, objectY);
  stroke(255, 0, 0);
  rect(objectX-img.width/2, objectY, img.width, img.height);
  stroke(255);
  if (speechBubbleIs == true) {
    speechBubble(objectX+img.width/2+75, objectY-30, 100, 60, nf(img.height/50, 1, 1), color(255), "left");
  }
  noFill();
  if (anyLens == "convexLens") {
    if (a <= focusLength) {
      b = a*focusLength/(focusLength-a);
      m = b/a;
      image(img, width/2-b-img.width*m/2, height/2-img.height*m, img.width*m, img.height*m);
      stroke(0, 0, 255);
      rect(width/2-b-img.width*m/2, height/2-img.height*m, img.width*m, img.height*m);
      if (speechBubbleIs == true) {
        speechBubble(width/2-b+img.width*m/2+75, height/2-img.height*m-30, 100, 60, nf(img.height*m/50, 1, 1), color(255), "left");
      }
      stroke(255);
      pushMatrix();
      translate(width-head.width, height/2-img.height+(width/2-head.width)*tan(atan(img.height/focusLength)));
      rotate(PI/10);
      image(head, 0, 0);
      popMatrix();
    }
  }
  if (anyLens == "concaveLens") {
    b = a*focusLength/(a+focusLength);
    m = b/a;
    image(img, width/2-b-img.width*m/2, height/2-img.height*m, img.width*m, img.height*m);
    stroke(0, 0, 255);
    rect(width/2-b-img.width*m/2, height/2-img.height*m, img.width*m, img.height*m);
    if (speechBubbleIs == true) {
      speechBubble(width/2-b+img.width*m/2+75, height/2-img.height*m-30, 100, 60, nf(img.height*m/50, 1, 1), color(255), "left");
    }
    stroke(255);
    pushMatrix();
    translate(width-head.width, height/2-(width/2-head.width)*tan(atan(img.height/focusLength))-img.height);
    rotate(-PI/10);
    image(head, 0, 0);
    popMatrix();
  }
  if (anyLens == "halfPartition") {
    if (a <= focusLength) {
      b = a*focusLength/(focusLength-a);
      m = b/a;
      image(img, width/2-b-img.width*m/2, height/2-img.height*m, img.width*m, img.height*m);
      stroke(0, 0, 255);
      rect(width/2-b-img.width*m/2, height/2-img.height*m, img.width*m, img.height*m);
      if (speechBubbleIs == true) {
        speechBubble(width/2-b+img.width*m/2+75, height/2-img.height*m-30, 100, 60, nf(img.height*m/50, 1, 1), color(255), "left");
      }
      stroke(255);
      pushMatrix();
      translate(width-head.width, height/2-img.height+(width/2-head.width)*tan(atan(img.height/focusLength)));
      rotate(PI/10);
      image(head, 0, 0);
      popMatrix();
    }
  }
  if (anyLens == "stripePartition") {
    if (a <= focusLength) {
      b = a*focusLength/(focusLength-a);
      m = b/a;
      image(img, width/2-b-img.width*m/2, height/2-img.height*m, img.width*m, img.height*m);
      stroke(0, 0, 255);
      rect(width/2-b-img.width*m/2, height/2-img.height*m, img.width*m, img.height*m);
      if (speechBubbleIs == true) {
        speechBubble(width/2-b+img.width*m/2+75, height/2-img.height*m-30, 100, 60, nf(img.height*m/50, 1, 1), color(255), "left");
      }
      stroke(255);
      pushMatrix();
      translate(width-head.width, height/2-img.height+(width/2-head.width)*tan(atan(img.height/focusLength)));
      rotate(PI/10);
      image(head, 0, 0);
      popMatrix();
    }
  }
}
