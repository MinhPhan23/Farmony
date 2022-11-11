Map map1, map2, currmap;
NPC npc;
Seed seed1;
Letter letter;
Portal boiler1, boiler2;

import com.jogamp.opengl.GLProfile;
{
  GLProfile.initSingleton();
}

void setup()
{
  size(800, 600, P3D);
  colorMode(RGB, 1.0f);
  textureMode(NORMAL);
  textureWrap(CLAMP);
  noStroke();
  
  //loadMap
  loadAsset();

  // Create menu screen
  homeScreen = new Menu();
  gameStart = false;

  //create map
  currmap = desert;

  player = new Player(-50, -50);
  seed1 = new Seed(20, 50, 20, 50, loadImage("map/object/fragments1.png"), "seed1", "Wow a seed");
  currmap.add(seed1);

  // Set the first letter
  letter = new Letter();
}

void draw()
{
  clear();
  ortho(-200, 200, -150, 150);
  camera(player.getPlayerX(), player.getPlayerY(), 2, player.getPlayerX(), player.getPlayerY(), 0, 0, 1, 0);
  gameplay();
}
