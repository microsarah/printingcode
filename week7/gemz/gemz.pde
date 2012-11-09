PImage img;

import toxi.geom.*;

PGraphics canvas;
int canvas_width = 2100;
int canvas_height = 2100;
float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

void setup() {
  size(620, 620);
 
  // ----------- load photo
  img = loadImage("lake.jpg");

  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();  

  // ----------- setup canvas
  canvas.beginDraw();
  canvas.smooth(8);
  canvas.background(#F0F8D0);
  canvas.fill(255);
  canvas.strokeJoin(BEVEL);
  canvas.stroke(255);
  canvas.strokeWeight(6);
  
    // ----------- draw photo
    canvas.image(img, 0, 0);

  // ----------- create 9 random points & store in Vec2D ArrayList
  int pointNum = 9;
  int pointWidth = canvas.width / pointNum;
  ArrayList<Vec2D> points = new ArrayList();

  // ----------- add the points to Vec2D ArrayList
  for (int i = 0; i < pointNum + 1; i++) {
    float x = i * pointWidth;
    float y = (canvas.height/2) + random(-300, (canvas.height/2)-50);
    Vec2D p = new Vec2D(x, y);
    points.add(p);
  }

  // ----------- retrieve the points fr ArrayList & create shapes from them
  canvas.beginShape();
  for (int i = 0; i < points.size(); i++) {
    Vec2D p = points.get(i);
        canvas.vertex(p.x, p.y);  
    canvas.vertex(100, 50);
        canvas.vertex(p.x, p.y);  
    canvas.vertex(canvas.width - 100, 50);
        canvas.vertex(p.x, p.y);  
    canvas.vertex(canvas.width/2, 200);
    canvas.vertex(p.x, p.y);
    canvas.vertex(p.x, p.y);    
  }
  canvas.endShape();
  canvas.endDraw();

  // ----------- resize offline canvas according to resize ratio
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  // ----------- draw offline canvas on sketch screen
  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

//  canvas.save("sketch.png");
    canvas.save("gemz"+hour()+minute()+second()+".png");
}

// ----------- math for resize ratio
void calculateResizeRatio() {
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

