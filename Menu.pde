public class Menu {

  // Variables
  private PFont title;
  private PFont body;
  private PFont footer;

  public Menu() {
    title = createFont("Arial", 32);
    body = createFont("Arial", 16);
    footer = createFont("Arial", 12);
  }

  public void drawMenu(float screenWidth, float screenHeight) {
    pushMatrix();
    beginShape();
    texture(loadImage("map/townfloor.jpg"));
    vertex(-screenWidth, -screenHeight, 0, 0);
    vertex(screenWidth, -screenHeight, 1, 0);
    vertex(screenWidth, screenHeight, 1, 1);
    vertex(-screenWidth, screenHeight, 0, 1);
    endShape();

    textFont(title);
    textAlign(LEFT, LEFT);
    fill(255, 255, 255);
    translate(-screenWidth/2, 0);
    text("Plant game", 0, 0);

    textFont(body);
    translate(0, textAscent() + textDescent());
    text("Press any key to continue", 0, 0);

    textFont(footer);
    translate(-screenWidth/4, screenHeight/3, 0.9);
    text("Art by Andrea Abellera", 0, 0);
    translate(0, textAscent() + textDescent());
    text("Written by Alec Finney", 0, 0);
    translate(0, textAscent() + textDescent());
    text("Programmed by Minh Pham, Fidelio Ciandy, & Jordon Hong", 0, 0);
    popMatrix();
  }
}
