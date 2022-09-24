PVector[] pos;
PVector[] acc;

int num = 20;

int speed = 6;
int speed1 = 3;

void setup(){
  size(1000,1000);
  
  pos = new PVector[num];
  acc = new PVector[num];
  
  //populate
  for(int i=0; i < num; i++){
    
    pos[i] = new PVector (random(width), random(height), random(30,70));
    acc[i] =  new PVector (random(-speed,speed1), random(-speed1,speed),0);
  }
  background(0);
  
}


void draw(){
  //background(0);
  
  fill(0,20);
  rect(0,0,width,height);
  for(int j = 0; j < num; j++){ 
    pos[j].add(acc[j]); 
    
//x boundary check
  if(pos[j].x > width-(pos[j].z/2) || pos[j].x < (pos[j].z/2)){
    acc[j].x = acc[j].x * -1;
  }

//y boundry check
  if(pos[j].y > height-(pos[j].z/2) || pos[j].y < pos[j].z/2){   
    acc[j].y = acc[j].y * -1;
  }
    fill(random(255),random(255),random(255),10);
    stroke(random(255),random(255),random(255),150);
    ellipse(pos[j].x,pos[j].y,pos[j].z+sin(pos[j].z*frameCount*0.001)*pos[j].z,pos[j].z);
  }
}

void mousePressed(){
  
  for(int i=0; i < num; i++){
    
    pos[i] = new PVector (random(width), random(height), random(10,70));
    acc[i] =  new PVector (random(-speed,speed1), random(-speed1,speed),0);
  }
}
