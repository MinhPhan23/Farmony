public class Seed extends Interactable
{
    private String dialog;
    private String name;
    private boolean picked;
    private int time;
    private PFont fontName = createFont("Arial", 14);
    private PFont fontDialog = createFont("Arial", 12);

    Seed(float l, float r, float t, float b, PImage img, String name, String script)
    {
        super(l, r, t, b, img);
        this.name = name;
        dialog = script;
        picked = false;
        time = 0;
    }

    public void spawnDialog()
    {
        time++;
        textFont(fontDialog);
        pushMatrix();
        //translate(playerX-195, playerY+80, 0.9);

        beginShape(QUADS);
        //texture(choicebox); 
        vertex(0,0,  0,0);
        vertex(390,0,  1,0);
        vertex(390,60,  1,1);
        vertex(0,60,  0,1);
        endShape();

        textFont(fontName);
        textAlign(LEFT, LEFT);
        fill(0.2,0.2,0.15);
        translate(25,15);
        text(name, 0, 0); 
        translate(-10,15);
        textFont(fontDialog);
        text(dialog, 0, 0);
        popMatrix();
    }

    public boolean timeout()
    {
        boolean result = false;
        if (time > super.TIMEOUT)
        {
            time = 0;
            result = true;
        }
        return result;
    }
}
