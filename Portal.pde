public class Portal extends Interactable
{
    private String dialog;
    private String name;
    private Map current;
    private Map dest;

    Portal(float l, float r, float t, float b, PImage img, String name, Map current, Map dest)
    {
        super(l, r, t, p, img);
        this.name = name;
        this.current = current;
        this.dest =dest;
    }

    Public spawnDialog()
    {
        current.transition(dest);
    }
}
