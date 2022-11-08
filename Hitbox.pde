public class Hitbox
{
    private float left, right, top, bottom;

    Hitbox(float l, float r, float t, float b)
    {
        left = l;
        right = r;
        top = t;
        bot = b;
    }

    public boolean collide(Hitbox other)
    {
        boolean result = false;
        if ((left < other.left && right >= other.left) || 
        (right > other.right && left <= other.right) || 
        (top > other.top && bottom <= other.top) ||
        ())
            {
                collide = true;
            }
    }

    public void setHitbox(float l, float r, float t, float b)
    {
        left = l;
        right = r;
        top = t;
        bot = b;
    }
}
