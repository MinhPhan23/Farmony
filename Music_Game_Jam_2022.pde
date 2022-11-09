void setup()
{
    size(800, 600, P3D);
    colorMode(RGB, 1.0f);
    textureMode(NORMAL);
    textureWrap(CLAMP);
    noStroke();
    currNPC = new NPC(200, 250, 200, 300, loadImage("man.png"), "Minh", "Hello there");
}

void draw()
{
    clear();
    currNPC.drawObj();
    if (!timeout)
    {
      currNPC.spawnDialog();
      timeout = currNPC.timeout();
    }
}
