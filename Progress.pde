int completeMap = 0;
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
    garden.add(mom);
}
