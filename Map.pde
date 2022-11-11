
/////////////////////////////////
// Class Map
//   - A region of the game with interactable objects
/////////////////////////////////

public class Map {

  // Variables
  private PImage background;
  private float mapWidth, mapHeight; // dimensions of map
  private float startX, startY; // player starting position

  private ArrayList<NPC> npcList= new ArrayList<NPC>();           // array lists to hold the interactable objects on the map
  private ArrayList<Seed> seedList = new ArrayList<Seed>();
  private ArrayList<Portal> portalList = new ArrayList<Portal>();
  private ArrayList<Interactable> objectList = new ArrayList<Interactable>(); //array lists hold normal objects

  //if player complete the map objective
  private boolean complete;

  //elements of letter connected with the map
  private boolean letterRead;
  private int letterPart; 

  // Constructor
  public Map (PImage background, float mapWidth, float mapHeight, float startX, float startY) {
    this.background = background;
    this.mapWidth = mapWidth;
    this.mapHeight = mapHeight;
    this.startX = startX;
    this.startY = startY;
    complete = false;
    letterRead = true;
  }

  // draw the map background and all objects
  public void drawMap() {
    beginShape(QUADS);
    texture(background);
    vertex(-mapWidth, -mapHeight, 0, 0);
    vertex(mapWidth, -mapHeight, 1, 0);
    vertex(mapWidth, mapHeight, 1, 1);
    vertex(-mapWidth, mapHeight, 0, 1);
    endShape();

    renderObjects();
  }

  /**
   * Draws the interactable objects on the map by calling drawObj() on each interactable in the arraylists
   **/
  private void renderObjects() {
    int count = 0;
    for (Seed seed : seedList) { // Draw seeds
      if (seed.isUnlocked() && !seed.isPicked()) { // seed is able to be picked up
        seed.drawObj();
      }
      else if (seed.isPicked() && !complete) {
        count++;
      }
    }

    if (count == seedList.size() && !complete) {
      completeMap();
    }

    for (NPC npc : npcList) { // Draw NPCs
      npc.drawObj();
    }

    for (Portal portal : portalList) { // Draw portal(s)
      portal.drawObj();
    }

    for (Interactable object : objectList) { // Draw portal(s)
      object.drawObj();
    }
  }

  /**
   * Adds a new Seed object to the Map
   * @param  seed  the specified Seed object to add to the Map
   **/
  public void add(Seed seed) {
    if (seedList.indexOf(seed) < 0) { // seed is not already in map
      seedList.add(seed);
    }
  }

  /**
   * Adds a new object to the Map
   * @param  obj the specified Interactable object to add to the Map
   **/
  public void add(Interactable obj) {
    if (objectList.indexOf(obj) < 0) { // obj is not already in map
      objectList.add(obj);
    }
  }

  /**
   * Adds a new npc to the Map
   * @param  npc the specified NPC object to add to the Map
   **/
  public void add(NPC npc) {
    if (npcList.indexOf(npc) < 0) { // npc is not already in map
      npcList.add(npc);
    }
  }

  /**
   * Adds a new portal to the Map
   * @param  portal the specified Portal portal to add to the Map
   **/
  public void add(Portal portal) {
    if (portalList.indexOf(portal) < 0) { // portal is not already in map
      portalList.add(portal);
    }
  }

  // Getter for the width of the map
  public float getWidth()
  {
    return mapWidth;
  }

  // Getter for the height of the map
  public float getHeight()
  {
    return mapHeight;
  }

  // Getter for lists
  public ArrayList getPortal()
  {
    return portalList;
  }
  public ArrayList getNPC()
  {
    return npcList;
  }
  public ArrayList getSeed()
  {
    return seedList;
  }
  public ArrayList getObject()
  {
    return objectList;
  }


  //Getter and setter for map completeion
  public boolean isComplete() 
  {
    return complete;
  }
  
  public void completeMap()
  {
    complete=true;
    letterPart = completeMap++;
    for (NPC npc : npcList) { // Draw NPCs
      npc.setHint();
    }
  }

  //Getter and setter for letter appearance completeion
  public void readLetter(boolean status) {
    letterRead = status;
  }
  
  //true when player just visit the map, false after print out the letter
  public boolean firstVisit()
  {
    return letterRead;
  }

  // Get player starting position
  public float getStartX()
  {
    return startX;
  }
  public float getStartY()
  {
    return startY;
  }
  
  //number of the letter that is assigned to the map
  public int getLetterPart()
  {
    return letterPart;
  }
}
