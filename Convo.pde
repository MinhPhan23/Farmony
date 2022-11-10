public class Convo
{
    private String[] meeting;
    private String[] generic;
    private String[] goodbye;

    public void Convo(String scriptMeet, String scriptGeneric, String scriptGoodbye)
    {
        meeting = loadStrings(scriptMeet);
        generic = loadStrings(scriptGeneric);
        goodbye = loadStrings(scriptGoodbye);
    }

    public void dialogBox()
    {
        textFont(fontDialog);
        pushMatrix();
        translate(playerX-195, playerY+80, 0.9);

        beginShape(QUADS);
        texture(choicebox); 
        vertex(0,0,  0,0);
        vertex(390,0,  1,0);
        vertex(390,60,  1,1);
        vertex(0,60,  0,1);
        endShape();
    }

    // methods for navigating the script files

    // getResponseLine takes the response given by the player (1, 2, or 3) as a char, the current line (% after the choice),
    // and the script we are using, and returns the line we need to jump to for the response
    private int getResponseLine(char response, int line, String[] script)
    {
        while true
        {
            if(script[line].charAt(0) == response)
                return line + 1;
            line++;
        }
    }

    private String choices(int line, String[] script)
    {
        
    }
}