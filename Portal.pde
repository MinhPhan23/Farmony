public class Portal extends Interactable
{
    private String dialog;
    private String name;
    private Map current;
    private Map dest;

    Portal(float l, float r, float t, float b, PImage img, String name, Map current, Map dest)
    {
        super(l, r, t, b, img);
        this.name = name;
        this.current = current;
        this.dest =dest;
    }

    public void spawnDialog()
    {
        current.transition(dest);
    }
}
