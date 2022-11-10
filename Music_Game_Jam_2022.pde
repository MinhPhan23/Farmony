Menu homeScreen;
Map map1, map2, currmap;
ArrayList<Portal> portalList;
ArrayList<Interactable> objectList;
ArrayList<Seed> seedList;
ArrayList<NPC> npcList;
Player player;
NPC npc;
Seed seed1;
Letter currLetter;
int lettersRead = 0;
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

  player = new Player(0, 0);
  npc = new NPC(0, 12, 0, 34, loadImage("map/object/mom.png"), "Mom", "\"The journey of a thousand miles begins with a single step.\" I always liked that phrase. You've taken the first one, my darling, and I know how that is often the hardest. There's no one else I'd rather your father have there for him.");
  boiler1 = new Portal(-50, -25, -50, -20, loadImage("map/object/boiler.png"), map2);
  boiler2 = new Portal(-50, -25, -50, -20, loadImage("map/object/boiler.png"), map1);
  seed1 = new Seed(20, 50, 20, 50, loadImage("map/object/fragments1.png"), "seed1", "Do you remember when I brought you out with me, all those years ago? One of the few times I managed to drag you from your father's study and his songs? You made a whistle out of a blade of grass and played that instead. You're so like him, and I love you for it. I'm glad you're changing now, stepping out of your comfort zone. But don't change too much. Keep doing what makes you who you are.");
  map1.add(npc);
  map1.add(boiler1);
  map2.add(boiler2);
  map2.add(new Seed(02,50,20,50, loadImage("map/object/fragments1.png"), "seed2", "a seed in the forest, how fortuitous!"));
  map1.add(seed1);

  // Set the first letter
  currLetter = new Letter();
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

    player.drawPlayer();
    
    portalList = currmap.getPortal();
    
    Map prev = null;
    
    for (Portal portal : portalList) { // Draw portal(s)
      if (portal.getHitbox().collide(player))
      {

        // Save the previous map and get new map
        prev = currmap;
        currmap = portal.transition();
        player.setStart(currmap);
        
        

        //if (currLetter.isReading())
        //{
        //  currLetter.read(lettersRead);
        //  lettersRead++;
        //  prev.complete();
        //}
      }
    }
    // Print the letter upon first completion of map (exluding home map)
    
    //currLetter.read(lettersRead);
    if(prev != null){
      if (currmap == map1 && prev.firstCompletion()){
        println("reading letters");
        
        //prev.readLetter();
      } 
    }
    
    
    seedList = currmap.getSeed();
    for (Seed seed : seedList) {
      if (!seed.isPicked() && seed.getHitbox().collide(player)) { // pick up seed
        seed.pick();
        seed.setNarrate();
      }

      if (seed.getNarrate()) {
        seed.spawnDialog();
      }

      objectList = currmap.getObject();
      for (Interactable object : objectList) { // Draw portal(s)
        object.getHitbox().collide(player);
      }

      npcList = currmap.getNPC();
      for (NPC npc : npcList) {
        if (npc.getHitbox().collide(player)) { // talk to npc
          npc.setNarrate();
        }
        if (npc.getNarrate()) {
          npc.spawnDialog();
        }
      }

      objectList = currmap.getObject();
      for (Interactable object : objectList) { // Draw object(s)
        object.getHitbox().collide(player);
      }
    }
  }
}

void keyPressed()
{
  if (!gameStart)
  {
    gameStart = true;
  } else
  {
    player.detectMovement();
  }
}

void keyReleased()
{
  player.movementReleased();
}
