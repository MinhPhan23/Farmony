public class NPC extends Interactable
{

  private String name;
  private PFont fontName = createFont("Arial", 14);
  private PFont fontDialog = createFont("Arial", 12);
  private PImage choicebox = loadImage("map/choicebox.png");
  private int time;
  private int choice = 0;

  boolean narrate;
  boolean meetingState;
  boolean goodbyeState;
  boolean genericState;
  boolean waiting;
  boolean talking;

  private String dialog;
  private String[] words;
  
  private int countCurrLetters = 0; //count the length of the curr read letter
  private int maxLetters = 10; //max words in each line
  
  private String currDialog= "";
  private int dialogInd = 0;

  //conversation script of NPC
  Convo meeting = new Convo();
  Convo goodbye = new Convo();
  Convo generic = new Convo();

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
    meeting.setCurr();
    goodbye.setCurr();
    generic.setCurr();
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
    
    if(countCurrLetters > maxLetters){
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
    text(currDialog, 0, 0); //<>//
    
    popMatrix();
  }

  private void msgIterate() {
    if (dialogInd < words.length) {
      currDialog +=" "+words[dialogInd];
      if(currDialog.charAt(currDialog.length()-1)=='\n')
      {
        countCurrLetters = 0;
      }
      dialogInd++; //<>//
      countCurrLetters++;
    } 
    else {
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
    if (meetingState)
    {
      if (meeting.isOption()) {
        String[] option = meeting.getOption();
        dialog = "1 "+option[0]+"\n"+ " 2 "+ option[1]+"\n";
        if (option[2].length() > 0) 
          dialog+=" 3 "+option[2];
        waiting = true;
      } else
      {
        dialog = meeting.getCurrDialog(0);
        name = meeting.getCurrName();
      }

      if (meeting.isOption() && choice == 0) 
      {
        narrate = true;
      } else if (meeting.isOption())
      {
        narrate = true;
        meeting.next(choice);
        dialog = meeting.getCurrDialog(0);
        name = meeting.getCurrName();
        currDialog = "";
        dialogInd = 0;
        time = 0;
        waiting = false;
      }
      
      words = split(dialog," ");

      if (narrate)
      {
        spawnDialog();
      } else
      {
        if (meeting.hasNext())
        {
          setNarrate();
          meeting.next(0);
        } else
        {
          talking = false;
          meetingState = false;
        }
      }
      choice = 0;
    } else if (goodbyeState)
    {
      if (goodbye.isOption()) {
        String[] option = goodbye.getOption();
        dialog = "1 "+option[0]+"\n"+ " 2 "+ option[1]+"\n";
        if (option[2].length() > 0) 
          dialog+=" 3 "+option[2];
        waiting = true;
      } else
      {
        dialog = goodbye.getCurrDialog(0);
        name = goodbye.getCurrName();
      }

      if (goodbye.isOption() && choice == 0)
      {
        narrate = true;
      } else if (goodbye.isOption())
      {
        narrate = true;
        goodbye.next(choice);
        dialog = goodbye.getCurrDialog(0);
        name = goodbye.getCurrName();
        currDialog = "";
        dialogInd = 0;
        time = 0;
        waiting = false;
      }
      
      words = split(dialog," ");

      if (narrate)
      {
        spawnDialog();
      } else
      {
        if (goodbye.hasNext())
        {
          setNarrate();
          goodbye.next(0);
        } else
        {
          talking = false;
          goodbyeState = false;
        }
      }
      choice = 0;
    } else
    {
      dialog = generic.getCurrDialog(0);
      name = generic.getCurrName();
      words = split(dialog," ");

      if (narrate)
      {
        spawnDialog();
      } else
      {
        if (generic.hasNext())
        {
          setNarrate();
          generic.next(0);
        } else
        {
          generic.setCurr();
          talking = false;
        }
      }
    }
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
}
