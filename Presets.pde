//load dimension
float left = -200;
float right = 200;
float top = -150;
float bottom = 150;
float mapX;
float mapY;

//load NPC size
float npcWidth=12;
float npcHeight=34;

//load Player

//load Garden assets
Map garden;
void loadGarden()
{
  garden.completeMap();
}

//load Desert Assets
Map desert;
float cowboyX=50;
float cowboyY=50;
NPC cowboy;
void loadDesert()
{
  cowboy = new NPC(cowboyX, cowboyX + npcWidth, cowboyY, cowboyY + npcHeight, loadImage("res/characters/cowboydown.png"), "data/CowboyMeeting.txt", "data/CowboyGoodbye.txt", "data/CowboyGeneric.txt" );
}

//load Wood Assets
Map wood;
float lumberX=-50;
float lumberY=-50;
NPC lumber;
void loadWood()
{
  lumber = new NPC(lumberX, lumberX + npcWidth, lumberY, lumberY + npcHeight, loadImage("res/characters/lumberjackdown.png"), "data/LumberMeeting.txt", "data/LumberGoodbye.txt", "data/LumberGeneric.txt" );
}

//load Sea Assets
Map sea;
float pirateX=75;
float pirateY=75;
NPC pirate;
void loadSea()
{
  pirate = new NPC(pirateX, pirateX + npcWidth, pirateY, pirateY + npcHeight, loadImage("res/characters/piratedown.png"), "data/PirateMeeting.txt", "data/PirateGoodbye.txt", "data/PirateGeneric.txt" );
}

//load menuscreen
void loadMenu()
{
}
