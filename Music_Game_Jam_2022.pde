Map map1, map2, currmap;
Player player;
Interactable npc;
boolean hit;

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
  map1 = new Map(loadImage("map/homefloor.jpg"), 100, 250, 0, 0);
  map2 = new Map(loadImage("map/townfloor.jpg"), 100, 250, 0, 0);
  currmap = map1;
  player = new Player(50, 50);
  npc = new Interactable(0, 12, 0, 34, loadImage("map/object/mom.png"));
  map1.add(npc);
}

void draw()
{
  clear();
  ortho(-200, 200, -150, 150);
  camera(player.getPlayerX(), player.getPlayerY(), 2, player.getPlayerX(), player.getPlayerY(), 0, 0, 1, 0);
  player.movePlayer(map1);
  
  player.drawPlayer();
  currmap.drawMap();
  
  
  hit = player.getHitbox().collide(npc.getHitbox());
  println(player.getPlayerX()-6.5," ", player.getPlayerX()+6.5," ", player.getPlayerY()-17, " ", player.getPlayerY());
  println(npc.left, " ", npc.right, " ", npc.top, " ", npc.bottom);
  println(hit);
}

void keyPressed()
{
  player.detectMovement();
}

void keyReleased()
{
  player.movementReleased();
}
