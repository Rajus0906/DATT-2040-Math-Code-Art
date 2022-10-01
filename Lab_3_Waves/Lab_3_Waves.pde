int xspacing = 20;   // How far apart should each horizontal location be spaced
int w;              // Width of entire wave
int maxwaves = 6;   // total # of waves to add together

float theta = 0.5;
float[] amplitude = new float[maxwaves];   // Height of wave
float[] dx = new float[maxwaves];          // Value for incrementing X, to be calculated as a function of period and xspacing
float[] yvalues;                           // Using an array to store height values for the wave (not entirely necessary)

float lx = -999, ly = -999;

void setup() {
  size(750,500);
  smooth();
  w = width + 16;

  for (int i = 0; i < maxwaves; i++) {
    amplitude[i] = random(10,30);
    float period = random(100,300); // How many pixels before the wave repeats
    dx[i] = (TWO_PI / period) * xspacing;
  }

  yvalues = new float[w/xspacing];
}

void draw() {
  background(0);
  calcWave();
  renderWave();
  
  
  for (int i = 0; i < width; i++) {

    float wlen1 = 0.01;
    float w1 = sin(i*wlen1)*50;

    float wlen2 = 0.05;
    float w2 = 1+sin(frameCount*0.0002*i+wlen2)*10;

    float waveadd = (w1*w2)/5;

    if (lx < (width)-5) {
      line(i, height/2+waveadd, lx, ly);
      lx = i;
      ly = height/3+waveadd;
    } else {
      lx = 5;
      ly = height/5;
    }
  }
}


void calcWave() {
  // Increment theta (try different values for 'angular velocity' here
  theta += 0.2;

  // Set all height values to zero
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = 0;
  }
 
  // Accumulate wave height values
  for (int j = 0; j < maxwaves; j++) {
    float x = theta;
    for (int i = 0; i < yvalues.length; i++) {
      // Every other wave is cosine instead of sine
      if (j % 2 == 0)  yvalues[i] += sin(x)*amplitude[j];
      else yvalues[i] += cos(x)*amplitude[j];
      x+=dx[j];
    }
  }
}

void renderWave() {
  // A simple way to draw the wave with an ellipse at each location
  stroke(125,200,0);
  fill(random(255),random(255),random(255));
  ellipseMode(CORNER);
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing,height/3+yvalues[x],20,20);
  }
}
