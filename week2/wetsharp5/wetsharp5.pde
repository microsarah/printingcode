// ------------------------ canvas variables
PGraphics canvas;

int canvas_width = 5100;
int canvas_height = 7200;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

// ------------------------ sketch array
float[] vx = {0.42, 0.46, 0.48, 0.67, 0.71, 0.65, 0.57, 0.51, 0.47, 0.48, 0.42};
float[] vy = {0.15, 0.03, 0.06, 0.12, 0.18, 0.28, 0.32, 0.30, 0.25, 0.23, 0.25};


void setup()
{ 
  size(canvas_width / 8, canvas_height / 8);
  smooth();
  noStroke();

  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();

// ------------------------ sharp variable
  float numVertices = 11;
  
// ------------------------ wet variables
  float wetVertices = 100;
  float vertexDegree = 360 / wetVertices;
  float shapeRadius = canvas_width - 1000;
  float numCircles = 100;
  
// ------------------------ gray background
  fill(0, 0, 0, 1);
  rect(0, 0, canvas_width, canvas_height);


// ------------------------ begin canvas
  canvas.beginDraw();
     
// ------------------------ sharp 1
    canvas.beginShape();  
    canvas.smooth();
    canvas.noStroke();
    canvas.fill(0, 100); 
    
      for(int i = 0; i < numVertices; i++){
        canvas.vertex(vx[i] * (float) canvas_width - 200, vy[i] * (float) canvas_height + 200); // ----------- must use (float) because numVertices is an int
      }  
    canvas.endShape();
    
// ------------------------ sharp 2
    canvas.beginShape();  
    canvas.smooth();
    canvas.noStroke();
    canvas.fill(0, 100); 
    
      for(int i = 0; i < numVertices; i++){
        canvas.vertex(vx[i] * (float) canvas_width - 100, vy[i] * (float) canvas_height + 200); // ----------- must use (float) because numVertices is an int
      }  
    canvas.endShape();
    
// ------------------------ sharp 3
    canvas.beginShape();  
    canvas.smooth();
    canvas.noStroke();
    canvas.fill(0, 100); 
 
      for(int i = 0; i < numVertices; i++){
        canvas.vertex(vx[i] * (float) canvas_width, vy[i] * (float) canvas_height + 200); // ----------- must use (float) because numVertices is an int
      }  
    canvas.endShape(); 
    
// ------------------------ circles 
    canvas.translate(canvas_width / 2, canvas_height + 500);
    canvas.beginShape();  
    canvas.smooth();
    canvas.strokeWeight(150);
    canvas.stroke(0, 0, 0, 10); 
    canvas.noFill();
    
      for (int j = 0; j < numCircles; j++){
        
        for(int i = 0; i < wetVertices; i++){
          float x = cos(radians(i * vertexDegree)) * (shapeRadius / j);
          float y = sin(radians(i * vertexDegree)) * (shapeRadius / j);
          canvas.vertex(x, y);
        }
      }
    canvas.endShape();

  canvas.endDraw();


// ------------------------ resize canvas

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  canvas.save("sketch.tif");
}


// ------------------------ fit canvas to screen
void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else ratio = ratioHeight;
}
