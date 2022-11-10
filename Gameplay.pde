void gameplay()
{
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
