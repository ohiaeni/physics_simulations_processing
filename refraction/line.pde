void lineCalculate() {
  theta1 = radians(lightRotateTheta);
  theta2 = asin(sin(theta1)/n12);
  n12 = n2/n1;
  boundary = sin(theta1)/n12;
}
void lineOperation() {
  if (mousePressed) {
    count++;
    if (dist(width-rotateRemocon.width+9*rotateRemocon.width/10, height-rotateRemocon.height+3*rotateRemocon.height/10, mouseX, mouseY) < rotateRemocon.width/20 && lightRotateTheta <90 && count >10) {
      if (count > 30) {
        lightRotateTheta +=0.5;
      } else {
        lightRotateTheta +=0.1;
      }
      theta1 = radians(lightRotateTheta);
      theta2 = asin(sin(theta1)/n12);
      n12 = n2/n1;
      if (lightRotateTheta > 90) {
        lightRotateTheta = 90;
      }
    }
    if (dist(width-rotateRemocon.width+9*rotateRemocon.width/10, height-rotateRemocon.height+7*rotateRemocon.height/10, mouseX, mouseY) < rotateRemocon.width/20 && lightRotateTheta >-90&& count >10) {
      if (count > 30) {
        lightRotateTheta -=0.5;
      } else {
        lightRotateTheta -=0.1;
      }
      theta1 = radians(lightRotateTheta);
      theta2 = asin(sin(theta1)/n12);
      n12 = n2/n1;
      if (lightRotateTheta < -90) {
        lightRotateTheta = -90;
      }
    }
    theta1 = radians(lightRotateTheta);
    theta2 = asin(sin(theta1)/n12);
    n12 = n2/n1;
  } else {
    count=0;
  }
  fill(255);
  image(rotateRemocon, width-rotateRemocon.width, height-rotateRemocon.height);
  text(nf(abs(lightRotateTheta), 1, 1)+"'", width-rotateRemocon.width+5*rotateRemocon.width/12, height-rotateRemocon.height+rotateRemocon.height/4, rotateRemocon.width/3, rotateRemocon.height/2);
  image(nRemocon, 0, height/2-nRemocon.height);
  text(nf(n2, 1, 1)+"'", 5*nRemocon.width/12, height/2-nRemocon.height+nRemocon.height/4, nRemocon.width/3, nRemocon.height/2);
  image(nRemocon, 0, height/2);
  text(nf(n1, 1, 1)+"'", 5*nRemocon.width/12, height/2+nRemocon.height/4, nRemocon.width/3, nRemocon.height/2);
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
    if(theta1 != PI/2 && theta1 != -PI/2){
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
