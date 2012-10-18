// ------------------------ canvas variables
PGraphics canvas;

int fontSize = 800;
String[] fontList;
PFont myfont;

int canvas_width = 5100;
int canvas_height = 3300;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

void setup() { 
  size(canvas_width / 4, canvas_height / 4);
  background(255);
  smooth(8);
  
  fontList = PFont.list();

  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();

  // ------------------------ begin canvas
  canvas.beginDraw();
  
  canvas.background(255);
  canvas.smooth(8); 
  canvas.noStroke();
  canvas.textAlign(CENTER);


  // ------------------------------------------------- LEFT H
  canvas.translate(canvas.width/2 - fontSize/2, canvas.height/2);  
  canvas.fill(40);
  for(int i = 0; i < 1; i++){
    int r = int (random(0,fontList.length));
    myfont = createFont(fontList[r], fontSize);
    canvas.textFont(myfont);
    canvas.text("H", 0, 0);
  }
  
  canvas.fill(255);
  for(int i = 0; i < 1; i++){
    int r = int (random(0,fontList.length));
    myfont = createFont(fontList[r], fontSize+20);
    canvas.textFont(myfont);
    canvas.text("H", 0, 0);
  }  

  // ------------------------------------------------- RIGHT H
  canvas.fill(40);
  for(int i = 0; i < 1; i++){
    int r = int (random(0,fontList.length));
    myfont = createFont(fontList[r], fontSize);
    canvas.textFont(myfont);
    canvas.text("H", canvas.width/10, 0);
  }
  
  canvas.fill(255);
  for(int i = 0; i < 1; i++){
    int r = int (random(0,fontList.length));
    myfont = createFont(fontList[r], fontSize+20);
    canvas.textFont(myfont);
    canvas.text("H", canvas.width/10, 0);
  }  


  canvas.endDraw();
  


  // ------------------------ resize canvas
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

//  canvas.save("hh.png");
  canvas.save("hh" + hour() + minute() + second() + ".png");
}


// ------------------------ fit canvas to screen
void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else ratio = ratioHeight;
}

