class goal
{
  public int x, y;
  private PImage fruitImage;
  
  goal(int x, int y) 
  {
    this.x = x;
    this.y = y;
    fruitImage = loadImage("apple.png");
  }
  
  public void render(int lives) 
  {
    if (lives == 3)
    {
      image(fruitImage,x,y-15,30,30);
      image(fruitImage,x-15,y+10,30,30);
      image(fruitImage,x+15,y+10,30,30);
    }
    else if(lives == 2)
    {
      image(fruitImage,x-15,y+10,30,30);
      image(fruitImage,x+15,y+10,30,30);
    }
    else if(lives == 1)
    {
      image(fruitImage,x+15,y+10,30,30);
    }
  }
 
}
