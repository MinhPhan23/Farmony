public class Seed extends Interactable
{
    private String dialog;
    private String name;
    private boolean picked;

    Seed(float l, float r, float t, float b, PImage img, String name, String script)
    {
        super(l, r, t, p, img);
        this.name = name;
        dialog = script
        picked = false;
    }

    Public spawnDialog()
    {
        picked = true;
    }
}