class elk extends enemy
{
  private final String animalName = "elk";
  private int dodges = 1;
  elk(int x, int y, int dx, int dy, goal goal,int size) 
  {
    super(x,y,dx,dy,goal,size);
    for (int i = 0;i<images.length;i++)
    {
      images[i] = loadImage(animalName + i + ".png");
    }
  }
  
  
  @Override protected void move()
  {
    super.move();
    // when the player character gets near the elk will doge backwards once
    if (abs(this.x-player1.x)<70 && abs(this.y-player1.y)<70 && dodges >= 1)
    {
      x += this.x-player1.x;
      dodges--;
    }
  }
  
}
