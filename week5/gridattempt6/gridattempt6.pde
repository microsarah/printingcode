//      fill(collins);

// ------------------------ canvas variables
PGraphics canvas;
int canvas_height = 5100;
int canvas_width = 3300;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

//boolean showGrid = false;

// ------------------------ main sketch will access modules via array and place things into them

void setup() { 
  size(canvas_width/6,canvas_height/6);
  colorMode(HSB);
  background(100);
  smooth();

  // ------------------------ create & resize canvas  
  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();

  // ------------------------ create object to define grid variables
  ModularGrid grid = new ModularGrid(30, 45, 0, 50);


  // ------------------------------------------------ CANVAS
  canvas.beginDraw();
  canvas.background(230);
  canvas.smooth(8);
  
      // ------------------------ top backdrop rectangles (half height)
      for(int r = 0; r < 30; r++){
        for(int c = 0; c < 1; c++){    
          canvas.noStroke();
          canvas.fill(random(25, 225), random(0, 225), random(0,255)); 
          canvas.rect(grid.modules[r][c].x, grid.modules[r][c].y, grid.moduleWidth, grid.moduleHeight/2);
        }
      }
      
      
      // ------------------------ middle backdrop rectangles (full height)
      for(int r = 0; r < 30; r++){
        for(int c = 0; c < 44; c++){          
            canvas.noStroke();
            canvas.fill(random(25, 225), random(0, 225), random(0,255)); 
            canvas.rect(grid.modules[r][c].x, (grid.modules[r][c].y + grid.moduleHeight/2), grid.moduleWidth, grid.moduleHeight);
        }
      }
      
      
      // ------------------------ bottom backdrop rectangles (half height)
      for(int r = 0; r < 30; r++){
        for(int c = 44; c < 45; c++){    
          canvas.noStroke();
          canvas.fill(random(25, 225), random(0, 225), random(0,255)); 
          canvas.rect(grid.modules[r][c].x, (grid.modules[r][c].y + grid.moduleHeight/2), grid.moduleWidth, grid.moduleHeight/2);
        }
      }     
      
      
      
      // ------------------------ arrows
      for(int r = 0; r < 30; r++){
        for(int c = 0; c < 45; c++){ 
            canvas.noStroke();
            canvas.fill(random(0, 225), random(0, 225), random(0,255)); 
            canvas.beginShape();
            canvas.vertex(grid.modules[r][c].x, grid.modules[r][c].y); // point 1
            canvas.vertex(grid.modules[r][c].x, (grid.modules[r][c].y + grid.moduleHeight/2)); // point 2
            canvas.vertex((grid.modules[r][c].x + grid.moduleWidth/2), (grid.modules[r][c].y + grid.moduleHeight)); // point 3
            canvas.vertex((grid.modules[r][c].x + grid.moduleWidth), (grid.modules[r][c].y + grid.moduleHeight/2)); // point 4
            canvas.vertex((grid.modules[r][c].x + grid.moduleWidth), grid.modules[r][c].y); // point 5
            canvas.vertex((grid.modules[r][c].x + grid.moduleWidth/2), (grid.modules[r][c].y + grid.moduleHeight/2)); // point 6
            canvas.endShape();         
         }
      }     



  // ------------------------ display grid
  //  if (showGrid){
//  grid.display();
  //  }

  canvas.endDraw();
  // ------------------------------------------------ CANVAS
                  

  // ------------------------ define resized canvas size
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  // ------------------------ draw canvas on screen & save PNG
  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

//  canvas.save("grid.png");
    canvas.save("grid"+hour()+minute()+second()+".png");

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

