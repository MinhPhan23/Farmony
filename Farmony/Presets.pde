//current map of the game
Map currmap;
Map prevmap;

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
String momMeeting = "data/scripts/MomMeeting.txt";
String momGoodbye = "";
String momGeneric = "data/scripts/MomGeneric.txt";
PImage momImg;

NPC dad;
float dadX = 15;
float dadY = -175;
String dadMeeting = "data/scripts/DadMeeting.txt";
String dadGoodbye = "";
String dadGeneric = "data/scripts/DadGeneric.txt";
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

Interactable bambooTree;
Interactable buglossTree;
Interactable cactusTree;
Interactable grapeTree;
Interactable helleboreTree;
Interactable hydrangeaTree;
Interactable mandrakeTree;
Interactable mapleTree;
Interactable poinsettiaTree;

// Load music
SoundFile gardenThemeIncomplete;
SoundFile gardenThemeComplete;
SoundFile desertTheme;
SoundFile seaTheme;
SoundFile woodTheme;
SoundFile menuTheme;
SoundFile pauseTheme;

// Load SFX
SoundFile stepSFX;
SoundFile pickupSFX;
SoundFile portalSFX;

void loadAudio(){
  gardenThemeIncomplete = new SoundFile(this, "data/audio/Garden_Incomplete.mp3");
  gardenThemeComplete = new SoundFile(this, "data/audio/Garden_Complete.mp3");
  desertTheme = new SoundFile(this, "data/audio/Desert_Region.mp3");
  seaTheme = new SoundFile(this, "data/audio/Sea_Region.mp3");
  woodTheme = new SoundFile(this, "data/audio/Forest_Region.wav");
  menuTheme = new SoundFile(this, "data/audio/Menu.mp3");
  pauseTheme = new SoundFile(this, "data/audio/Pause.mp3");

  stepSFX = new SoundFile(this, "data/audio/Desert_Footstep_sfx_2.mp3");
  pickupSFX = new SoundFile(this, "data/audio/Pickup_SFX.mp3");
  portalSFX = new SoundFile(this, "data/audio/Portal_SFX.mp3");
}

void loadGarden()
{
  gardenImg = loadImage("data/map/garden.png");
  momImg = loadImage("data/res/characters/mom/momdown2.png");
  dadImg = loadImage("data/res/characters/daddown.png");
  
  gardenSeaImg = loadImage("data/map/portalgarden1.png");
  gardenDesertImg = loadImage("data/map/portalgarden2.png");
  gardenWoodImg = loadImage("data/map/portalgarden3.png");

  bambooTree = new Interactable(-75, -50, -150, -110, loadImage("data/res/plants/bamboo.png"));
  buglossTree = new Interactable(-40, -10, -200, -170, loadImage("data/res/plants/bugloss.png"));
  cactusTree = new Interactable(-55, -35, -180, -140, loadImage("data/res/plants/cactus.png"));
  grapeTree = new Interactable(0, 30, -205, -175, loadImage("data/res/plants/grape.png"));
  helleboreTree = new Interactable(40, 70, -205, -175, loadImage("data/res/plants/hellebore.png"));
  hydrangeaTree = new Interactable(80, 110, -205, -175, loadImage("data/res/plants/hydrangea.png"));
  mandrakeTree = new Interactable(120, 150, -205, -175, loadImage("data/res/plants/mandrake.png"));
  mapleTree = new Interactable(150, 180, -180, -140, loadImage("data/res/plants/maple.png"));
  poinsettiaTree = new Interactable(150, 180, -130, -100, loadImage("data/res/plants/poinsettia.png"));
  
  garden = new Map(gardenImg, gardenThemeIncomplete, 17.65, gardenX, gardenY, gardenStartX, gardenStartY);
  
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
float mandrakesX = -127;
float mandrakesY = -30;
float mandrakesHeight = 15;
float mandrakesWidth = 15;
PImage mandrakesImg;
Seed grapes;
float grapesX = 200;
float grapesY = 90;
float grapesHeight = 15;
float grapesWidth = 15;
PImage grapesImg;
Seed cacti;
float cactiX = 160;
float cactiY = -120;
float cactiHeight = 15;
float cactiWidth = 15;
PImage cactiImg;

NPC cowboy;
float cowboyX=-20;
float cowboyY=-150;
PImage cowboyImg;
String cowboyMeeting = "data/scripts/CowboyMeeting.txt";
String cowboyGoodbye = "data/scripts/CowboyGoodbye.txt";
String cowboyGeneric = "data/scripts/CowboyGeneric.txt";
String cowboyHint = "data/scripts/CowboyHint.txt";


Interactable horse;
float horseX = -125;
float horseY = -50;
PImage horseImg;

Portal desertGarden;
PImage desertGardenImg;
void loadDesert()
{
  desertImg = loadImage("data/map/desert.png");
  cowboyImg = loadImage("data/res/characters/cowboydown.png");
  horseImg = loadImage("data/res/characters/horse-w114xh75.png");
  desertGardenImg = loadImage("data/res/items/portal.png");
  cactiImg = loadImage("data/res/seeds/cactusSeed.png");
  mandrakesImg = loadImage("data/res/seeds/mandrakeSeed.png");
  grapesImg = loadImage("data/res/seeds/grapeSeed.png");
  
  desert = new Map(desertImg, desertTheme, 0, desertX, desertY, desertStartX, desertStartY);
  
  cowboy = new NPC(cowboyX, cowboyX + npcWidth, cowboyY, cowboyY + npcHeight, cowboyImg, cowboyMeeting, cowboyGoodbye, cowboyGeneric );
  parseScript(cowboyHint, cowboy.hint);
  cowboy.initConvo();
  cacti = new Seed(cactiX, cactiY, cactiWidth, cactiHeight, cactiImg, "Me", "Cacti Seed Found!!");
  mandrakes = new Seed(mandrakesX, mandrakesY, mandrakesWidth, mandrakesHeight, mandrakesImg, "Me", "Mandrakes Seed Found!!"); 
  grapes =  new Seed(grapesX, grapesY, grapesWidth, grapesHeight, grapesImg, "Me", "Grapes Seed Found!!");
  horse = new Interactable(horseX, horseX + 57, horseY, horseY + 35, horseImg);

  desert.add(cowboy);
  desert.add(horse);
  desert.add(grapes);
  desert.add(mandrakes);
  desert.add(cacti);
}

//load Wood Assets
Map wood;
float woodX = 900/4;
float woodY = 825/4;
float woodStartX = -169;
float woodStartY = -19;
PImage woodImg;

Seed bugloss;
float buglossX = -124;
float buglossY = -200;
float buglossWidth = 75/4;
float buglossHeight = 75/4;
PImage buglossImg;

Seed poinsettias;
float poinsettiasX = -206;
float poinsettiasY = 160;
float poinsettiasWidth = 75/4;
float poinsettiasHeight = 75/4;
PImage poinsettiasImg;

Seed maple;
float mapleX = 200;
float mapleY = -105;
float mapleWidth = 75/4;
float mapleHeight = 75/4;
PImage mapleImg;

NPC lumber;
float lumberX= 0;
float lumberY=-100;
PImage lumberImg;
String lumberMeeting = "data/scripts/LumberMeeting.txt";
String lumberGoodbye = "data/scripts/LumberGoodbye.txt";
String lumberGeneric = "data/scripts/LumberGeneric.txt";
String lumberHint = "data/scripts/LumberHint.txt";

Portal woodGarden;
PImage woodGardenImg;
void loadWood()
{
  woodImg = loadImage("data/map/forest.png");
  woodGardenImg = loadImage("data/res/items/portal.png");
  wood = new Map(woodImg, woodTheme, 18.97, woodX, woodY, woodStartX, woodStartY);
  
  // Lumberjack NPC
  lumberImg = loadImage("data/res/characters/lumberjackdown.png");
  lumber = new NPC(lumberX, lumberX + npcWidth, lumberY, lumberY + npcHeight, lumberImg, lumberMeeting, lumberGoodbye, lumberGeneric);
  parseScript(lumberHint, lumber.hint);
  lumber.initConvo();

  // Seeds
  mapleImg = loadImage("data/res/seeds/mapleSeed.png");
  maple = new Seed(mapleX, mapleY, mapleWidth, mapleHeight, mapleImg, "Maple", "This will grow into a tall and strong tree.");
  
  poinsettiasImg = loadImage("data/res/seeds/poinsettiaSeed.png");
  poinsettias = new Seed(poinsettiasX, poinsettiasY, poinsettiasWidth, poinsettiasHeight, poinsettiasImg, "Pointsettia", "A vibrant shade of crimson in a forest of green.");

  buglossImg = loadImage("data/res/seeds/buglossSeed.png");
  bugloss = new Seed(buglossX, buglossY, buglossWidth, buglossHeight, buglossImg, "Bugloss", "What a lovely flower.");

  wood.add(lumber);
  wood.add(maple);
  wood.add(poinsettias);
  wood.add(bugloss);
}

//load Sea Assets
Map sea;
float seaWidth = 337.5;
float seaHeight = 206.25;
float seaStartX = 205;
float seaStartY = -80;
PImage seaImg;

Seed hydrangeas;
float hydrangeasX = 265;
float hydrangeasY = -150;
float hydrangeasHeight = 17.5;
float hydrangeasWidth = 17.5;
PImage hydrangeasImg;
Seed bamboo;
float bambooX = 310;
float bambooY = 130;
float bambooHeight = 17.5;
float bambooWidth = 17.5;
PImage bambooImg;
Seed hellebore;
float helleboreX = 197;
float helleboreY = 35;
float helleboreHeight = 17.5;
float helleboreWidth = 17.5;
PImage helleboreImg;

NPC pirate;
float pirateX=-250;
float pirateY=20;
PImage pirateImg;
String pirateMeeting = "data/scripts/PirateMeeting.txt";
String pirateGoodbye = "data/scripts/PirateGoodbye.txt";
String pirateGeneric = "data/scripts/PirateGeneric.txt";
String pirateHint = "data/scripts/PirateHint.txt";

Portal seaGarden;
PImage seaPortalImg;

void loadSea()
{
  seaPortalImg = loadImage("data/res/items/portal.png");
  seaImg = loadImage("data/map/sea.png");
  pirateImg = loadImage("data/res/characters/piratedown.png");
  
  hydrangeasImg = loadImage("data/res/seeds/hydrangeaSeed.png");
  bambooImg = loadImage("data/res/seeds/bambooSeed.png");
  helleboreImg = loadImage("data/res/seeds/helleboreSeed.png");
  
  hydrangeas = new Seed(hydrangeasX, hydrangeasY, hydrangeasWidth, hydrangeasHeight, hydrangeasImg, "Hydrangeas", "Oh Hydrangeas seed");
  bamboo = new Seed(bambooX, bambooY, bambooWidth, bambooHeight, bambooImg, "bamboo", "Oh bamboo seed");
  hellebore = new Seed(helleboreX, helleboreY, helleboreWidth, helleboreHeight, helleboreImg, "hellebore", "Oh hellebore seed");

  sea = new Map(seaImg, seaTheme, 15.2, seaWidth, seaHeight, seaStartX, seaStartY);
  
  pirate = new NPC(pirateX, pirateX + npcWidth, pirateY, pirateY + npcHeight, pirateImg, pirateMeeting, pirateGoodbye, pirateGeneric);
  parseScript(pirateHint, pirate.hint);
  pirate.initConvo();
  
  sea.add(pirate);
  sea.add(hydrangeas);
  sea.add(bamboo);
  sea.add(hellebore);
}

//load menuscreen
Menu homeScreen;
void loadMenu()
{
  homeScreen.drawMenu();
}

void loadAsset()
{
  loadAudio();
  loadGarden();
  loadDesert();
  loadSea();
  loadWood();
  loadPortals();
  makeNPCList();
  
  homeScreen = new Menu();
  gameStart = false;
  currmap = garden;
  prevmap = garden;
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
  
  seaGarden = new Portal(200, 210, -110, -100, seaPortalImg, garden);
  sea.add(seaGarden);
  
  woodGarden = new Portal(190, 220, 130, 160, woodGardenImg, garden);
  desertGarden = new Portal(195, 215, -197, -177, desertGardenImg, garden);
  wood.add(woodGarden);
  desert.add(desertGarden);
}


PImage choiceBoxImg;
void setChoiceBox(){
  if(currmap == garden){
    choiceBoxImg = loadImage("data/map/choiceboxpaper.png");
  }
  else if (currmap == sea){
    choiceBoxImg = loadImage("data/map/choiceboxorange.png");  
  }
  else if (currmap == desert){
    choiceBoxImg = loadImage("data/map/choiceboxyellow.png");  
  }
  else if (currmap == wood){
    choiceBoxImg = loadImage("data/map/choiceboxgreen.png");    
  }
  
}
