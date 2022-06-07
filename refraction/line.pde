void lineCalculate() {
  theta1 = radians(lightRotateTheta);
  theta2 = asin(sin(theta1)/n12);
  n12 = n2/n1;
  boundary = sin(theta1)/n12;
}

void lineBackgroundSetting() {
  noFill();
  strokeWeight(5);
  stroke(255);
  if (-1 < boundary && boundary < 1) {
    if (theta1 > 0) {
      stroke(255, 0, 255);
      arc(width/2, height/2, height/10, height/10, PI/2, theta1+PI/2);
      stroke(0, 255, 255);
      arc(width/2, height/2, height/10, height/10, -theta1+PI/2, PI/2);
      if (theta1 != PI/2 && theta1 != -PI/2) {
        stroke(0, 255, 0);
        arc(width/2, height/2, height/10, height/10, 3*PI/2, theta2+3*PI/2);
      }
    } else {
      stroke(255, 0, 255);
      arc(width/2, height/2, height/10, height/10, theta1+PI/2, PI/2);
      stroke(0, 255, 255);
      arc(width/2, height/2, height/10, height/10, PI/2, -theta1+PI/2);
      if (theta1 != PI/2 && theta1 != -PI/2) {
        stroke(0, 255, 0);
        arc(width/2, height/2, height/10, height/10, theta2+3*PI/2, 3*PI/2);
      }
    }
    fill(255);
    text(nf(abs(degrees(theta1)), 1, 1)+"'", width/2-2*width/50, height/2+4*width/50);
    text(nf(abs(degrees(theta1)), 1, 1)+"'", width/2+2*width/50, height/2+4*width/50);
    if (theta1 != PI/2 && theta1 != -PI/2) {
      text(nf(abs(degrees(theta2)), 1, 1)+"'", width/2+2*width/50, height/2-4*width/50);
    }
  } else {
    if (theta1 > 0) {
      stroke(255, 0, 255);
      arc(width/2, height/2, height/10, height/10, PI/2, theta1+PI/2);
      stroke(0, 255, 255);
      arc(width/2, height/2, height/10, height/10, -theta1+PI/2, PI/2);
      fill(255);
      text(nf(abs(degrees(theta1)), 1, 1)+"'", width/2-2*width/50, height/2+4*width/50);
      text(nf(abs(degrees(theta1)), 1, 1)+"'", width/2+2*width/50, height/2+4*width/50);
    } else {
      stroke(255, 0, 255);
      arc(width/2, height/2, height/10, height/10, theta1+PI/2, PI/2);
      stroke(0, 255, 255);
      arc(width/2, height/2, height/10, height/10, PI/2, -theta1+PI/2);
      fill(255);
      text(nf(abs(degrees(theta1)), 1, 1)+"'", width/2-2*width/50, height/2+4*width/50);
      text(nf(abs(degrees(theta1)), 1, 1)+"'", width/2+2*width/50, height/2+4*width/50);
    }
  }
  stroke(255, 100);
  strokeWeight(5);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
}

void lineRays() {
  float s = sq((n1*cos(theta1)-n2*cos(theta2))/(n1*cos(theta1)+n2*cos(theta2)));
  float p  = sq((n1*cos(theta2)-n2*cos(theta1))/(n1*cos(theta2)+n2*cos(theta1)));
  float strength = (s+p)/2;
  strokeWeight(5);
  stroke(255, 0, 0);
  line(width/2, height/2, width/2-(height/2-height/6)*sin(theta1), height/2+(height/2-height/6)*cos(theta1));
  if (-1 < boundary && boundary < 1) {
    stroke(255, 0, 0, 255*strength);
  } else {
    stroke(255, 0, 0);
  }
  line(width/2, height/2, width/2+(width)*sin(theta1), height/2+(width)*cos(theta1));
  stroke(255, 0, 0, 255*(1-strength));
  line(width/2, height/2, width/2+(width)*sin(theta2), height/2-(width)*cos(theta2));
}
