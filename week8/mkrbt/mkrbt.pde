// ----------- canvas variables
PGraphics canvas;
int canvas_width = 5100;
int canvas_height = 3300;
float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

// ----------- pattern variables
int maxLevel = 0;
int startSize = 0;

void setup() {
  size(canvas_width/6, canvas_height/6);
  colorMode(HSB);
  background(100);
  smooth();

  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();  

  // ----------- setup canvas
  canvas.beginDraw();
  canvas.smooth(8);
  canvas.background(#F0F8D0);
  canvas.noStroke();

  // draw single shape
  maxLevel = 1;
  startSize = 600;
  canvas.translate(canvas.width/2, canvas.height/2);
//  drawAngle(0, 0, startSize, 0, 0, color(#e9fe37));
  
  // fill the entire thing
  maxLevel = 2;
  startSize = 600;
  canvas.translate(-1700, -850);
  drawAngle(0, 0, 1700, 0, 0, color(#e9fe37));  
  canvas.translate(-850, -850);
  drawAngle(0, 0, 1700, 0, 0, color(#e9fe37));  
  canvas.translate(0, -850);
  drawAngle(0, 0, 1700, 0, 0, color(#e9fe37));  
  
  }
  

void drawAngle(float x, float y, float angle, float rot, int level, int col){
  canvas.pushMatrix();
  canvas.translate(x, y);
  canvas.rotate(radians(rot));
  canvas.fill(col);
  canvas.beginShape();
  canvas.vertex(0, 0);
  canvas.vertex(angle/2, -angle);
  canvas.vertex(angle/2, angle);
  canvas.vertex(0, angle * 2);
  canvas.endShape(CLOSE);
  
  if(level < maxLevel){
    level++;
    drawAngle(angle/4, -angle/2, angle/2, 0, level, color(#92f739, 100));
    drawAngle(angle/2, 0, angle/2, 45, level, color(#01daa9, 80));
    drawAngle(0, angle/2, angle/2, 0, level, color(#f54f52, 255));
    drawAngle(angle/2, angle, angle/2, -45, level, color(#988e8a, 70));
  }

  canvas.popMatrix();
  canvas.endDraw();

  // ----------- resize offline canvas according to resize ratio
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  // ----------- draw offline canvas on sketch screen
  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

//  canvas.save("sketch.png");
    canvas.save("mrkbt"+hour()+minute()+".png");
//    canvas.save("mrkbt"+hour()+minute()+second()+".png");
}


// ----------- math for resize ratio
void calculateResizeRatio() {
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

