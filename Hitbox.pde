/*
Reactangular area around an object that count as collision when player reach the border of that area
*/
public class Hitbox
{
    private float left, right, top, bottom;

    /*
    Contructor, take in top left x coordinate, top right x coordinate, 
    top y coordinate and bottom y coordinate of a rectangle
    */
    Hitbox(float l, float r, float t, float b)
    {
        left = l;
        right = r;
        top = t;
        bottom = b;
    }

    /*
    Determine if player collide with left or right side of an object
    if collide, the player should not be able to move nearer the object
    */
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

    /*
    Determine if player collide with top or bottom side of an object
    if collide, the player should not be able to move nearer the object
    */
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

    /*
    change the size (positions) of the hit box
    */
    public void setHitbox(float l, float r, float t, float b)
    {
        left = l;
        right = r;
        top = t;
        bottom = b;
    }
}
