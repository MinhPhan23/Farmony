
/////////////////////////////////
// Class Map
/////////////////////////////////

public class Map {
 
    // Variables
    private PImage background;
    private float minWidth, minHeight; // dimensions of map
    private Hitbox left, right, top, bottom; // the borders of the map

    private ArrayList<NPC> npcList= new ArrayList<NPC>();
    private ArrayList<Seed> seedList = new ArrayList<Seed>();
    private ArrayList<Portal> portalList = new ArrayList<Portal>();

    // private Player player

    // Constructor
    public Map (PImage background, float minWidth, float minHeight) {
        this.background = background;
        this.minWidth = minWidth;
        this.minHeight = minHeight;

        left = new Hitbox(-minWidth, -minWidth, -minHeight, minHeight);
        right = new Hitbox(minWidth, minWidth, -minHeight, minHeight);
        top = new Hitbox(-minWidth, minWidth, -minHeight, -minHeight);
        top = new Hitbox(-minWidth, minWidth, minHeight, minHeight);

    }

    // Methods
    public void drawMap() {
        beginShape(QUADS);
        texture(background);
        vertex(-minWidth, -minHeight, 0, 0);
        vertex(minWidth, -minHeight, 1, 0);
        vertex(minWidth, minHeight, 1, 1);
        vertex(-minWidth, minHeight, 0, 1);
        endShape();

        renderObjects();
    }

    /**
     * Draws the interactable objects on the map
    **/
    private void renderObjects() {
        for (Seed seed : seedList) { // Draw seeds
            seed.drawObj();
        }

        for (NPC npc : npcList) { // Draw NPCs
            npc.drawObj();
        }

        for (Portal portal : portalList) { // Draw portal(s)
            portal.drawObj();
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
        int index = npcList.indexOf(npc);
        if (index > 0) {
            // update the dialog of the npc after the first interaction?
            //npcList.get(index).dialog = ""
        }
    }

    public void transition(Map nextMap) {
        // int tintVal = 0;

        // while (tintVal < 1) { // fade out animation
        //     tint(tintVal);
        //     tintVal += 0.1;
        // }

        // move player to dest
        println("moving to map");
        nextMap.drawMap();
        

        // tintVal = 0;
        // tint(tintVal);
    }


}
