public class Letter { //<>// //<>//

  // Instance variables
  private String[] letters = new String[] {
    "If you're reading this, the worst has come to pass. We all knew this was the most likely outcome, but I know you were still hoping enough for the both of us. I've always loved that about you.\nI only have one request for you after I'm gone. Please finish my work on the garden. I know you've never been out much, and I always brought the world here to you, but now you need to do the same for your father. He's not able to do it on his own. Do it for me, but also, do it for him. I believe in you.",
    "\"The journey of a thousand miles begins with a single step.\"\nI always liked that phrase. You've taken the first one, my darling, and I know how that is often the hardest. There's no one else I'd rather your father have there for him.",
    "Do you remember when I brought you out with me, all those years ago? One of the few times I managed to drag you from your father's study and his songs? You made a whistle out of a blade of grass and played that instead. You're so like him, and I love you for it.\nI'm glad you're changing now, stepping out of your comfort zone. But don't change too much. Keep doing what makes you who you are.",
    "I always knew you could do it.\nI love you."
  };

  private String currLetter;
  private int letterInd;

  private int countNextLine = 0;//count the curr letter in the line
  private int countCurrLetters = 0; //count the length of the curr read letter
  private int maxLetters = 62; //max letter in each line
  private int boxFullCount = 0;//counter to detect if the text box is full

  private int time;
  private boolean reading;

  // Static variables
  private PFont body = createFont("Georgia", 12);
  private PFont name = createFont("Georgia", 14);

  // Constructor
  public Letter () {
    currLetter = "";
    letterInd = 0;
    time = 0;
    reading = false;
  }

  // display the letter on the screen
  public void read(int letterNum) {
    msgIterate(letterNum);
    pushMatrix();
    translate(player.getPlayerX()-195, player.getPlayerY()-100, 0.9);
    beginShape(QUADS);
    texture(loadImage("map/choicebox.png"));
    vertex(0, 0, 0, 0);
    vertex(390, 0, 1, 0);
    vertex(390, 300, 1, 1);
    vertex(0, 300, 0, 1);
    endShape();


    // if (countNextLine > maxLetters) {
    //   currLetter += "-\n";
    //   countNextLine = 0;
    //   countNextLine++;
    // }

    textFont(body);
    textAlign(LEFT, LEFT);
    fill(0.2, 0.2, 0.15);
    translate(25, 15);
    /*if (letterNum < letters.length-1)
     {
     text("Dearest,", 0, 0);
     }*/
    translate(-10, 15);
    text(currLetter, 0, 0);
    //<>// //<>//
    /*if (letterNum < letters.length - 1)
     {
     translate(0, 15);
     textFont(name);
     text("Mother", 0, 0);
     }*/

    popMatrix();

    countNextLine++;
    countCurrLetters++;
  }

  // Add animated text effect
  private void msgIterate(int letterNum) {
    if (letterInd < letters[letterNum].length()) {

      String word = "";
      int wordInd = letterInd;
      char nextLetter = letters[letterNum].charAt(letterInd);
      while (wordInd < letters[letterNum].length()-1 && nextLetter != ' ')
      {
        word += nextLetter;
        wordInd++;
        nextLetter = letters[letterNum].charAt(wordInd);
      }

      if (countNextLine + word.length() > maxLetters)
      {
        currLetter += "\n";
        countNextLine = 0;
      }

      currLetter += letters[letterNum].charAt(letterInd);
      letterInd++;
    } 
    else {
      time++;
      if (timeout()) {
        countNextLine = 0;
        countCurrLetters = 0;
        reading = false;
        currLetter= "";
        letterInd = 0;
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
    if (time > 180)
    {
      time = 0;
      result = true;
      reading = false;
    }
    return result;
  }

  // Getter and setter for to control textBox persistence
  public boolean isReading()
  {
    return reading;
  }

  public void setReading()
  {
    reading = !reading;
  }
}
