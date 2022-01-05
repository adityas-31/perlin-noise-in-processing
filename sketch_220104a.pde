int cols, rows;
int scl = 20;
int w = 2200;
int h = 1800;
float flying = 0;

float[][] terrain;

void setup(){
  size(1000, 600, P3D);

  cols = w/scl;
  rows = h/scl;
  terrain = new float[cols][rows];
  
}
//making strip of triangles
void draw(){
  flying -= 0.05;
  float yoff = flying;
  
  for (int y = 0 ; y < rows ; y++){
    float xoff = 0;
    for (int x = 0 ; x < cols ; x++){
      terrain[x][y] = map(noise(xoff , yoff) , 0 , 1 , -150 , 150);
      xoff += 0.1;  
  }
  yoff += 0.1;
  }
  
  background(0 ,0 , 250);
  stroke(0 , 255, 0);
  fill(0 , 100 , 0);
  translate(width/2, height/2);
  rotateX(PI/3);
  translate(-w/2, -h/2);
  
  for (int y = 0 ; y < rows-1; y++){
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < cols; x++){
      vertex(x*scl, y*scl , terrain[x][y]);
      vertex(x*scl, (y+1)*scl , terrain[x][y+1]);
    }
    endShape();
  } 
}
