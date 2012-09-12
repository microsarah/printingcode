// create an offline canvas to draw on 
PGraphics canvas;

// size of the offline canvas (final image)
int canvas_width = 2480;
int canvas_height = 3508;

// scale down the screen canvas
float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

void setup()
{ 
  // size of the screen canvas
  size(620, 877);
  background(0);
  smooth();
//  noStroke();

  // build the canvas (P2D is 3D opt)
  canvas = createGraphics(canvas_width, canvas_height, P2D);

  // run the resize calculation
  calculateResizeRatio();

  // draw on offline canvas
  canvas.smooth();
  canvas.beginDraw();
  canvas.background(0);
  canvas.stroke(255);
  canvas.strokeWeight(2);
  canvas.fill(255,1);
  for (int i=0; i<2000; i=i+15){
    canvas.ellipse(1240, i+175, i, i);
  }

  canvas.endDraw();

  // resize the offline canvas according to the resize ratio
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  // draw the offline canvas on the screen canvas
  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  canvas.save("sketch.png");
}


// resize the offline canvas to be viewable on the screen canvas
void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}

