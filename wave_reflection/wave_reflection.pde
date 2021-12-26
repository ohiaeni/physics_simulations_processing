int hm = 100;
float speed, stopper_x, stopper_y, slider_pos;
PImage stopper, start_button, stop_button, reset_button, button, fixed_panel, free_panel, slider;
boolean clicked_count, fixed_count, push;
ArrayList<WAVE1> waves1;
ArrayList<WAVE2> waves2;
MEDIUM[] mediums = new MEDIUM[hm];

void setup() {
  fullScreen();
  speed = 1;
  stopper = loadImage("https://live.staticflickr.com/65535/51764210494_f754e87f6f_o.png");
  stopper.resize(100, 0);
  start_button = loadImage("https://live.staticflickr.com/65535/51673047512_5eeef070b7_o.png");
  start_button.resize(5*width/72, 0);
  stop_button = loadImage("https://live.staticflickr.com/65535/51674520944_fec8f44a10_o.png");
  stop_button.resize(5*width/72, 0);
  reset_button = loadImage("https://live.staticflickr.com/65535/51674724605_d816b9c9f2_o.png");
  reset_button.resize(5*width/72, 0);
  button = loadImage("https://live.staticflickr.com/65535/51768013151_dc94307cc0_o.png");
  button.resize(100, 100);
  fixed_panel = loadImage("https://live.staticflickr.com/65535/51773568681_2584fa3ed2_o.png");
  fixed_panel.resize(width/5, 0);
  free_panel = loadImage("https://live.staticflickr.com/65535/51774212474_10b8bb1e3c_o.png");
  free_panel.resize(width/5, 0);
  slider = loadImage("https://live.staticflickr.com/65535/51772772422_7c72a2022e_o.png");
  slider.resize(width/5, 0);
  clicked_count = true;
  fixed_count = true;
  push = false;
  waves1 = new ArrayList<WAVE1>();
  waves2 = new ArrayList<WAVE2>();
  for (int i = 0; i< hm; i++) {
    mediums[i] = new MEDIUM(i*(width-200)/hm, 0, i);
  }
  stopper_x = width-stopper.width-5-(width-200)/hm;
  stopper_y = height/2-stopper.height/8;
  slider_pos = 100-button.width/2+9*slider.width/10;
}

void draw() {
  background(100);
  if (clicked_count == true) {
    for (int i = 0; i< waves1.size(); i++) {
      waves1.get(i).calculate();
    }
    for (int i = 0; i< waves2.size(); i++) {
      waves2.get(i).calculate();
    }
    for (int i = 0; i < hm; i++) {
      mediums[i].calculate();
    }
  }
  for (int i = 0; i < hm; i++) {
    mediums[i].display();
  }
  clicked_function();
  image_display();
}
