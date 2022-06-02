void animationCalculate() {
  theta1 = radians(lightRotateTheta);
  theta2 = asin(sin(theta1)/n12);
  n12 = n2/n1;
  boundary = sin(theta1)/n12;
  if (-1 < boundary && boundary < 1) {
    if (theta1 != PI/2 && theta1 != -PI/2) {
      if (raysY > height/2) {
        raysSpeedX = raysSpeed*cos(theta1+PI/2);
        raysSpeedY = raysSpeed*sin(theta1+PI/2);
      } else {
        raysSpeedX = raysSpeed*cos(theta2+PI/2);
        raysSpeedY = raysSpeed*sin(theta2+PI/2);
        raysX2 -=raysSpeed*cos(theta1+PI/2);
        raysY2 +=raysSpeed*sin(theta1+PI/2);
      }
    } else {
      raysSpeedX = raysSpeed*cos(theta1+PI/2);
      raysSpeedY = raysSpeed*sin(theta1+PI/2);
    }
    raysX -=raysSpeedX;
    raysY -=raysSpeedY;
  } else {
    raysSpeedX = raysSpeed*cos(theta1+PI/2);
    raysSpeedY = raysSpeed*sin(theta1+PI/2);
    if (theta1 > 0) {
      if (raysX > width/2) {
        raysX -=raysSpeedX;
        raysY +=raysSpeedY;
      } else {
        raysX -=raysSpeedX;
        raysY -=raysSpeedY;
      }
    }
    if (theta1 < 0) {
      if (raysX > width/2) {
        raysX -=raysSpeedX;
        raysY -=raysSpeedY;
      } else {
        raysX -=raysSpeedX;
        raysY +=raysSpeedY;
      }
    }
  }
}

void animationOperation() {
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
      raysX = width/2-(height/2-height/6)*sin(theta1);
      raysY = height/2+(height/2-height/6)*cos(theta1);
      raysX2 = width/2;
      raysY2 = height/2;

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
      raysX = width/2-(height/2-height/6)*sin(theta1);
      raysY = height/2+(height/2-height/6)*cos(theta1);
      raysX2 = width/2;
      raysY2 = height/2;

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


void animationBackgroundSetting() {
  noFill();
  strokeWeight(5);
  stroke(255);
  if (-1 < boundary && boundary < 1) {
    if (raysY <= height/2) {
      if (theta1 >= 0 && raysX >= width/2) {
        stroke(255, 0, 255);
        arc(width/2, height/2, height/10, height/10, PI/2, theta1+PI/2);
        stroke(0, 255, 255);
        arc(width/2, height/2, height/10, height/10, -theta1+PI/2, PI/2);
        fill(255);
        text(nf(abs(degrees(theta1)), 1, 1)+"'", width/2-2*width/50, height/2+4*width/50);
        text(nf(abs(degrees(theta1)), 1, 1)+"'", width/2+2*width/50, height/2+4*width/50);
        if (theta1 != PI/2&& theta1 != -PI/2) {
          text(nf(abs(degrees(theta2)), 1, 1)+"'", width/2+2*width/50, height/2-4*width/50);
        }
        if (theta1 != PI/2 && theta1 != -PI/2) {
          stroke(0, 255, 0);
          noFill();
          arc(width/2, height/2, height/10, height/10, 3*PI/2, theta2+3*PI/2);
        }
      }
      if (theta1 < 0 && raysX <= width/2) {
        stroke(255, 0, 255);
        arc(width/2, height/2, height/10, height/10, theta1+PI/2, PI/2);
        stroke(0, 255, 255);
        arc(width/2, height/2, height/10, height/10, PI/2, -theta1+PI/2);
        fill(255);
        text(nf(abs(degrees(theta1)), 1, 1)+"'", width/2-2*width/50, height/2+4*width/50);
        text(nf(abs(degrees(theta1)), 1, 1)+"'", width/2+2*width/50, height/2+4*width/50);
        if (theta1 != PI/2&& theta1 != -PI/2) {
          text(nf(abs(degrees(theta2)), 1, 1)+"'", width/2+2*width/50, height/2-4*width/50);
        }
        if (theta1 != PI/2&& theta1 != -PI/2) {
          stroke(0, 255, 0);
          noFill();
          arc(width/2, height/2, height/10, height/10, theta2+3*PI/2, 3*PI/2);
        }
      }
    }
  } else {
    if (theta1 >= 0) {
      if (raysX >= width/2) {
        stroke(255, 0, 255);
        arc(width/2, height/2, height/10, height/10, PI/2, theta1+PI/2);
        stroke(0, 255, 255);
        arc(width/2, height/2, height/10, height/10, -theta1+PI/2, PI/2);
        fill(255);
        text(nf(abs(degrees(theta1)), 1, 1)+"'", width/2-2*width/50, height/2+4*width/50);
        text(nf(abs(degrees(theta1)), 1, 1)+"'", width/2+2*width/50, height/2+4*width/50);
      }
    } else {
      if (raysX <= width/2) {
        stroke(255, 0, 255);
        arc(width/2, height/2, height/10, height/10, theta1+PI/2, PI/2);
        stroke(0, 255, 255);
        arc(width/2, height/2, height/10, height/10, PI/2, -theta1+PI/2);
        fill(255);
        text(nf(abs(degrees(theta1)), 1, 1)+"'", width/2-2*width/50, height/2+4*width/50);
        text(nf(abs(degrees(theta1)), 1, 1)+"'", width/2+2*width/50, height/2+4*width/50);
      }
    }
  }
  stroke(255, 100);
  strokeWeight(5);
  line(width/2, 0, width/2, height);
  line(0, height/2, width, height/2);
}

void animationRays() {
  float s = sq((n1*cos(theta1)-n2*cos(theta2))/(n1*cos(theta1)+n2*cos(theta2)));
  float p  = sq((n1*cos(theta2)-n2*cos(theta1))/(n1*cos(theta2)+n2*cos(theta1)));
  float strength = (s+p)/2;
  pg.beginDraw();
  pg.noStroke();
  pg.fill(255, 0, 0);
  if (raysY < height/2) {
    pg.fill(255, 0, 0, 255*(1-strength));
  }
  pg.ellipse(raysX, raysY, 5, 5);
  if (-1 < boundary && boundary < 1 && raysY < height/2) {
    pg.fill(255, 0, 0, 255*strength);
    pg.ellipse(raysX2, raysY2, 5, 5);
  }
  if (mousePressed) {
    if (dist(width-rotateRemocon.width+9*rotateRemocon.width/10, height-rotateRemocon.height+3*rotateRemocon.height/10, mouseX, mouseY) < rotateRemocon.width/20 ||dist(width-rotateRemocon.width+9*rotateRemocon.width/10, height-rotateRemocon.height+7*rotateRemocon.height/10, mouseX, mouseY) < rotateRemocon.width/20) {
      raysX = width/2-(height/2-height/6)*sin(theta1);
      raysY = height/2+(height/2-height/6)*cos(theta1);
      raysX2 = width/2;
      raysY2 = height/2;
      pg.background(0);
    }
    if (dist(9*nRemocon.width/10, height/2+3*nRemocon.height/10, mouseX, mouseY) < nRemocon.width/20||dist(9*nRemocon.width/10, height/2+7*nRemocon.height/10, mouseX, mouseY) < nRemocon.width/20||dist(9*nRemocon.width/10, height/2-nRemocon.height+3*nRemocon.height/10, mouseX, mouseY) < nRemocon.width/20||dist(9*nRemocon.width/10, height/2-nRemocon.height+7*nRemocon.height/10, mouseX, mouseY) < nRemocon.width/20) {
      raysX = width/2-(height/2-height/6)*sin(theta1);
      raysY = height/2+(height/2-height/6)*cos(theta1);
      raysX2 = width/2;
      raysY2 = height/2;
      pg.background(0);
    }
    for (int i = 0; i<4; i++) {
      if (width-(4-i)*width/8< mouseX && mouseX <width-(4-i-1)*width/8 && 0 < mouseY && mouseY < height/20) {
        raysX = width/2-(height/2-height/6)*sin(theta1);
        raysY = height/2+(height/2-height/6)*cos(theta1);
        raysX2 = width/2;
        raysY2 = height/2;
        pg.background(0);
      }
    }
  }
  pg.endDraw();
  image(pg, 0, 0);
}
