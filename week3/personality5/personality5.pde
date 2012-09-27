import toxi.color.*;
import toxi.color.theory.*;
import toxi.util.datatypes.*;

// ------------------------ canvas variables
PGraphics canvas;

int canvas_width = 5100;
int canvas_height = 7200;

float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

// ------------------------ sketch arrays

float[] x1 = {750, 1000, 690, 550, 750,    // shape 1
              1000, 1500, 690, 1000,       // shape 2
              1095, 3780, 1800, 1095,      // shape 3
              1500, 1560, 380, 550, 1500,  // shape 4
              380, 810, 830, 240, 380,     // shape 5
              810, 1560, 1800, 830, 810};  // shape6
              
float[] x2 = {240, 1505, 1230, 240,        // shape 7
              240, 1800, 1505, 240,        // shape 8
              1800, 2660, 1310, 1800,      // shape 9
              1800, 3780, 2500, 1800,      // shape 10
              1310, 1410, 1980, 1160, 1310,  // shape 11
              1410, 1510, 2330, 1980, 1410}; // shape 12
              
float[] x3 = {1510, 2650, 2500, 3780, 3000, 1510, // shape 13
              3780, 4680, 3310, 3780,             // shape 14
              1160, 1980, 1770, 1160,             // shape 15
              1980, 2325, 3000, 1980,             // shape 16
              3000, 3310, 4680, 3000,             // shape 17
              1770, 1980, 3000, 1770};            // shape 18
              
float[] x4 = {1980, 3000, 3000, 1980,             // shape 19
              3000, 4200, 3000, 3000,             // shape 20
              3000, 4500, 4200, 3000,             // shape 21
              3000, 4680, 4500, 3000,             // shape 22
              3000, 4200, 1770, 3000};            // shape 23
          
        
float[] y1 = {400, 750, 1400, 1400, 400,    // shape 1
              750, 1430, 1400, 750,         // shape 2
              880, 2480, 1850, 880,         // shape 3
              1430, 1520, 2260, 1390, 1430, // shape 4
              2260, 1990, 2505, 2900, 2260, // shape 5
              1990, 1520, 1850, 2505, 1990}; // shape 6
              
float[] y2 = {2900, 3100, 4310, 2900,        // shape 7
              2900, 1850, 3100, 2900,        // shape 8
              1850, 3250, 3910, 1850,        // shape 9
              1850, 2480, 3000, 1850,        // shape 10
              3910, 3860, 4800, 4610, 3910,  // shape 11
              3860, 3810, 3970, 4800, 3860}; // shape 12
              
float[] y3 = {3810, 3250, 3000, 2480, 4110, 3815,  // shape 13
              2480, 3480, 3460, 2480,              // shape 14
              4610, 4800, 5800, 4610,              // shape 15
              4800, 3975, 4110, 4800,              // shape 16  
              4110, 3457, 3480, 4110,              // shape 17
              5800, 4800, 5150, 5800};             // shape 18
              
float[] y4 = {4800, 4110, 5150, 4800,    // shape 19
              4110, 6110, 5150, 4110,    // shape 20
              4100, 4710, 6110, 4110,    // shape 21
              4110, 3480, 4710, 4110,    // shape 22
              5150, 6110, 5800, 5150};   // shape 23
          
              
void setup()
{ 
  size(canvas_width / 8, canvas_height / 8);
  smooth(8);
  noStroke();

  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();

// ------------------------ begin canvas
  canvas.beginDraw();
 
    canvas.background(255);
    canvas.noStroke(); 
    canvas.smooth(8); 
    canvas.colorMode(HSB, 1, 1, 1);
  
// ------------------------ quarter one
  FloatRange h1 = new FloatRange(0.1, 0.8);
  FloatRange s1 = new FloatRange(0.3, 0.8);
  FloatRange b1 = new FloatRange(0.75, 1);
  ColorRange range1 = new ColorRange(h1, s1, b1, "quarter one");
  
// ------------------------ quarter two
  FloatRange h2 = new FloatRange(0.1, 0.8);
  FloatRange s2 = new FloatRange(0.3, 0.8);
  FloatRange b2 = new FloatRange(0.5, 0.75);
  ColorRange range2 = new ColorRange(h2, s2, b2, "quarter two");
  
// ------------------------ quarter three
  FloatRange h3 = new FloatRange(0.1, 0.8);
  FloatRange s3 = new FloatRange(0.3, 0.8);
  FloatRange b3 = new FloatRange(0.25, 0.5);
  ColorRange range3 = new ColorRange(h3, s3, b3, "quarter three");
  
// ------------------------ quarter four
  FloatRange h4 = new FloatRange(0.1, 0.8);
  FloatRange s4 = new FloatRange(0.3, 0.8);
  FloatRange b4 = new FloatRange(0, 0.25);
  ColorRange range4 = new ColorRange(h4, s4, b4, "quarter four");
  
    
// ------------------------------------------------ first quarter     

// ------------------------ shape 1 - 5  
    canvas.beginShape();   
       for(int i = 0; i < 5; i++){
        TColor ranColor = range1.getColor(); 
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
        canvas.vertex(x1[i], y1[i]);  
       }  
    canvas.endShape();
  

// ------------------------ shape 2 - 4  
    canvas.beginShape();   
      for(int i = 5; i < 9; i++){
        TColor ranColor = range1.getColor(); 
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
        canvas.vertex(x1[i], y1[i]);        
      }      
    canvas.endShape();

// ------------------------ shape 3 - 4  
    canvas.beginShape();   
      for(int i = 9; i < 13; i++){
        TColor ranColor = range1.getColor(); 
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness());  
        canvas.vertex(x1[i], y1[i]);
      }      
    canvas.endShape();

// ------------------------ shape 4 - 5  
    canvas.beginShape();   
      for(int i = 13; i < 18; i++){
        TColor ranColor = range1.getColor(); 
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
        canvas.vertex(x1[i], y1[i]);    
      }      
    canvas.endShape();

// ------------------------ shape 5 - 5  
    canvas.beginShape();   
      for(int i = 18; i < 23; i++){
        TColor ranColor = range1.getColor(); 
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
        canvas.vertex(x1[i], y1[i]);    
      }      
    canvas.endShape();

// ------------------------ shape 6 - 5  
    canvas.beginShape();   
      for(int i = 23; i < 28; i++){
        TColor ranColor = range1.getColor(); 
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
        canvas.vertex(x1[i], y1[i]);
      }      
    canvas.endShape();
    
// ------------------------------------------------ second quarter     

// ------------------------ shape 7 - 4  
    canvas.beginShape();   
      for(int i = 0; i < 4; i++){
        TColor ranColor = range2.getColor(); 
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
        canvas.vertex(x2[i], y2[i]);
      }      
    canvas.endShape();

// ------------------------ shape 8 - 4  
    canvas.beginShape();   
      for(int i = 4; i < 8; i++){
         TColor ranColor = range2.getColor(); 
         canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
         canvas.vertex(x2[i], y2[i]);
      }      
    canvas.endShape();

// ------------------------ shape 9 - 4  
    canvas.beginShape();   
      for(int i = 8; i < 12; i++){
        TColor ranColor = range2.getColor(); 
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
        canvas.vertex(x2[i], y2[i]);
      }      
    canvas.endShape();
    
// ------------------------ shape 10 - 4  
    canvas.beginShape();   
      for(int i = 12; i < 16; i++){
        TColor ranColor = range2.getColor(); 
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
        canvas.vertex(x2[i], y2[i]);
      }      
    canvas.endShape();    
 
// ------------------------ shape 11 - 5
    canvas.beginShape();   
      for(int i = 16; i < 21; i++){
        TColor ranColor = range2.getColor(); 
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
        canvas.vertex(x2[i], y2[i]);
      }      
    canvas.endShape();    

// ------------------------ shape 12 - 5
    canvas.beginShape();   
      for(int i = 21; i < 26; i++){
        TColor ranColor = range2.getColor(); 
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
        canvas.vertex(x2[i], y2[i]);
      }      
    canvas.endShape();    

// ------------------------------------------------ third quarter  

// ------------------------ shape 13 - 6
    canvas.beginShape();   
      for(int i = 0; i < 6; i++){
         TColor ranColor = range3.getColor(); 
         canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
         canvas.vertex(x3[i], y3[i]);
      }      
    canvas.endShape();  

// ------------------------ shape 14 - 4
    canvas.beginShape();   
      for(int i = 6; i < 10; i++){
        TColor ranColor = range3.getColor(); 
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
        canvas.vertex(x3[i], y3[i]);
      }      
    canvas.endShape();  

// ------------------------ shape 15 - 4
    canvas.beginShape();   
      for(int i = 10; i < 14; i++){
        TColor ranColor = range3.getColor(); 
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
        canvas.vertex(x3[i], y3[i]);
      }      
    canvas.endShape();  

// ------------------------ shape 16 - 4
    canvas.beginShape();   
      for(int i = 14; i < 18; i++){
        TColor ranColor = range3.getColor(); 
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
        canvas.vertex(x3[i], y3[i]);
      }      
    canvas.endShape();  

// ------------------------ shape 17 - 4
    canvas.beginShape();   
      for(int i = 18; i < 22; i++){
        TColor ranColor = range3.getColor(); 
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
        canvas.vertex(x3[i], y3[i]);
      }      
    canvas.endShape();  
    
// ------------------------ shape 18 - 4
    canvas.beginShape();   
      for(int i = 22; i < 26; i++){
        TColor ranColor = range3.getColor(); 
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
        canvas.vertex(x3[i], y3[i]);
      }      
    canvas.endShape();  

// ------------------------------------------------ fourth quarter  

// ------------------------ shape 19 - 4
    canvas.beginShape();   
      for(int i = 0; i < 4; i++){
        TColor ranColor = range4.getColor(); 
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
        canvas.vertex(x4[i], y4[i]);
      }      
    canvas.endShape();  

// ------------------------ shape 20 - 4
    canvas.beginShape();   
      for(int i = 4; i < 8; i++){
        TColor ranColor = range4.getColor(); 
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
        canvas.vertex(x4[i], y4[i]);
      }      
    canvas.endShape();  

// ------------------------ shape 21 - 4
    canvas.beginShape();   
      for(int i = 8; i < 12; i++){
        TColor ranColor = range4.getColor(); 
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
        canvas.vertex(x4[i], y4[i]);
      }      
    canvas.endShape();  

// ------------------------ shape 22 - 4
    canvas.beginShape();   
      for(int i = 12; i < 16; i++){
        TColor ranColor = range4.getColor(); 
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
        canvas.vertex(x4[i], y4[i]);
      }      
    canvas.endShape();  

// ------------------------ shape 23 - 4
    canvas.beginShape();   
      for(int i = 16; i < 20; i++){
        TColor ranColor = range4.getColor(); 
        canvas.fill(ranColor.hue(), ranColor.saturation(), ranColor.brightness()); 
        canvas.vertex(x4[i], y4[i]);
      }      
    canvas.endShape();  

  canvas.endDraw();


// ------------------------ resize canvas

  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  canvas.save("personality"+year()+day()+hour()+minute()+second()+".png");
}


// ------------------------ fit canvas to screen
void calculateResizeRatio()
{
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else ratio = ratioHeight;
}
