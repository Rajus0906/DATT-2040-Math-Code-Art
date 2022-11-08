import peasy.*;
PeasyCam cam;

PImage img;


void setup() {
  size(700, 700, P3D);

  img = loadImage("sorry.jpeg");
  cam = new PeasyCam(this, 500);
  strokeWeight(res);
}
int res = 5;

void draw() {
  background(0);
  translate(-width/6, -height/6);

  for (int i = 0; i < img.width; i+=res) {
    for (int j = 0; j < img.height; j+=res) {

      int loc = i+j*img.width;


      stroke(color(img.pixels[loc]));
      float z = (red(img.pixels[loc])+green(img.pixels[loc])+blue(img.pixels[loc]))/3;

      point(i, j, z);
    }
  }
}
