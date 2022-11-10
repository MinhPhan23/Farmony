void gameplay()
{
  if (!gameStart)
  {
    homeScreen.drawMenu(250, 250);
  } else
  {
    player.movePlayer(currmap);
    player.drawPlayer();
    currmap.drawMap();

    if (currmap.firstVisit() && currmap.isComplete())
    {
      letter.setReading();
      currmap.readLetter(false);
    }

    if (letter.isReading() && !seedMessage)
      letter.read(currmap.getLetterPart());
      
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
