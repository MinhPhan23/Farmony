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
float gardenX;
float gardenY;
float gardenStartX;
float gardenStartY;

NPC mom;
float momX;
float momY;

NPC dad;
float dadX;
float dadY;

void loadGarden()
{
  garden = new Map(loadImage(""), gardenX, gardenY, gardenStartX, gardenStartY);
  garden.completeMap();
}

//load Desert Assets
Map desert;
float desertX;
float desertY;
float desertStartX;
float desertStartY;

Seed mandrakes;
Seed grapes;
Seed cacti;

NPC cowboy;
float cowboyX=50;
float cowboyY=50;

NPC horse;
float horseX;
float horseY;
void loadDesert()
{
  desert = new Map(loadImage(""), desertX, desertY, desertStartX, desertStartY);
  cowboy = new NPC(cowboyX, cowboyX + npcWidth, cowboyY, cowboyY + npcHeight, loadImage("res/characters/cowboydown.png"), "data/CowboyMeeting.txt", "data/CowboyGoodbye.txt", "data/CowboyGeneric.txt" );
  parseScript("data/CowboyHint.txt", cowboy.hint);
  cowboy.initConvo();
}

//load Wood Assets
Map wood;
float woodX;
float woodY;
float woodStartX;
float woodStartY;

Seed bugloss;
Seed poinsettias;
Seed maple;

NPC lumber;
float lumberX=-75;
float lumberY=-75;
void loadWood()
{
  wood = new Map(loadImage(""), woodX, woodY, woodStartX, woodStartY);
  lumber = new NPC(lumberX, lumberX + npcWidth, lumberY, lumberY + npcHeight, loadImage("res/characters/lumberjackdown.png"), "data/LumberMeeting.txt", "data/LumberGoodbye.txt", "data/LumberGeneric.txt" );
  parseScript("data/LumberHint.txt", lumber.hint);
  lumber.initConvo();
}

//load Sea Assets
Map sea;
float seaWidth;
float seaHeight;
float seaStartX;
float seaStartY;

Seed hydrangeas;
Seed bamboo;
Seed hellebore;

NPC pirate;
float pirateX=75;
float pirateY=75;
void loadSea()
{
  sea = new Map(loadImage(""), seaWidth, seaHeight, seaStartX, seaStartY);
  pirate = new NPC(pirateX, pirateX + npcWidth, pirateY, pirateY + npcHeight, loadImage("res/characters/piratedown.png"), "data/PirateMeeting.txt", "data/PirateGoodbye.txt", "data/PirateGeneric.txt" );
  parseScript("data/PirateHint.txt", pirate.hint);
  pirate.initConvo();
}

//load menuscreen
void loadMenu()
{
}

void loadAsset()
{
  loadGarden();
  loadDesert();
  loadSea();
  loadWood();
}
