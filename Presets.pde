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
float gardenX;
float gardenY;
float gardenStartX;
float gardenStartY;
PImage gardenImg;

NPC mom;
float momX;
float momY;
String momMeeting = "";
String momGoodbye = "";
String momGeneric = "data/MomGeneric.txt";
PImage momImg;

NPC dad;
float dadX;
float dadY;
String dadMeeting = "data/DadMeeting.txt";
String dadGoodbye = "";
String dadGeneric = "data/DadGenric.txt";
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
  momImg = loadImage("res/characters/mom/momdown2.png");
  dadImg = loadImage("res/characters/daddown.png");
  garden = new Map(gardenImg, gardenX, gardenY, gardenStartX, gardenStartY);
  
  mom = new NPC(momX, momX + npcWidth, momY, momY + npcHeight, momImg, momMeeting, momGoodbye, momGeneric);
  mom.hintState = false;
  mom.meetingState = false;
  mom.goodbyeState = false;
  
  dad = new NPC(dadX, dadX + npcWidth, dadY, dadY + npcHeight, dadImg, dadMeeting, dadGoodbye, dadGeneric);
  dad.hintState = false;
  dad.goodbyeState = false;
  
  garden.add(dad);
  garden.completeMap();
}

//load Desert Assets
Map desert;
float desertX = 900/4;
float desertY = 825/4;
float desertStartX = 200;
float desertStartY = 200;
PImage desertImg;


Seed mandrakes;
Seed grapes;
Seed cacti;

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
void loadDesert()
{
  desertImg = loadImage("map/desert.png");
  cowboyImg = loadImage("res/characters/cowboydown.png");
  horseImg = loadImage("res/characters/horse-w114xh75.png");
  
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
float seaWidth = 337.5;
float seaHeight = 206.25;
float seaStartX = 205;
float seaStartY = -100;
PImage seaImg;

Seed hydrangeas;
Seed bamboo;
Seed hellebore;

NPC pirate;
float pirateX=-250;
float pirateY=20;
PImage pirateImg;
String pirateMeeting = "data/PirateMeeting.txt";
String pirateGoodbye = "data/PirateGoodbye.txt";
String pirateGeneric = "data/PirateGeneric.txt";
String pirateHint = "data/PirateHint.txt";

Portal seaGarden;
void loadSea()
{
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
  //loadGarden();
  loadDesert();
  loadSea();
  loadWood();
  makeNPCList();
  homeScreen = new Menu();
  gameStart = false;
}
