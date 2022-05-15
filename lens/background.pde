void backgroundSetting() {
  background(0);
  line(head.width, height/2, width-head.width, height/2);
  if (anyLens == "convexLens") {
    image(convexLens, width/2-lensWidth/2, height/2-lensHeight/2);
  } else if (anyLens == "concaveLens") {
    image(concaveLens, width/2-lensWidth/2, height/2-lensHeight/2);
  } else if (anyLens == "halfPartition") {
    image(convexLens, width/2-lensWidth/2, height/2-lensHeight/2);
  } else if (anyLens == "stripePartition") {
    image(convexLens, width/2-lensWidth/2, height/2-lensHeight/2);
  }
  line(width/2-focusLength, height/2-30, width/2-focusLength, height/2+30);
  line(width/2+focusLength, height/2-30, width/2+focusLength, height/2+30);
  fill(255, 255);
  strokeWeight(1);
  for (int i = 0; i < width/2-head.width; i+= 10) {
    if (i % 50 == 0) {
      line(width/2-i, height/2-7, width/2-i, height/2+7);
      text(i/50, width/2-i, height/2+width/50);
      if (i > 0) {
        line(width/2+i, height/2-7, width/2+i, height/2+7);
        text(i/50, width/2+i, height/2+width/50);
      }
      stroke(255, 100);
      line(width/2-i, height/4, width/2-i, height/2);
      line(width/2+i, height/4, width/2+i, height/2);
      stroke(255, 255);
    }
    stroke(255, 50);
    line(width/2-i, height/4, width/2-i, height/2);
    line(width/2+i, height/4, width/2+i, height/2);
    stroke(255, 255);
  }
  for (int i = height/2; i> height/4; i-=10) {
    if ((height/2-i) % 50 == 0) {
      stroke(255, 255);
      line(head.width-7, i, head.width, i);
      text((height/2-i)/50, head.width-width/50, i);
      stroke(255, 50);
      line(head.width, i, width-head.width, i);
    }
    stroke(255, 50);
    line(head.width, i, width-head.width, i);
  }
  stroke(255, 255);
  strokeWeight(3);
  line(head.width, height/4, head.width, height/2);
  fill(0);
  rect(head.width, 3*height/4, width-2*head.width, 25);
  fill(100);
  rect(width-width/6, 0, width/6, width/(6*8));
  fill(0);
  if (speechBubbleIs == true) {
    text("speechBubble ON", width-width/(6*2), width/(6*8*2));
  } else {
    text("speechBubble OFF", width-width/(6*2), width/(6*8*2));
  }
}
