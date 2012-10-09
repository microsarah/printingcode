// ----------------------------- allows dimensions of module to be modular

// create a class with 4 floats
class Module {
  float x;
  float y;
  float w;
  float h;
  
  //create an empty constructor that doesn't require arguments
  Module () {}

  // create a constructor that requires 4 arguments
  // use these arguments in the main sketch when creating a module
  // need to use _ bc we can't use the same variable twice in a class
  Module (float _x, float _y, float _w, float _h) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
  }
}
