class Mesh
{
  PShape m;
  PVector p;
  
  //Constructor
  Mesh(String file, PVector pos, color col)
  {
     m = loadShape("models/"+file+".obj");
     m.setFill(col);
     p = pos;
  }
  
  //Draws mesh to scene
  void Draw()
  {
    pushMatrix();
    translate(p.x, p.y, p.z);
    shape(m);
    popMatrix();
  }
}
