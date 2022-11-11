//A parent class contains all interactable objects
public class Interactable
{
  private PImage texture; //image of the object
  private float left, right, top, bottom;
  private Hitbox hitbox;
  private final int TIMEOUT = 100;

  /*
    Contructor, take in top left x coordinate, top right x coordinate,
   top y coordinate and bottom y coordinate of a rectangle
   */
  Interactable(float l, float r, float t, float b, PImage img)
  {
    texture = img;
    left = l;
    right = r;
    top = t;
    bottom = b;
    hitbox = new Hitbox(l, r, t, b);
  }
  
  //normal object that can be used to cover;
  Interactable(float l, float r, float t, float b, PImage img, boolean creteHitbox)
  {
    texture = img;
    left = l;
    right = r;
    top = t;
    bottom = b;
  }

  //draw the object to canvas
  public void drawObj()
  {
    pushMatrix();
    if (bottom > player.getPlayerY() + player.getPlayerHeight()) {
      translate(0, 0, 0.15);
    } else {
      translate(0, 0, 0.05);
    }
    beginShape(QUADS);
    texture(texture);
    vertex(left, top, 0, 0);
    vertex(right, top, 1, 0);
    vertex(right, bottom, 1, 1);
    vertex(left, bottom, 0, 1);
    endShape();
    popMatrix();
  }

  //get object hitbox
  public Hitbox getHitbox()
  {
    return hitbox;
  }
}
