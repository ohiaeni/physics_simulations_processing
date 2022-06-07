void lightResource() {
  strokeWeight(1);
  pushMatrix();
  translate(width/2, height/2);
  fill(0);
  stroke(255);
  rotate(radians((lightRotateTheta)));
  rect(-width/48, height/2-height/6, width/24, height/6);
  popMatrix();
}

void tableDisplay() {
  fill(0);
  stroke(255);
  for (int i = 0; i <2; i++) {
    for (int j = 0; j<4; j++) {
      fill(0);
      rect(10+width/12*i, 10+height/20*j, width/12, height/20);
      fill(255);
      if (i == 0) {
        if (j == 0) {
          text("Air", 10+width/12*i, 10+height/20*j, width/12, height/20);
        }
        if (j==1) {
          text("Water", 10+width/12*i, 10+height/20*j, width/12, height/20);
        }
        if (j==2) {
          text("Glass", 10+width/12*i, 10+height/20*j, width/12, height/20);
        }
        if (j==3) {
          text("Diamond", 10+width/12*i, 10+height/20*j, width/12, height/20);
        }
      }
      if ( i == 1) {
        if (j == 0) {
          text("1.0", 10+width/12*i, 10+height/20*j, width/12, height/20);
        }
        if (j==1) {
          text("1.3", 10+width/12*i, 10+height/20*j, width/12, height/20);
        }
        if (j==2) {
          text("1.5", 10+width/12*i, 10+height/20*j, width/12, height/20);
        }
        if (j==3) {
          text("2.4", 10+width/12*i, 10+height/20*j, width/12, height/20);
        }
      }
    }
  }
}


void operation() {
  if (mousePressed) {
    count++;
    if (dist(9*rotateRemocon.width/10, height-rotateRemocon.height+3*rotateRemocon.height/10, mouseX, mouseY) < rotateRemocon.width/20 && lightRotateTheta <90 && count >10) {
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
      strLightRotateTheta = nf(lightRotateTheta, 1, 1);
    }
    if (dist(9*rotateRemocon.width/10, height-rotateRemocon.height+7*rotateRemocon.height/10, mouseX, mouseY) < rotateRemocon.width/20 && lightRotateTheta >-90&& count >10) {
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
      strLightRotateTheta = nf(lightRotateTheta, 1, 1);
    }
    theta1 = radians(lightRotateTheta);
    theta2 = asin(sin(theta1)/n12);
    n12 = n2/n1;
  } else {
    count=0;
  }
  if (strLightRotateTheta.length() == 0) {
    strLightRotateTheta = "0";
    lightRotateTheta = float(strLightRotateTheta);
  }
  fill(255);
  image(rotateRemocon, 0, height-rotateRemocon.height);
  text(nf(abs(lightRotateTheta), 1, 1)+"'", 5*rotateRemocon.width/12, height-rotateRemocon.height+rotateRemocon.height/4, rotateRemocon.width/3, rotateRemocon.height/2);
  image(nRemocon, 0, height/2-nRemocon.height);
  text(nf(n2, 1, 1)+"'", 5*nRemocon.width/12, height/2-nRemocon.height+nRemocon.height/4, nRemocon.width/3, nRemocon.height/2);
  image(nRemocon, 0, height/2);
  text(nf(n1, 1, 1)+"'", 5*nRemocon.width/12, height/2+nRemocon.height/4, nRemocon.width/3, nRemocon.height/2);
  if (1.0<=float(nf(n1, 1, 1)) && float(nf(n1, 1, 1))<1.1)text("Air", width-3*width/50, height/2+width/50);
  if (1.3<=float(nf(n1, 1, 1)) && float(nf(n1, 1, 1))<1.4)text("Water", width-3*width/50, height/2+width/50);
  if (1.5<=float(nf(n1, 1, 1)) && float(nf(n1, 1, 1))<1.6)text("Grass", width-3*width/50, height/2+width/50);
  if (2.4<=float(nf(n1, 1, 1)) && float(nf(n1, 1, 1))<2.5)text("Diamond", width-3*width/50, height/2+width/50);
  if (1.0<=float(nf(n2, 1, 1)) && float(nf(n2, 1, 1))<1.1)text("Air", width-3*width/50, height/2-width/50);
  if (1.3<=float(nf(n2, 1, 1)) && float(nf(n2, 1, 1))<1.4)text("Water", width-3*width/50, height/2-width/50);
  if (1.5<=float(nf(n2, 1, 1)) && float(nf(n2, 1, 1))<1.6)text("Grass", width-3*width/50, height/2-width/50);
  if (2.4<=float(nf(n2, 1, 1)) && float(nf(n2, 1, 1))<2.5)text("Diamond", width-3*width/50, height/2-width/50);
}

void keyPressed() {
  if (key == BACKSPACE) {
    if (strLightRotateTheta.length() > 0) {
      strLightRotateTheta = strLightRotateTheta.substring(0, strLightRotateTheta.length()-1);
      lightRotateTheta = float(strLightRotateTheta);
    }
  } else if (strLightRotateTheta.length() <3) {
    if (key == '0'||key == '1'||key == '2' ||key =='3' ||key == '4'||key == '5'||key=='6'||key == '7'||key=='8'||key =='9') {
      strLightRotateTheta = strLightRotateTheta+key;
      lightRotateTheta = float(strLightRotateTheta);
    }
  }
  if (lightRotateTheta >90) {
    lightRotateTheta = 90;
    strLightRotateTheta = nf(lightRotateTheta, 1, 1);
  }
}

void mousePressed() {
  theta1 = radians(lightRotateTheta);
  theta2 = asin(sin(theta1)/n12);
  n12 = n2/n1;
  if (dist(9*rotateRemocon.width/10, height-rotateRemocon.height+3*rotateRemocon.height/10, mouseX, mouseY) < rotateRemocon.width/20 && lightRotateTheta <90) {
    lightRotateTheta +=0.1;
    raysX = width/2-(height/2-height/6)*sin(theta1);
    raysY = height/2+(height/2-height/6)*cos(theta1);
    raysX2 = width/2;
    raysY2 = height/2;
    if (lightRotateTheta > 90) {
      lightRotateTheta = 90;
    }
    strLightRotateTheta = nf(lightRotateTheta, 1, 1);
  }
  if (dist(9*rotateRemocon.width/10, height-rotateRemocon.height+7*rotateRemocon.height/10, mouseX, mouseY) < rotateRemocon.width/20 && lightRotateTheta >-90) {
    lightRotateTheta-=0.1;
    raysX = width/2-(height/2-height/6)*sin(theta1);
    raysY = height/2+(height/2-height/6)*cos(theta1);
    raysX2 = width/2;
    raysY2 = height/2;
    if (lightRotateTheta < -90) {
      lightRotateTheta = -90;
    }
    strLightRotateTheta = nf(lightRotateTheta, 1, 1);
  }
  if (dist(9*nRemocon.width/10, height/2+3*nRemocon.height/10, mouseX, mouseY) < nRemocon.width/20) {
    n1+=0.1;
    raysX = width/2-(height/2-height/6)*sin(theta1);
    raysY = height/2+(height/2-height/6)*cos(theta1);
    raysX2 = width/2;
    raysY2 = height/2;
  }
  if (dist(9*nRemocon.width/10, height/2+7*nRemocon.height/10, mouseX, mouseY) < nRemocon.width/20 && n1 > 0.1) {
    n1-=0.1;
    if (n1 < 0.1) {
      n1 = 0.1;
    }
    raysX = width/2-(height/2-height/6)*sin(theta1);
    raysY = height/2+(height/2-height/6)*cos(theta1);
    raysX2 = width/2;
    raysY2 = height/2;
  }
  if (dist(9*nRemocon.width/10, height/2-nRemocon.height+3*nRemocon.height/10, mouseX, mouseY) < nRemocon.width/20) {
    n2+=0.1;
    raysX = width/2-(height/2-height/6)*sin(theta1);
    raysY = height/2+(height/2-height/6)*cos(theta1);
    raysX2 = width/2;
    raysY2 = height/2;
  }
  if (dist(9*nRemocon.width/10, height/2-nRemocon.height+7*nRemocon.height/10, mouseX, mouseY) < nRemocon.width/20 && n2 > 0.1) {
    n2-=0.1;
    if (n2 < 0.1) {
      n2 = 0.1;
    }
    raysX = width/2-(height/2-height/6)*sin(theta1);
    raysY = height/2+(height/2-height/6)*cos(theta1);
    raysX2 = width/2;
    raysY2 = height/2;
  }
  for (int i = 0; i<4; i++) {
    if (width-(4-i)*width/8< mouseX && mouseX <width-(4-i-1)*width/8 && 0 < mouseY && mouseY < height/20) {
      if (i == 0) {
        simulationMode = "animation";
      }
      if (i == 1) {
        simulationMode = "animationMax";
      }
      if (i == 2) {
        simulationMode = "line";
      }
      if (i == 3) {
        simulationMode = "lineMax";
      }
    }
  }
}
