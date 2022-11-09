public class Portal extends Interactable
{
    private String dialog;
    private String name;
    //private Map current;
    private Map dest;

    Portal(float l, float r, float t, float b, PImage img, String name, Map dest)
    {
        super(l, r, t, b, img);
        this.name = name;
        //this.current = current;
        this.dest =dest;
    }

    /**
     * Transition to a new map.
     * @param  nextMap  the next Map to move the player to once the transition is complete
    **/
    public Map transition() {
        return dest;
    }
}
