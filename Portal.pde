public class Portal extends Interactable
{
    private String dialog;
    private String name;
    private Map current;
    private Map dest;

    Portal(float l, float r, float t, float b, PImage img, String name, String script)
    {
        super(l, r, t, p, img);
        this.name = name;
        dialog = script
        picked = false;
    }

    Public spawnDialog()
    {
        current.transition(dest);
    }
}
