// ------------------------ canvas variables
PGraphics canvas;
int canvas_width = 3300;
int canvas_height = 5100;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

//boolean showGrid = false;

// ------------------------ main sketch will access modules via array and place things into them

void setup() {
  size(canvas_width / 6, canvas_height / 6);
  background(255);
  smooth();

  // ------------------------ create & resize canvas  
  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio(); 

  // ------------------------ create object to define grid variables
  ModularGrid grid = new ModularGrid(8, 13, 0, 50);  


  // ------------------------------------------------ CANVAS
  canvas.beginDraw();
  canvas.background(255);
  canvas.smooth(8);


  Module startModule = grid.modules[0][0];



  canvas.fill(0);
  canvas.ellipse(startModule.x, startModule.y, 200, 200);

  //  canvas.save("grid"+year()+day()+hour()+minute()+second()+".png");
  canvas.endDraw();
  // ------------------------------------------------ CANVAS


  // ------------------------ define resized canvas size
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  // ------------------------ draw canvas on screen & save PNG
  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  canvas.save("grid.png");

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


//void mousePressed() {
//  showGrid = !showGrid;
//}

