
/////////////////////////////////
// Class Map
/////////////////////////////////

public class Map {
 
    // Variables
    private PImage background;
    private float minWidth, minHeight; // dimensions of map
    private ArrayList<NPC> npcList= new ArrayList<NPC>();
    private ArrayList<Seed> seedList = new ArrayList<Seed>();
    private ArrayList<Portal> portalList = new ArrayList<Portal>();
    private ArrayList<Interactable> interactableList = new ArrayList<Interactable>(); 

    // Constructor
    public Map (PImage background, float minWidth, float minHeight) {
        this.background = background;
        this.minWidth = minWidth;
        this.minHeight = minHeight;
    }

    // Methods
    public void draw() {
        beginShape(QUADS);
        texture(background);
        vertex(-minWidth, -minHeight, 0, 0);
        vertex(minWidth, -minHeight, 1, 0);
        vertex(-minWidth, minHeight, 0, 1);
        vertex(minWidth, minHeight, 1, 1);
        endShape();
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
     * Removes a seed from seedList and returns it to the player
     * @param  seed  the specified Seed object to remove from the Map
     * @return  the specified Seed object, or null if the Seed does not exist on the Map
    **/
    public Seed remove(Seed seed) {
        int seedInd = seedList.indexOf(seed);
        Seed pickedUp = null;

        if (seedInd > 0) { // the seed can be picked up by player
            pickedUp = seedList.get(seedInd);
            seedList.remove(seedInd);
        }

        return pickedUp;
    }

    public void update(NPC npc) {

    }

    public void transition(Map nextMap) {

    }


}
