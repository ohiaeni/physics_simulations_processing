class Ball {
  float posx, posy, string_length, theta, theta0;
  int material, panelCount;
  Ball(float s_l, float t_0) {
    string_length = s_l;
    theta0 = t_0;
  }
  void controller(float n) {
    if (panelCount == 1) {
      image(panel_button2, n-panel_button2.width+width/3, 0);
      image(remort_controller, n, 0);
      text(theta0+"°", n+5*remort_controller.width/12, 0, remort_controller.width/3, remort_controller.height/2);
      text(nf(string_length/50, 1, 0)+"cm", n+5*remort_controller.width/12, remort_controller.height/2, remort_controller.width/3, remort_controller.height/2);
    } else {
      image(panel_button1, n-panel_button1.width+width/3, 0);
    }
  }
  void calculate(float n) {
    posx = n+width/6+string_length*sin(theta);
    posy = 100+string_length*cos(theta);
    theta = radians(theta0)*cos(sqrt(gravity/(string_length/float(50*100)))*count/fps);
  }
  void display(float n) {
    line(posx, posy, n+width/6, 100);
    image(ball, posx-radi, posy-radi, radi*2, radi*2);
  }
}
