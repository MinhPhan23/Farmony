Menu homeScreen; //<>// //<>//
Map map1, map2, currmap;
ArrayList<Portal> portalList;
ArrayList<Interactable> objectList;
ArrayList<Seed> seedList;
ArrayList<NPC> npcList;
Player player;
NPC npc;
Seed seed1;
Letter letter;
Portal boiler1, boiler2;
boolean hit;
boolean gameStart;

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

  // Create menu screen
  homeScreen = new Menu();
  gameStart = false;

  //create map
  map1 = new Map(loadImage("map/homefloor.jpg"), 100, 250, 70, 70);
  map2 = new Map(loadImage("map/townfloor.jpg"), 100, 250, 70, 70);
  currmap = map1;

  player = new Player(-50, -50);
  npc = new NPC(0, 12, 0, 34, loadImage("map/object/mom.png"), "data/LumberMeeting.txt", "data/LumberGoodbye.txt", "data/LumberGeneric.txt");
  boiler1 = new Portal(-50, -25, -50, -20, loadImage("map/object/boiler.png"), map2);
  boiler2 = new Portal(-50, -25, -50, -20, loadImage("map/object/boiler.png"), map1);
  seed1 = new Seed(20, 50, 20, 50, loadImage("map/object/fragments1.png"), "seed1", "Wow a seed");
  map1.add(npc);
  map1.add(boiler1);
  map2.add(boiler2);
  map2.add(new Seed(02, 50, 20, 50, loadImage("map/object/fragments1.png"), "seed2", "a seed in the forest, how fortuitous!"));
  map1.add(seed1);

  // Set the first letter
  letter = new Letter();
}

void draw()
{

  clear();
  ortho(-200, 200, -150, 150);
  camera(player.getPlayerX(), player.getPlayerY(), 2, player.getPlayerX(), player.getPlayerY(), 0, 0, 1, 0);

  if (!gameStart)
  {
    homeScreen.drawMenu(250, 250);
  } else
  {
    player.movePlayer(currmap);

    currmap.drawMap();

    if (currmap.firstVisit() && currmap.isComplete())
    {
      letter.setReading();
      currmap.readLetter(false);
    }

    if (letter.isReading() && !seedMessage)
      letter.read(currmap.getLetterPart());

    player.drawPlayer();

    portalList = currmap.getPortal();
    
    for (Portal portal : portalList) { // Draw portal(s)
      if (portal.getHitbox().collide(player))
      {
        currmap.readLetter(true);
        currmap = portal.transition();
        player.setStart(currmap);
      }
    }
    
    seedList = currmap.getSeed();
    for (Seed seed : seedList) {
      if (!seed.isPicked() && seed.getHitbox().collide(player)) { // pick up seed
        seed.pick();
        seed.setNarrate();
        seedMessage = true;
      }

      if (seed.getNarrate()) {
        seed.spawnDialog(); //<>//
      } else 
        seedMessage = false;
    }

    objectList = currmap.getObject();
    for (Interactable object : objectList) { // Draw portal(s)
      object.getHitbox().collide(player);
    }

    npcList = currmap.getNPC();
    for (NPC npc : npcList) {
      if (npc.getHitbox().collide(player)) { // talk to npc
        npc.setTalking();
        npc.setNarrate();
        player.setStop(true);
      }
      if (npc.isTalking())
      {
        npc.talking();
        if (keyPressed)
        {
          if (key == '1') npc.setInput(1);
          if (key == '2') npc.setInput(2);
          if (key == '3') npc.setInput(3);
        }
      } else
        player.setStop(false);
    }

    objectList = currmap.getObject();
    for (Interactable object : objectList) { // Draw object(s)
      object.getHitbox().collide(player);
    }
  }

  objectList = currmap.getObject();
  for (Interactable object : objectList) { // Draw object(s)
    object.getHitbox().collide(player);
  }
}

void keyPressed()
{
  if (!gameStart)
  {
    gameStart = true;
  } else
  {
    if (!player.getStop())
      player.detectMovement();
  }
}

void keyReleased()
{
  player.movementReleased();
}
