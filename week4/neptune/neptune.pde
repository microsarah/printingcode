import geomerative.*;

// ------------------------ canvas variables
PGraphics canvas;

int canvas_width = 5100;
int canvas_height = 3300;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

int fontSize = 600;


void setup() { 
  size(canvas_width / 4, canvas_height / 4);
  background(255);
  smooth(8);


  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();

  // ------------------------ begin canvas
  canvas.beginDraw();
  canvas.smooth(8); 

  // initialize the geomerative library 
  RG.init(this);

  // create a new font
  RFont font = new RFont("FreeSans.ttf", fontSize, RFont.LEFT);

  // tell library we want 11px between each point on the font path
  RCommand.setSegmentLength(10);
  
  // ------------------------------------------- NEPTUNE
  canvas.beginShape();
  canvas.stroke(0, 0, 136);
  canvas.strokeWeight(2);
  canvas.translate(550,1100);
  RGroup grp1;
  grp1 = font.toGroup("N E P T U N E");
  grp1 = grp1.toPolygonGroup();
  RPoint[] pnts1 = grp1.getPoints();

  for (int i = 0; i < (pnts1.length); i++ ) {
    canvas.rect(pnts1[i].x, pnts1[i].y,100,800);
  }  
  canvas.endShape();  


  canvas.endDraw();


  // ------------------------ resize canvas
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  canvas.save("neptune.png");
}


// ------------------------ fit canvas to screen
void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else ratio = ratioHeight;
}

