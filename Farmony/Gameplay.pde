ArrayList<Portal> portalList;
ArrayList<Interactable> objectList;
ArrayList<Seed> seedList;
ArrayList<NPC> npcList;

boolean gameStart;
boolean firstCue = true;

Player player;

void gameplay()
{
  if (!gameStart)
  {
    loadMenu();
    if(!menuTheme.isPlaying()){
      menuTheme.play();
    }
  } else
  {
    if (!finished)
    {
      if (checkFinish())
      {
        finished = true;
        ending();
      }
    }
    camera(player.getPlayerX(), player.getPlayerY(), 2, player.getPlayerX(), player.getPlayerY(), 0, 0, 1, 0);
    player.movePlayer(currmap);

    currmap.drawMap();

    if (prevmap.firstVisit() && prevmap.isComplete())
    {
      letter.setReading();
      prevmap.setfirstVisit(false);
    }

    if (letter.isReading() && !seedMessage)
    {
      letter.read(completeMap);
    }

    player.drawPlayer();

    portalList = currmap.getPortal();

    for (Portal portal : portalList) { 
      if (portal.getHitbox().collide(player))
      {
        prevmap = currmap;
        currmap.getMusic().stop();
        currmap = portal.transition();
        player.setStart(currmap);
        firstCue = true;

        if (currmap.firstVisit()) {
          currmap.setfirstVisit(true);
        }
      }
    }

    seedList = currmap.getSeed();
    for (Seed seed : seedList) {
      if (!seed.isPicked() && seed.isUnlocked() && seed.getHitbox().collide(player)) { 
        seed.pick();
        seed.setNarrate();
        seedMessage = true;
      }

      if (seed.getNarrate()) {
        seed.spawnDialog();
      } else
        seedMessage = false;
    }

    objectList = currmap.getObject();
    for (Interactable object : objectList) { 
      object.getHitbox().collide(player);
    }

    npcList = currmap.getNPC();
    for (NPC npc : npcList) {
      if (npc.getHitbox().collide(player)) { // talk to npc
        npc.setTalking();
        npc.setNarrate();
        for (Seed seed : seedList) {
          if (!seed.isUnlocked())
            seed.unlock();
        }
      }
      if (npc.isTalking())
      {
        if (keyPressed)
        {
          if (key == '1') npc.setInput(1);
          if (key == '2') npc.setInput(2);
          if (key == '3') npc.setInput(3);
        }
        npc.talking();
      }
    }

    objectList = currmap.getObject();
    for (Interactable object : objectList) { 
      object.getHitbox().collide(player);
    }

    if (checkNarration(seedList, npcList))
    {
      player.setStop(true);
    } else
      player.setStop(false);


    // Play map theme
    if(!currmap.getMusic().isPlaying() && firstCue){
      currmap.getMusic().play();
      currmap.getMusic().jump(0);
      firstCue = false;
    }
    else if(!currmap.getMusic().isPlaying()){
      // Loops the theme
      currmap.getMusic().play();
      currmap.getMusic().jump(currmap.getLoopEntry());
    }
  }
}

boolean checkNarration(ArrayList<Seed> seedList, ArrayList<NPC> npcList)
{
  for (Seed seed : seedList) {
    if (seed.getNarrate()) return true;
  }
  for (NPC npc : npcList) {
    if (npc.isTalking()) return true;
  }
  if (letter.isReading()) return true;
  return false;
}

void keyPressed()
{
  if (!gameStart)
  {
    gameStart = true;
    menuTheme.stop();
  } else
  {
    if (!player.getStop()){
      player.detectMovement();
    }
  }

  // Skip to ending cheat
  if (key == CODED){
    if (key == '|'){
      finished = true;
      ending();
    }
  }
}

void keyReleased()
{
  player.movementReleased();
}
