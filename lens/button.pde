void button(PImage img) {
  tint(255, 255);
  fill(255, 255);
  image(switchArrow, width/2-switchArrow.width/2, height/2+lensHeight/2);
  image(switchArrow, objectX-switchArrow.width/2, objectY-switchArrow.height);
  image(pointArrow, width/2-focusLength-pointArrow.width/2, height/2+width/50+25);
  text("focus", width/2-focusLength, height/2+width/50+25+pointArrow.height+10);
  if (speechBubbleIs == true) {
    speechBubble(width/2-focusLength, height/2+width/50+25+pointArrow.height+45, 100, 60, nf(focusLength/50, 1, 1), color(255), "top");
  }
}
