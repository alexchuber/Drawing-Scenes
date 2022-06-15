class Scene
{
  ArrayList<Mesh> meshes;
  ArrayList<Light> lights;
  color background;
  int meshcount;
  int lightcount;
  
  Scene(String file)
  {
    //Initializing meshes and lights container
    meshes = new ArrayList<Mesh>();
    lights = new ArrayList<Light>();
    
    //Filling meshes and lights container with data from provided file
    BufferedReader reader = createReader("scenes/"+file+".txt");
    String line;
    try
    {
      //Get background color
      line = reader.readLine();
      String[] back = split(line, ",");
      background = color(int(back[0]), int(back[1]), int(back[2]));
      
      //Get number of lines to parse for mesh data
      line = reader.readLine();
      meshcount = int(line);
      for(int i = 0; i < meshcount; i++)
      {
        //Read and interpret line of mesh data
        line = reader.readLine();
        String[] pieces = split(line, ",");
        PVector pos = new PVector(float(pieces[1]),float(pieces[2]),float(pieces[3]));
        color col = color(int(pieces[4]),int(pieces[5]),int(pieces[6]));
        Mesh mesh = new Mesh(pieces[0], pos, col);
        meshes.add(mesh);
      }
      
      //Get number of lines to parse for light data
      line = reader.readLine();
      lightcount = int(line);
      for(int j = 0; j < lightcount; j++)
      {
        //Read and interpret each line of light data
        line = reader.readLine();
        String[] pieces = split(line, ",");
        PVector pos = new PVector(float(pieces[0]),float(pieces[1]),float(pieces[2]));
        color col = color(int(pieces[3]),int(pieces[4]),int(pieces[5]));
        Light light = new Light(pos, col);
        lights.add(light);
      }
    }
    catch (IOException e)
    {
      e.printStackTrace();
      line = null;
    }
  }
  
  //Return number of meshes in scene
  int GetMeshCount()
  {
    return meshcount;
  }
  
  //Return number of lights in scene
  int GetLightCount()
  {
    return lightcount;
  }
  
  //Draws scene meshes to screen
  void Draw()
  {
    background(background);
    for(int i = 0; i < lightcount; i++)
    {
      lights.get(i).Draw();
    }
    for(int j = 0; j < meshcount; j++)
    {
      meshes.get(j).Draw();
    }
  }
}
