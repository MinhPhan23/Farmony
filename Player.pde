class Player{
  //to store the player different images when walking
  private PImage[] playerSide = new PImage[7];
  private PImage[] playerUp = new PImage[7];
  private PImage[] playerDown = new PImage[7];
  
  //player size
  private float pWidth = 6.5;
  private float pHeight = 17;
  
  private float pSpeed = 1.5;
  
  //player position
  private float playerX;
  private float playerY;
  
  //the current image that's in use
  private PImage currImage;
  
  //detect the movement by arrow key
  private boolean keyUp= false;
  private boolean keyDown = false; 
  private boolean keyLeft = false;
  private boolean keyRight  = false;
  
  //to change the player angle or the way where the player looks
  private float playerAngle = 0;
  
  //control the frame of each images
  private int frameCtr = 0;
  
  //if the player object is created, it will directly load the images
  public Player(float X, float Y){
    playerX = X;
    playerY = Y;
    loadPlayer();
  }
  
  //load player images from the side,up and down looks
  private void loadPlayer(){
    for(int i = 0; i < 7; i++){
      playerSide[i] = loadImage("res/playersprite/playerside" + (i+1) + ".png");
      playerUp[i] = loadImage("res/playersprite/playerup" + (i+1) + ".png");
      playerDown[i] = loadImage("res/playersprite/playerdown" + (i+1) + ".png");
    }  
    currImage = playerDown[0];
  }
  
  //draw the player frame by frame
  public void drawPlayer(){
    frameCtr++;
    if(frameCtr == 60){
      frameCtr = 0;
    }
    
    //draw the player into the canvas
    pushMatrix();
    translate(playerX,playerY,0.1);//draw according to the current position
    rotateY(playerAngle);
    beginShape(QUADS);
    texture(currImage);
    
    //draw the player according to the current key that is pressed
    if(keyDown || keyUp || keyLeft || keyRight){
      //draw the down images
      if(keyDown){
        texture(playerDown[frameCtr/9]);
      }
      //draw the up images
      else if (keyUp){
        texture(playerUp[frameCtr/9]);
      }
      //draw the left images
      else if (keyLeft){
        texture(playerSide[frameCtr/9]);
      }
      //draw the right images
      else{
        texture(playerSide[frameCtr/9]);
      }
    }
    //it will be drawn based on the player width and height
    vertex(-pWidth,-pHeight,  0,0);
    vertex(pWidth,-pHeight,  1,0);
    vertex(pWidth,pHeight,  1,1);
    vertex(-pWidth,pHeight,  0,1);
    endShape();
    popMatrix();
    
  }
  
  //change the position of the playerX and playerY
  public void movePlayer(){
    //the max function is used to detect if the player is out of the map or no
    if(keyUp){
     playerY = max(playerY-pSpeed, -mHeight+pHeight);
    }
    if(keyDown){
      playerY = min(playerY+pSpeed, mHeight-pHeight);;
    }
    if(keyLeft){
      playerX = max(playerX-pSpeed, -mWidth+pWidth);
    }
    if(keyRight){
      playerX = min(playerX+pSpeed, mWidth-pWidth);
    }
  }
  
  //detect the up,down,left,right
  public void detectMovement(){
    if(key == CODED){
      if(keyCode == UP){
        keyUp = true;
      }
      else if (keyCode == DOWN){
        keyDown = true; 
      }
      else if (keyCode == LEFT){
        keyLeft = true; 
        playerAngle = PI;
      }
      else if (keyCode == RIGHT){
        keyRight = true; 
        playerAngle = 0;
      }
    }
  }
  
  //player stop moving if the key is released
  public void movementReleased(){
    if(key == CODED){
      if(keyCode == UP){
        keyUp = false;
        currImage = playerUp[frameCtr/9];
      }
      else if (keyCode == DOWN){
        keyDown = false; 
        currImage = playerDown[frameCtr/9];
      }
      else if (keyCode == LEFT){
        keyLeft = false;
        currImage = playerSide[frameCtr/9];
      }
      else if (keyCode == RIGHT){
        keyRight = false;
        currImage = playerSide[frameCtr/9];
      }
    }
  }
  
  //get the current X position of the player 
  public float getPlayerX(){
    return playerX;  
  }
  //get the current Y posisition of the player
  public float getPlayerY(){
    return playerY; 
  }
}