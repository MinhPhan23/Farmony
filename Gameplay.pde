ArrayList<Portal> portalList;
ArrayList<Interactable> objectList;
ArrayList<Seed> seedList;
ArrayList<NPC> npcList;

boolean gameStart;

Player player;

void gameplay()
{
  if (!gameStart)
  {
    loadMenu();
  } else
  {
    camera(player.getPlayerX(), player.getPlayerY(), 2, player.getPlayerX(), player.getPlayerY(), 0, 0, 1, 0);
    player.movePlayer(currmap);

    currmap.drawMap();

    if (currmap.firstVisit() && currmap.isComplete())
    {
      //letter.setReading();
      currmap.readLetter(false);
    }

    if (letter.isReading() && !seedMessage)
      letter.read(currmap.getLetterPart());

    player.drawPlayer();

    portalList = currmap.getPortal();

    for (Portal portal : portalList) { // Draw portal(s)
      if (portal.getHitbox().collide(player))
      {
        if (currmap.firstVisit()) {
          currmap.readLetter(true);
        }
        currmap = portal.transition();
        player.setStart(currmap);
      }
    }

    seedList = currmap.getSeed();
    for (Seed seed : seedList) {
      if (!seed.isPicked() && seed.isUnlocked() && seed.getHitbox().collide(player)) { // pick up seed
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
    for (Interactable object : objectList) { // Draw portal(s)
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
    for (Interactable object : objectList) { // Draw object(s)
      object.getHitbox().collide(player);
    }

    if (checkNarration(seedList, npcList))
    {
      player.setStop(true);
    } else
      player.setStop(false);
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
