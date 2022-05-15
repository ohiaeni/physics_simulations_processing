void speechBubble(float posX, float posY, float lengthX, float lengthY, String textContent, color clr, String dir) {
  noStroke();
  fill(clr);
  if (dir == "top" || dir == "TOP") {
    triangle(posX, posY-lengthY/4, posX-lengthX/14, posY, posX+lengthX/14, posY);
  } else if (dir =="bottom" || dir == "BOTTOM") {
    triangle(posX, posY+lengthY+lengthY/4, posX-lengthX/14, posY+lengthY, posX+lengthX/14, posY+lengthY);
  } else if (dir =="left" || dir == "LEFT") {
    triangle(posX-lengthX/2-lengthY/4, posY+lengthY/2, posX-lengthX/2, posY+lengthY/2-lengthX/14, posX-lengthX/2, posY+lengthY/2+lengthX/14);
  } else if (dir == "right" || dir == "RIGHT") {
    triangle(posX+lengthX/2+lengthY/4, posY+lengthY/2, posX+lengthX/2, posY+lengthY/2-lengthX/14, posX+lengthX/2, posY+lengthY/2+lengthX/14);
  }
  rect(posX-lengthX/2, posY, lengthX, lengthY, 10);
  fill(0);
  text(textContent, posX, posY+lengthY/2);
  fill(255);
  stroke(255);
}
