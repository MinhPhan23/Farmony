public class Seed extends Interactable
{
    private String dialogue;
    private String name;
    private boolean picked;

    Seed(float l, float r, float t, float b, PImage img, String name, String script)
    {
        super(l, r, t, p, img);
        this.name = name;
        dialogue = script
        picked = false;
    }

    Public spawnDialog()
    {
        picked = true;
    }
}