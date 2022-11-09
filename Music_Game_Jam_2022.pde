Map map1, map2, currmap;
ArrayList<Portal> portalList;
ArrayList<Interactable> objectList;
ArrayList<Seed> seedList;
Player player;
Interactable npc;
Portal boiler1, boiler2;
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
  map1 = new Map(loadImage("map/homefloor.jpg"), 100, 250, 70, 70);
  map2 = new Map(loadImage("map/townfloor.jpg"), 100, 250, 70, 70);
  currmap = map1;

  player = new Player(0, 0);
  npc = new Interactable(0, 12, 0, 34, loadImage("map/object/mom.png"));
  boiler1 = new Portal(-50, -25, -50, -20, loadImage("map/object/boiler.png"), map2);
  boiler2 = new Portal(-50, -25, -50, -20, loadImage("map/object/boiler.png"), map1);
  map1.add(npc);
  map1.add(boiler1);
  map2.add(boiler2);
}

void draw()
{
  
  clear();
  ortho(-200, 200, -150, 150);
  camera(player.getPlayerX(), player.getPlayerY(), 2, player.getPlayerX(), player.getPlayerY(), 0, 0, 1, 0);
  
  player.movePlayer(currmap);
  
  currmap.drawMap();
 
  player.drawPlayer();


  portalList = currmap.getPortal();
  for (Portal portal : portalList) { // Draw portal(s)
    if (portal.getHitbox().collide(player))
    {
      currmap = portal.transition();
      player.setStart(currmap);
    }
  }

  seedList = currmap.getSeed();
  for (Seed seed : seedList) {
    if (seed.getHitbox().collide(player)) {
      currmap.remove(seed);
      seed.spawnDialog();
    }
  }

  objectList = currmap.getObject();
  for (Interactable object : objectList) { // Draw portal(s)
    object.getHitbox().collide(player);
  }
}

void keyPressed()
{
  player.detectMovement();
}

void keyReleased()
{
  player.movementReleased();
}
