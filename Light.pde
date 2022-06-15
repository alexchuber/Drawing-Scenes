class Light
{
  PVector p;
  color c;
  
  //Constructor
  Light(PVector pos, color col)
  {
    p = pos;
    c = col;
  }
  
  //Renders a point light for scene
  void Draw()
  {
    pointLight(red(c), green(c), blue(c), p.x, p.y, p.z);
  }
}
