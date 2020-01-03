class ox extends enemy
{
  private final String animalName = "ox";
  private int speedBoostDuration = 40;
  
  ox(int x, int y, int dx, int dy, goal goal,int size) 
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
     // when the player characters gets near horizontally the ox will have a speedboost downwards
     if (abs(this.x-player1.x)<150 && abs(this.y-player1.y)<20 && speedBoostDuration >= 1)
     {
       y += 3;
       speedBoostDuration--;
     }
     
   }
}
