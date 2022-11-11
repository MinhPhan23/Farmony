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
PImage gardenImg;

NPC mom;
float momX;
float momY;
String momMeeting;
String momGoodbye;
String momGeneric;
PImage momImg;

NPC dad;
float dadX;
float dadY;
String dadMeeting;
String dadGoodbye;
String dadGeneric;
PImage dadImg;

Portal gardenSea;
float gardenSeaLeft;
float gardenSeaRight;
float gardenSeaTop;
float gardenSeaBot;

Portal gardenDesert;
float gardenDesertLeft;
float gardenDesertRight;
float gardenDesertTop;
float gardenDesertBot;

Portal gardenWood;
float gardenWoodLeft;
float gardenWoodRight;
float gardenWoodTop;
float gardenWoodBot;

void loadGarden()
{
  gardenImg = loadImage("");
  momImg = loadImage("res/characters/momdown2.png");
  dadImg = loadImage("res/characters/daddown.png");
  garden = new Map(gardenImg, gardenX, gardenY, gardenStartX, gardenStartY);
  
  mom = new NPC(momX, momX + npcWidth, momY, momY + npcHeight, momImg, momMeeting, momGoodbye, momGeneric);
  mom.hintState = false;
  
  dad = new NPC(dadX, dadX + npcWidth, dadY, dadY + npcHeight, dadImg, dadMeeting, dadGoodbye, dadGeneric);
  dad.hintState = false;
  
  garden.add(mom);
  garden.add(dad);
  garden.completeMap();
}

//load Desert Assets
Map desert;
float desertX;
float desertY;
float desertStartX;
float desertStartY;
PImage desertImg;

Seed mandrakes;
Seed grapes;
Seed cacti;

NPC cowboy;
float cowboyX=50;
float cowboyY=50;
PImage cowboyImg;
String cowboyMeeting = "data/CowboyMeeting.txt";
String cowboyGoodbye = "data/CowboyGoodbye.txt";
String cowboyGeneric = "data/CowboyGeneric.txt";
String cowboyHint = "data/CowboyHint.txt";


Interactable horse;
float horseX;
float horseY;
PImage horseImg;

Portal desertGarden;
void loadDesert()
{
  desertImg = loadImage("");
  cowboyImg = loadImage("res/characters/cowboydown.png");
  horseImg = loadImage("res/characters/horse-w114xh75.png");
  
  desert = new Map(desertImg, desertX, desertY, desertStartX, desertStartY);
  
  cowboy = new NPC(cowboyX, cowboyX + npcWidth, cowboyY, cowboyY + npcHeight, cowboyImg, cowboyMeeting, cowboyGoodbye, cowboyGeneric );
  parseScript(cowboyHint, cowboy.hint);
  cowboy.initConvo();
  
  //horse = new Interactable();
  desert.add(cowboy);
  desert.add(horse);
}

//load Wood Assets
Map wood;
float woodX;
float woodY;
float woodStartX;
float woodStartY;
PImage woodImg;

Seed bugloss;
Seed poinsettias;
Seed maple;

NPC lumber;
float lumberX=-75;
float lumberY=-75;
PImage lumberImg;
String lumberMeeting = "data/LumberMeeting.txt";
String lumberGoodbye = "data/LumberGoodbye.txt";
String lumberGeneric = "data/LumberGeneric.txt";
String lumberHint = "LumberHint.txt";

Portal woodGarden;
void loadWood()
{
  woodImg = loadImage("");
  lumberImg = loadImage("res/characters/lumberjackdown.png");
  wood = new Map(woodImg, woodX, woodY, woodStartX, woodStartY);
  
  lumber = new NPC(lumberX, lumberX + npcWidth, lumberY, lumberY + npcHeight, lumberImg, lumberMeeting, lumberGoodbye, lumberGeneric);
  parseScript(lumberHint, lumber.hint);
  lumber.initConvo();
  
  wood.add(lumber);
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
PImage pirateImg;
String pirateMeeting = "data/PirateMeeting.txt";
String pirateGoodbye = "data/PirateGoodbye.txt";
String pirateGeneric = "data/PirateGeneric.txt";
String pirateHint = "data/PirateHint.txt";

Portal seaGarden;
void loadSea()
{
  pirateImg = loadImage("res/characters/piratedown.png");
  sea = new Map(loadImage(""), seaWidth, seaHeight, seaStartX, seaStartY);
  
  pirate = new NPC(pirateX, pirateX + npcWidth, pirateY, pirateY + npcHeight, pirateImg, pirateMeeting, pirateGoodbye, pirateGeneric);
  parseScript(pirateHint, pirate.hint);
  pirate.initConvo();
  
  sea.add(pirate);
}

//load menuscreen
Menu homeScreen;
void loadMenu()
{
  homeScreen.drawMenu(width, height);
}

void loadAsset()
{
  loadGarden();
  loadDesert();
  loadSea();
  loadWood();
}
