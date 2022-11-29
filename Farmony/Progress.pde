int completeMap = -1;
boolean seedMessage = false;
boolean finished = false;

//finish game
ArrayList<NPC> NPCList;
void makeNPCList()
{
  NPCList = new ArrayList<NPC>();
  NPCList.add(dad);
  NPCList.add(lumber);
  NPCList.add(cowboy);
  NPCList.add(pirate);
}

boolean checkFinish()
{
  boolean result = true;
  for (NPC npc : NPCList) { // Draw NPCs
      if (npc.goodbyeState) {
        return false;
      }
  }
  return result;
}

void ending()
{
  if (checkFinish())
  {
    garden.setMusic(gardenThemeComplete, 17.65);
    garden.add(mom);
    garden.add(bambooTree);
    garden.add(buglossTree);
    garden.add(cactusTree);
    garden.add(grapeTree);
    garden.add(helleboreTree);
    garden.add(hydrangeaTree);
    garden.add(mandrakeTree);
    garden.add(mapleTree);
    garden.add(poinsettiaTree);
  }
}
