void operation(PImage img) {
  cursor(ARROW);
  if (objectX >= head.width+img.width/2 && objectX <= width/2-img.width/2-lensWidth/2 && dist(mouseX, mouseY, objectX, 3*height/4)<height/20) {
    cursor(MOVE);
    if (mousePressed) {
      objectX = mouseX;
    }
    
  }
  if (objectX < head.width+img.width/2) {
    objectX = head.width+img.width/2;
  }
  if (objectX > width/2-img.width/2-lensWidth/2) {
    objectX = width/2-img.width/2-lensWidth/2;
  }
  if (screenX >=width/2+screenWidth/2 && screenX <= width-head.width-screenWidth/2 && dist(mouseX, mouseY, screenX+lensWidth/2, 3*height/4) < height/20) {
    cursor(MOVE);
    if (mousePressed) {
      screenX = mouseX-screenWidth/2;
    }
  }
  if (screenX < width/2+lensWidth/2) {
    screenX = width/2+lensWidth/2;
  }
  if (screenX > width-head.width-screenWidth) {
    screenX = width-head.width-screenWidth;
  }
  if (dist(mouseX, mouseY, width/2-focusLength, height/2+width/50+25+pointArrow.height/2) < height/20) {
    cursor(MOVE);
    if (mousePressed) {
      focusLength =width/2-mouseX;
      if (focusLength < 0) {
        focusLength = 0;
      }
      if (focusLength > width/2-head.width) {
        focusLength = width/2-head.width;
      }
    }
  }
  if (dist(mouseX, mouseY, width/2, height/2+lensHeight/2+switchArrow.height/2) < switchArrow.width/2) {
    cursor(HAND);
  }
  if (dist(mouseX, mouseY, objectX, objectY-switchArrow.height)<switchArrow.width/2) {
    cursor(HAND);
  }
}

void mousePressed() {
  if (dist(mouseX, mouseY, width/2, height/2+lensHeight/2+switchArrow.height/2) < switchArrow.width/2) {
    if (anyLens == "convexLens") {
      anyLens = "concaveLens";
    } else if (anyLens =="concaveLens") {
      anyLens = "halfPartition";
    } else if (anyLens == "halfPartition") {
      anyLens = "stripePartition";
    } else if (anyLens == "stripePartition") {
      anyLens = "convexLens";
    }
  }
  if (dist(mouseX, mouseY, objectX, objectY-switchArrow.height)<switchArrow.width/2) {
    if (anyObject == "F") {
      anyObject = "LED";
    } else if (anyObject =="LED") {
      anyObject = "candle";
    } else if (anyObject == "candle") {
      anyObject = "F";
    }
  }
  if (width-width/6 < mouseX && mouseX < width && 0 < mouseY && mouseY < width/(6*8)) {
    if (speechBubbleIs == true) {
      speechBubbleIs = false;
    } else {
      speechBubbleIs = true;
    }
  }
}
