public class NPC extends Interactable
{
    private String dialogue;
    private String name;

    NPC(float l, float r, float t, float b, PImage img, String name, String script)
    {
        super(l, r, t, p, img);
        this.name = name;
        dialogue = script
    }

    Public spawnDialog()
    {

    }
}
