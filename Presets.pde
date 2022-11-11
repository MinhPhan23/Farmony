//current map of the game
Map currmap;

//load letter
Letter letter;

//load dimension
float left = -200;
float right = 200;
float top = -150;
float bottom = 150;
float mapX;
float mapY;

//load NPC size
float npcWidth=13;
float npcHeight=35;

//load Player

//load Garden assets
Map garden;
float gardenX = 750/4;
float gardenY = 825/4;
float gardenStartX = 55;
float gardenStartY = -50;
PImage gardenImg;

NPC mom;
float momX = 95;
float momY = -175;
String momMeeting = "";
String momGoodbye = "";
String momGeneric = "data/MomGeneric.txt";
PImage momImg;

NPC dad;
float dadX = 15;
float dadY = -175;
String dadMeeting = "data/DadMeeting.txt";
String dadGoodbye = "";
String dadGeneric = "data/DadGeneric.txt";
PImage dadImg;

Portal gardenSea;
float gardenSeaLeft = 140;
float gardenSeaRight = 160;
float gardenSeaTop = 180;
float gardenSeaBot = 200;
PImage gardenSeaImg;

Portal gardenDesert;
float gardenDesertLeft = -180;
float gardenDesertRight = -160;
float gardenDesertTop = 40;
float gardenDesertBot = 60;
PImage gardenDesertImg;

Portal gardenWood;
float gardenWoodLeft = -180;
float gardenWoodRight = -160;
float gardenWoodTop = 160;
float gardenWoodBot = 180;
PImage gardenWoodImg;

void loadGarden()
{
  gardenImg = loadImage("map/garden.png");
  momImg = loadImage("res/characters/mom/momdown2.png");
  dadImg = loadImage("res/characters/daddown.png");
  gardenSeaImg = loadImage("map/object/boiler.png");
  gardenWoodImg = loadImage("map/object/boiler.png");
  gardenDesertImg = loadImage("map/object/boiler.png");
  
  garden = new Map(gardenImg, gardenX, gardenY, gardenStartX, gardenStartY);
  
  mom = new NPC(momX, momX + npcWidth, momY, momY + npcHeight, momImg, momMeeting, momGoodbye, momGeneric, true, false, true, false);
  mom.initConvo();
  
  dad = new NPC(dadX, dadX + npcWidth, dadY, dadY + npcHeight, dadImg, dadMeeting, dadGoodbye, dadGeneric, true, false, true, false);
  dad.initConvo();
  
  garden.add(dad);
  
  garden.completeMap();
}

//load Desert Assets
Map desert;
float desertX = 900/4;
float desertY = 825/4;
float desertStartX = 177;
float desertStartY = 153;
PImage desertImg;

Seed mandrakes;
float mandrakesX;
float mandrakesY;
float mandrakesHeight;
float mandrakesWidth;
PImage mandrakesImg;
Seed grapes;
float grapesX;
float grapesY;
float grapesHeight;
float grapesWidth;
PImage grapesImg;
Seed cacti;
float cactiX;
float cactiY;
float cactiHeight;
float cactiWidth;
PImage cactiImg;

NPC cowboy;
float cowboyX=-20;
float cowboyY=-150;
PImage cowboyImg;
String cowboyMeeting = "data/CowboyMeeting.txt";
String cowboyGoodbye = "data/CowboyGoodbye.txt";
String cowboyGeneric = "data/CowboyGeneric.txt";
String cowboyHint = "data/CowboyHint.txt";


Interactable horse;
float horseX = -125;
float horseY = -50;
PImage horseImg;

Portal desertGarden;
PImage desertGardenImg;
void loadDesert()
{
  desertImg = loadImage("map/desert.png");
  cowboyImg = loadImage("res/characters/cowboydown.png");
  horseImg = loadImage("res/characters/horse-w114xh75.png");
  desertGardenImg = loadImage("map/object/boiler.png");

  
  desert = new Map(desertImg, desertX, desertY, desertStartX, desertStartY);
  
  cowboy = new NPC(cowboyX, cowboyX + npcWidth, cowboyY, cowboyY + npcHeight, cowboyImg, cowboyMeeting, cowboyGoodbye, cowboyGeneric );
  parseScript(cowboyHint, cowboy.hint);
  cowboy.initConvo();
  
  horse = new Interactable(horseX, horseX + 57, horseY, horseY + 35, horseImg);
  desert.add(cowboy);
  desert.add(horse);
}

//load Wood Assets
Map wood;
float woodX = 900/4;
float woodY = 825/4;
float woodStartX = -169;
float woodStartY = -19;
PImage woodImg;

Seed bugloss;
float buglossX;
float buglossY;
float buglossHeight;
float buglossWidth;
PImage bugloss;
Seed poinsettias;
float poinsettiasX;
float poinsettiasY;
float poinsettiasHeight;
float poinsettiasWidth;
PImage poinsettiasImg;
Seed maple;
float mapleX;
float mapleY;
float mapleHeight;
float mapleWidth;
PImage mapleImg;

NPC lumber;
float lumberX= 0;
float lumberY=-100;
PImage lumberImg;
String lumberMeeting = "data/LumberMeeting.txt";
String lumberGoodbye = "data/LumberGoodbye.txt";
String lumberGeneric = "data/LumberGeneric.txt";
String lumberHint = "LumberHint.txt";

Portal woodGarden;
PImage woodGardenImg;
void loadWood()
{
  woodImg = loadImage("map/forest.png");
  lumberImg = loadImage("res/characters/lumberjackdown.png");
  woodGardenImg = loadImage("map/object/boiler.png");
  wood = new Map(woodImg, woodX, woodY, woodStartX, woodStartY);
  
  lumber = new NPC(lumberX, lumberX + npcWidth, lumberY, lumberY + npcHeight, lumberImg, lumberMeeting, lumberGoodbye, lumberGeneric);
  parseScript(lumberHint, lumber.hint);
  lumber.initConvo();
  
  wood.add(lumber);
}

//load Sea Assets
Map sea;
float seaWidth = 337.5;
float seaHeight = 206.25;
float seaStartX = 205;
float seaStartY = -100;
PImage seaImg;

Seed hydrangeas;
float hydrangeasX;
float hydrangeasY;
float hydrangeasHeight;
float hydrangeasWidth;
PImage hydrangeasImg;
Seed bamboo;
float bambooX;
float bambooY;
float bambooHeight;
float bambooWidth;
PImage bambooImg;
Seed hellebore;
float helleboreX;
float helleboreY;
float helleboreHeight;
float helleboreWidth;
PImage helleboreImg;

NPC pirate;
float pirateX=-250;
float pirateY=20;
PImage pirateImg;
String pirateMeeting = "data/PirateMeeting.txt";
String pirateGoodbye = "data/PirateGoodbye.txt";
String pirateGeneric = "data/PirateGeneric.txt";
String pirateHint = "data/PirateHint.txt";

Portal seaGarden;
PImage seaPortalImg;

void loadSea()
{
  seaPortalImg = loadImage("map/object/boiler.png");
  seaImg = loadImage("map/sea.png");
  pirateImg = loadImage("res/characters/piratedown.png");
  sea = new Map(seaImg, seaWidth, seaHeight, seaStartX, seaStartY);
  
  pirate = new NPC(pirateX, pirateX + npcWidth, pirateY, pirateY + npcHeight, pirateImg, pirateMeeting, pirateGoodbye, pirateGeneric);
  parseScript(pirateHint, pirate.hint);
  pirate.initConvo();
  
  sea.add(pirate);
}

//load menuscreen
Menu homeScreen;
void loadMenu()
{
  homeScreen.drawMenu();
}

void loadAsset()
{
  loadGarden();
  loadDesert();
  loadSea();
  loadWood();
  loadPortals();
  makeNPCList();
  
  homeScreen = new Menu();
  gameStart = false;
  currmap = garden;
  player = new Player(currmap.startX, currmap.startY);
  letter = new Letter();
}

void loadPortals()
{
  gardenSea = new Portal(gardenSeaLeft, gardenSeaRight, gardenSeaTop, gardenSeaBot, gardenSeaImg, sea);
  gardenWood = new Portal(gardenWoodLeft, gardenWoodRight, gardenWoodTop, gardenWoodBot, gardenWoodImg, wood);
  gardenDesert = new Portal(gardenDesertLeft, gardenDesertRight, gardenDesertTop, gardenDesertBot, gardenDesertImg, desert);
  garden.add(gardenSea);
  garden.add(gardenWood);
  garden.add(gardenDesert);
  
  seaGarden = new Portal(300, 320, -150, -130, seaPortalImg, garden);
  sea.add(seaGarden);
  
  woodGarden = new Portal(190, 220, 130, 160, woodGardenImg, garden);
  desertGarden = new Portal(195, 215, -197, -177, desertGardenImg, garden);
  wood.add(woodGarden);
  desert.add(desertGarden);
}
