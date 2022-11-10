public class Seed extends Interactable
{
  private String name;
  private boolean picked;
  private boolean unlocked;  //make the seed visible after go through the hints
  private int time;
  private PFont fontName = createFont("Arial", 14);
  private PFont fontDialog = createFont("Arial", 12);
  private boolean narrate = false;

  private String dialog;
  private String currDialog= "";
  private int dialogInd = 0;

  Seed(float l, float r, float t, float b, PImage img, String name, String script)
  {
    super(l, r, t, b, img);
    this.name = name;
    dialog = script;
    unlocked = true;
    picked = false;
    time = 0;
  }

  /*
    Print out textbox when player interact with
   */
  public void spawnDialog()
  {
    msgIterate();
    pushMatrix();
    translate(player.getPlayerX()-195, player.getPlayerY()+80, 0.9);
    textFont(fontDialog);
    beginShape(QUADS);
    texture(loadImage("map/choicebox.png"));
    vertex(0, 0, 0, 0);
    vertex(390, 0, 1, 0);
    vertex(390, 60, 1, 1);
    vertex(0, 60, 0, 1);
    endShape();

    textFont(fontName);
    textAlign(LEFT, LEFT);
    fill(0.2, 0.2, 0.15);
    translate(25, 15);
    text(name, 0, 0);
    translate(-10, 15);
    textFont(fontDialog);
    text(currDialog, 0, 0);
    popMatrix();
  }

  private void msgIterate() {
    if (currDialog.length() < dialog.length()) {
      currDialog += dialog.charAt(dialogInd);
      dialogInd++;
    } else {
      time++;
      if (timeout()) {
        narrate = false;
        currDialog = "";
        dialogInd = 0;
      }
    }
  }
  /*
    Timer for the printed textbox
   Return true if the text is printed in 180 frames, false otherwise
   */
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

  // Getter and setter for narrate
  public boolean getNarrate() {
    return narrate;
  }

  public void setNarrate() {
    narrate = !narrate;
  }

  // Getter and setter for unlocked
  public boolean isUnlocked()
  {
    return unlocked;
  }

  public void unlock()
  {
    unlocked = true;
  }

  // Getter and setter for picked
  public boolean isPicked() {
    return picked;
  }

  public void pick()
  {
    picked = true;
  }
}
