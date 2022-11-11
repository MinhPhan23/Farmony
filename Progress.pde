int completeMap = 0;
boolean seedMessage = false;

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
  for (NPC npc : npcList) { // Draw NPCs
      if (npc.goodbyeState) {
        return false;
      }
  }
  return result;
}

void ending()
{
  if (checkFinish())
    garden.add(mom);
}
