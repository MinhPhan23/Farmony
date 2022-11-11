public class NPC extends Interactable //<>//
{

  private String name;
  private PFont fontName = createFont("Arial", 14);
  private PFont fontDialog = createFont("Arial", 10);
  private PImage choicebox = loadImage("map/choicebox.png");
  private int time;
  private int choice = 0;

  boolean narrate;
  boolean meetingState;
  boolean goodbyeState;
  boolean genericState;
  boolean hintState;
  boolean waiting;
  boolean talking;

  private String dialog;
  private String[] words;

  private int countCurrLetters = 0; //count the length of the curr read letter
  private int maxLetters = 11; //max words in each line

  private String currDialog= "";
  private int dialogInd = 0;

  //conversation script of NPC
  Convo meeting = new Convo();
  Convo goodbye = new Convo();
  Convo generic = new Convo();
  Convo hint = new Convo();

  NPC(float l, float r, float t, float b, PImage img, String pathMeeting, String pathGoodbye, String pathGeneric)
  {
    super(l, r, t, b, img);
    parseScript(pathMeeting, meeting);
    parseScript(pathGoodbye, goodbye);
    parseScript(pathGeneric, generic);

    time = 0;
    narrate = false;
    waiting = false;
    talking = false;

    meetingState = true;
    goodbyeState = true;
    genericState = true;
    hintState = true;
  }

  /*
    Print out textbox when player interact with
   */
  public void spawnDialog()
  {
    msgIterate();
    pushMatrix();
    translate(player.getPlayerX()-200, player.getPlayerY()+20, 0.9);
    textFont(fontDialog);
    beginShape(QUADS);
    texture(loadImage("map/choicebox.png"));
    vertex(0, 0, 0, 0);
    vertex(400, 0, 1, 0);
    vertex(400, 130, 1, 1);
    vertex(0, 130, 0, 1);
    endShape();

    if (countCurrLetters > maxLetters) {
      currDialog += "\n";
      countCurrLetters = 0;
    }

    textFont(fontName);
    textAlign(LEFT, LEFT);
    fill(0.2, 0.2, 0.15);
    translate(25, 20);
    text(name, 0, 0);
    translate(-20, 15);
    textFont(fontDialog);
    text(currDialog, 0, 0);

    popMatrix();
  }

  private void msgIterate() {
    if (dialogInd < words.length) {
      currDialog +=" "+words[dialogInd];
      dialogInd++;
      countCurrLetters++;
      if (currDialog.charAt(currDialog.length()-1)=='\n')
      {
        countCurrLetters = 0;
      }
    } else {
      time++;
      if (timeout()) {
        if (!waiting)
        {
          narrate = false;
          currDialog = "";
          dialogInd = 0;
        }
        countCurrLetters = 0;
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

  public boolean getNarrate() {
    return narrate;
  }

  public void setNarrate() {
    narrate = !narrate;
  }

  public void talking()
  {
    Convo current = state();
    if (current.isOption()) {
      String[] option = current.getOption();
      dialog = "1 "+option[0]+"\n"+ " 2 "+ option[1]+"\n";
      if (option[2].length() > 0)
        dialog+=" 3 "+option[2];
      waiting = true;
    } else
    {
      dialog = current.getCurrDialog(0);
      name = current.getCurrName();
    }

    if (current.isOption() && choice == 0)
    {
      narrate = true;
    } else if (current.isOption())
    {
      narrate = true;
      current.next(choice);
      dialog = current.getCurrDialog(0);
      name = current.getCurrName();
      currDialog = "";
      dialogInd = 0;
      time = 0;
      waiting = false;
    }

    words = split(dialog, " ");

    if (narrate)
    {
      spawnDialog();
    } else
    {
      if (current.hasNext())
      {
        setNarrate();
        current.next(0);
      } else
      {
        talking = false;
        current.setCurr();
        updateState();
      }
    }
    choice = 0;
  }

  public boolean isWaiting()
  {
    return waiting;
  }

  public void setWaiting()
  {
    waiting = !waiting;
  }

  public boolean isTalking()
  {
    return talking;
  }

  public void setTalking()
  {
    talking = !talking;
  }

  public void setInput(int n)
  {
    choice = n;
  }

  private Convo state()
  {
    Convo result;
    if (meetingState)
    {
      result = meeting;
    } else if (hintState)
    {
      result = hint;
    } else if (goodbyeState)
    {
      result = goodbye;
    } else
      result = generic;
    return result;
  }

  private void updateState()
  {
    if (meetingState)
    {
      meetingState = false;
    } else if (hintState)
    {
      hintState = false;
    } else if (goodbyeState)
    {
      goodbyeState = false;
    }
  }

  public void initConvo()
  {
    meeting.setCurr();
    goodbye.setCurr();
    generic.setCurr();
    hint.setCurr();
  }
}
