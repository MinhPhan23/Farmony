public class Interactable
{
    private PImage texture;
    private float left, right,top, bottom;
    private Hitbox hitbox;

    Interactable(float l, float r, float t, float b, PImage img)
    {
        texture = img;
        left = l;
        right = r;
        top = t;
        bottom = b;
        hitbox = new Hitbox(l, r, t, b);
    }

    public void drawObj()
    {
        pushMatrix();
        translate(0,0,0.05);
        beginShape(QUADS);
        texture(texture);
        vertex(left, top,  0,0);
        vertex(right, top,  1,0);
        vertex(right, bottom,  1,1);
        vertex(left, bottom,  0,1);
        endShape();
        popMatrix();
    }
}
