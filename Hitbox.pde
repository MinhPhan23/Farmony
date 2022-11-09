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
    
    public boolean collide(Hitbox other)
    {
      boolean result = false;
      boolean hitX = collideX(other);
      boolean hitY = collideY(other);
      if (hitX && hitY)
      {
        result = true;
      }
      return result;
    }

    /*
    Determine if player collide with left or right side of an object
    if collide, the player should not be able to move nearer the object
    */
    private boolean collideX(Hitbox other)
    {
        boolean result = false;
        if (left < other.right && right > other.left)
        {
            result = true;
        }
        return result;
    }

    /*
    Determine if player collide with top or bottom side of an object
    if collide, the player should not be able to move nearer the object
    */
    private boolean collideY(Hitbox other)
    {
        boolean result = false;
        if (top < other.bottom && bottom > other.top)
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
