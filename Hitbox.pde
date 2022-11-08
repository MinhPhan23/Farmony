public class Hitbox
{
    private float left, right, top, bottom;

    Hitbox(float l, float r, float t, float b)
    {
        left = l;
        right = r;
        top = t;
        bottom = b;
    }

    public boolean collideX(Hitbox other)
    {
        boolean result = false;
        if ((left < other.left && right >= other.left) || 
        (right > other.right && left <= other.right) )
        {
            result = true;
        }
        return result;
    }

    public boolean collideY(Hitbox other)
    {
        boolean result = false;
        if ((top < other.top && bottom >= other.top) ||
        (bottom > other.bottom && top <= other.bottom))
        {
            result = true;
        }
        return result;
    }

    public void setHitbox(float l, float r, float t, float b)
    {
        left = l;
        right = r;
        top = t;
        bottom = b;
    }
}
