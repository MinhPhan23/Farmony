//load dimension
float left = -200;
float right = 200;
float top = -150;
float bottom = 150;
float mapX;
float mapY;

//load NPC size
float npcWidth;
float npcHeight;

//load Player

//load Garden assets
Map garden;
void loadGarden()
{
  garden.completeMap();
}

//load Desert Assets
Map desert;
float cowboyX;
float cowboyY;
NPC cowboy;
void loadDesert()
{
  cowboy = new NPC(cowboyX, cowboyX + npcWidth, cowboyY, cowboyY + npcHeight, loadImage(""), "data/CowboyMeeting.txt", "data/CowboyGoodbye.txt", "data/CowboyGeneric.txt" );
}

//load Wood Assets
Map wood;
float lumberX;
float lumberY;
NPC lumber;
void loadWood()
{
  lumber = new NPC(lumberX, lumberX + npcWidth, lumberY, lumberY + npcHeight, loadImage(""), "data/LumberMeeting.txt", "data/LumberGoodbye.txt", "data/LumberGeneric.txt" );
}

//load Sea Assets
Map sea;
float pirateX;
float pirateY;
NPC pirate;
void loadSea()
{
  pirate = new NPC(pirateX, pirateX + npcWidth, pirateY, pirateY + npcHeight, loadImage(""), "data/PirateMeeting.txt", "data/PirateGoodbye.txt", "data/PirateGeneric.txt" );
}

//load menuscreen
void loadMenu()
{
}
