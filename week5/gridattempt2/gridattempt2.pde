// ------------------------ canvas variables
PGraphics canvas;

int canvas_width = 5100;
int canvas_height = 3300;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

boolean showGrid = false;

// ------------------------ main sketch will access modules via array and place things into them

void setup() {
  size(canvas_width / 4, canvas_height / 4);
  background(255);
  smooth();

  // ------------------------ create object to define grid variables
  ModularGrid grid = new ModularGrid(6, 4, 10, 50);  

  // ------------------------ create canvas  
  canvas = createGraphics(canvas_width, canvas_height);
  
   // ------------------------ resize canvas
  calculateResizeRatio();   
  

  // ------------------------------------------------ CANVAS
  canvas.beginDraw();
  canvas.smooth(8); 

  canvas.fill(0);
  canvas.ellipse(1000, 1000, 1000, 1000);
  // draw here!

  canvas.endDraw();
  // ------------------------------------------------ CANVAS
  

  // ------------------------ define resized canvas size
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  // ------------------------ draw canvas on screen & save PNG
  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);
  canvas.save("grid"+year()+day()+hour()+minute()+second()+".png");
  
  // ------------------------ display grid
//  if (showGrid){
    grid.display();
//  }
}


// ------------------------ resize canvas function
void calculateResizeRatio() {
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else ratio = ratioHeight;
}


void mousePressed() {
  showGrid = !showGrid;
}

