
/////////////////////////////////
// Class Map
/////////////////////////////////

public class Map {
 
    // Variables
    private PImage background;
    private minWidth, minHeight; // dimensions of map
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
    **/
    public void add(Seed seed) {
        if (!seedList.contains(seed)) {
            seedList.add(seed);
        }
    }

    /**
     * Removes a seed from seedList and returns it to the player
    **/
    public Seed remove(Seed seed) {
        return seedList.remove(seed);
    }

    public void update(NPC npc) {

    }

    public void transition(Map nextMap) {

    }


}
