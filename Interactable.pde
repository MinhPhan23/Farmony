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
        bot = b;
        hitbox = new Hitbox(l, r, t, b);
    }

    public void drawObj()
    {
        beginShape(QUADS);
        texture(boxTexture);
        vertex(left, top,  0,0);
        vertex(right, top,  1,0);
        vertex(right, bottom,  1,1);
        vertex(left, bottom,  0,1);
        endShape();
    }
}