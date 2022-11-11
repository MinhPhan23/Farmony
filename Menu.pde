public class Menu {

  // Variables
  private PFont title;
  private PFont body;

  public Menu() {
    title = createFont("Arial", 28);
    body = createFont("Arial", 12);
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
    textAlign(CENTER, CENTER);
    fill(255, 255, 255);
    translate(-screenWidth/16, -screenHeight/8);
    text("Plant game", 0, 0);

    textFont(body);
    translate(0, 2*(textAscent() + textDescent()));
    text("Press any key to continue", 0, 0);
    popMatrix();
  }
}
