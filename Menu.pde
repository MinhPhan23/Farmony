public class Menu {

  // Variables
  private PFont title;
  private PFont body;
  private float screenWidth;
  private float screenHeight;
  
  public Menu() {
    title = createFont("Arial", 28);
    body = createFont("Arial", 12);
    screenWidth = width;
    screenHeight = height;
  }

  public void drawMenu() {
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
    translate((screenWidth/2), (screenHeight/2)-15);
    text("Farmony", 0, 0);

    textFont(body);
    translate(0, 2*(textAscent() + textDescent()));
    text("Press any key to continue", 0, 0);
    popMatrix();
  }
}
