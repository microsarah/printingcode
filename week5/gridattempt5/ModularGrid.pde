// ----------------------------- determines width, height, no. of columns, no. of rows (modules), page margines, gutter size, 2D array + displays
//modules are a 2D array incl columns & rows so each can be accessed

class ModularGrid {
  
  int cols;
  int rows;
  float gutterSize;
  float pageMargin;

  // ------------------------ create an array called 'modules' within the Module class
  Module [][] modules;
  float moduleWidth;
  float moduleHeight;


  // ------------------------ create a constructor that requires 4 arguments
  ModularGrid (int _cols, int _rows, float _gutterSize, float _pageMargin) {
    cols = _cols;
    rows = _rows;
    gutterSize = _gutterSize;
    pageMargin = _pageMargin;

    // ------------------------ construct the array with arguments
    modules = new Module [cols][rows];

    // ----------------------------- define math for module width 
    // the width of our grid is the width of the canvas - the left & right page margins (here, equal)
    float gridWidth = ((float) width - (pageMargin * 2));
    // the total width of our gutter is the width of each gutter * how many gutters (always 1 less than # of columns)
    float totalGutterWidth = gutterSize * (cols -1);
    moduleWidth = (gridWidth - totalGutterWidth) / (float) cols;

    // ----------------------------- define math for module height 
    // the height of our grid is the height of the canvas - the top & bottom page margins (here, equal)
    float gridHeight = ((float) height - (pageMargin * 2));
    // the total height of our gutters is the height of each gutter * how many gutters (always 1 less than # of rows)
    float totalGutterHeight = gutterSize * (rows -1);
    moduleHeight = (gridHeight - totalGutterHeight) / (float) rows;
    
    
//        // get module #s
//    println("module width = " + moduleWidth);
//    println("module height = " + moduleHeight);
    

    // ----------------------------- place the modules into a 2D array
    for (int i = 0; i < cols; i++) {

      for (int j = 0; j < rows; j++) {

        // create the array from the Module class & define the arguments the class requires
        modules [i][j] = new Module();
        modules [i][j].x = pageMargin + (i * moduleWidth) + (i * gutterSize);
        modules [i][j].y = pageMargin + (j * moduleHeight) + (j * gutterSize);
        modules [i][j].w = moduleWidth;
        modules [i][j].h = moduleHeight;
      }
    } 
  }


  // ----------------------------- display the grid!
  void display() {

    noFill();
    stroke(255, 0, 0);

    // draw in the page margins
    rect(pageMargin, pageMargin, width - (2*pageMargin), height - (2*pageMargin));

    // draw in the modules
    for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        rect(modules[i][j].x, modules[i][j].y, modules[i][j].w, modules[i][j].h);
      }
    }
  }
}
