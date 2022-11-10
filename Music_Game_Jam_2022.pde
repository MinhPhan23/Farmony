Map map1, map2, currmap;
ArrayList<Portal> portalList;
ArrayList<Interactable> objectList;
ArrayList<Seed> seedList;
Player player;
Interactable npc;
Seed seed1;
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
  seed1 = new Seed(20,50,20,50, loadImage("map/object/fragments1.png"),"seed1","test");
  map1.add(npc);
  map1.add(boiler1);
  map2.add(boiler2);
  map1.add(seed1);
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
  
  //seed1.spawnDialog();
  seedList = currmap.getSeed();
  for (Seed seed : seedList) {
    if (seed.getHitbox().collide(player)) {
      currmap.remove(seed);
      seed.setNarrate();
      
    }
    if(seed.getNarrate()){
      seed.spawnDialog();  
    }
    
  }
  
  objectList = currmap.getObject();
  for (Interactable object : objectList) { // Draw object(s)
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
