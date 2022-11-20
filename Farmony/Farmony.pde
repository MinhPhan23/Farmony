import com.jogamp.opengl.GLProfile;
{
  GLProfile.initSingleton();
}

void setup()
{
  size(800, 600, P3D);
  colorMode(RGB, 1.0f);
  textureMode(NORMAL);
  textureWrap(CLAMP);
  noStroke();
  loadAsset();
}

void draw()
{
  clear();
  ortho(-200, 200, -150, 150);
  gameplay();
}
