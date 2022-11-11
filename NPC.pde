public class NPC extends Interactable
{
  private PFont fontName = createFont("Arial", 14);
  private PFont fontDialog = createFont("Arial", 12);
  private PImage choicebox = loadImage("map/choicebox.png");

  //track state of conversation
  boolean narrate; //is printing the current sentence to canvas
  boolean meetingState; //is using meeting script
  boolean goodbyeState; //is using goodbye script
  boolean genericState; //is using generic script
  boolean hintState; //is using hint script
  boolean waiting; //is waiting for player to choose an option
  boolean talking; //the conversation is still going on

  private String dialog; //the current sentence
  private String name; //name of speaker
  private String[] words; //parse sentence to array of words

  private float dialWidth = 0; //length of current sentence on canvas
  private float maxWidth = 300;

  //print the sentence word by word
  private String currDialog= "";
  private int dialogInd = 0;

  private int time; //screen time of a sentence
  private int choice = 0; //player choice

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
    //iterate through every word
    if (dialogInd < words.length) { //<>//
      currDialog +=" "+words[dialogInd];      
      dialWidth+=textWidth(words[dialogInd]);

      //make a new line when exceed the width
      if (dialWidth > maxWidth)
      {
        dialWidth = 0;
        currDialog+="\n";
      }
      //count as new line when there is a linebreak in the string
      if (words[dialogInd].charAt(words[dialogInd].length()-1)=='\n')
      {
        dialWidth = 0;
      }
      dialogInd++;

    } else {

      time++;
      if (timeout()) {
        //keep draw sentence to canvas if player have not choosen an option
        if (!waiting)
        {
          narrate = false;
          currDialog = "";
          dialogInd = 0;
        }
        dialWidth = 0;
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

  //decide if the sentence will be printed
  public boolean getNarrate() {
    return narrate;
  }
  public void setNarrate() {
    narrate = !narrate;
  }

  //process and print current sentence to canvas and continue the conversation flow
  public void talking()
  {
    Convo current = state();
    //if the content is options, print out all of them with number
    if (current.isOption()) {
      String[] option = current.getOption();
      dialog = "1 "+option[0]+"\n"+ " 2 "+ option[1]+"\n";
      if (option[2].length() > 0)
        dialog+=" 3 "+option[2];
      waiting = true;
    } 
    //take the content normally
    else
    {
      dialog = current.getCurrDialog(0);
      name = current.getCurrName();
    }

    //wait and keep printing the old content if the player has not chosen
    if (current.isOption() && choice == 0)
    {
      narrate = true;
    } 
    //move to the chosen path
    else if (current.isOption())
    {
      narrate = true;
      current.next(choice);
      dialog = current.getCurrDialog(0);
      name = current.getCurrName();
      currDialog = "";
      dialogInd = 0;
      time = 0;
      dialWidth = 0;
      waiting = false;
    }

    words = split(trim(dialog), " ");

    if (narrate)
    {
      spawnDialog();
    } else
    {
      //move to next turn 
      if (current.hasNext())
      {
        setNarrate();
        current.next(0);
      } 
      //end conversation
      else
      {
        talking = false;
        current.setCurr();
        updateState();
      }
    }
    choice = 0;
  }

  //control waiting for player choice
  public boolean isWaiting()
  {
    return waiting;
  }
  public void setWaiting()
  {
    waiting = !waiting;
  }

  //control conversation
  public boolean isTalking()
  {
    return talking;
  }
  public void setTalking()
  {
    talking = !talking;
  }

  //set user input
  public void setInput(int n)
  {
    choice = n;
  }

  //return the correct script in-order
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

  //update the script at the end of conversation
  private void updateState()
  {
    if (meetingState)
    {
      meetingState = false;
    } else if (hintState)
    {
    } else if (goodbyeState)
    {
      goodbyeState = false;
    }
  }

  //initialize conversation
  public void initConvo()
  {
    meeting.setCurr();
    goodbye.setCurr();
    generic.setCurr();
    hint.setCurr();
  }
  
  //set hint control variable
  public void setHint()
  {
    hintState = false;
  }
}
