public class NPC extends Interactable
{
    private String dialog;
    private String name;
    private String currMsg;
    private int time;
    private static PFont fontName;
    private static PFont fontDialog;

    NPC(float l, float r, float t, float b, PImage img, String name, String script)
    {
        super(l, r, t, p, img);
        this.name = name;
        dialog = script
    }

    Public spawnDialog()
    {

    }
}
