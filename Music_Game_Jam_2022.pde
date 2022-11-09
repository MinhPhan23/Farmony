Map map1, map2, currmap;
Player player;

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

  //create map
  map1 = new Map(loadImage("map/homefloor.jpg"), 100, 250);
  map2 = new Map(loadImage("map/townfloor.jpg"), 100, 250);
  currmap = map1;
  player = new Player(0, 0);
}

void draw()
{
  clear();
  ortho(-200, 200, -150, 150);
  camera(player.getPlayerX(), player.getPlayerY(), 2, player.getPlayerX(), player.getPlayerY(), 0, 0, 1, 0);
  currmap.drawMap();
  player.drawPlayer();
  
  player.movePlayer(map1);
  
  println(player.getPlayerX()," ",player.getPlayerY());
  println(currmap);
}

void keyPressed()
{
  player.detectMovement();
}

void keyReleased()
{
  player.movementReleased();
}
