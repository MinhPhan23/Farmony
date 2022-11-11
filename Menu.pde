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
    texture(loadImage("map/FARMONY.jpg"));
    vertex(0,0, 0, 0);
    vertex(650,0, 1, 0);
    vertex(650,450, 1, 1);
    vertex(0,450, 0, 1);
    endShape();

    textAlign(CENTER, CENTER);
    fill(255, 255, 255);
    translate((screenWidth/2), (screenHeight/2)-15);

    textFont(body);
    translate(0, 2*(textAscent() + textDescent()));
    text("Press any key to continue", 0, 0);
    popMatrix();
  }
}
