class enemy
{
  private int dx, dy, animNum = 0, counter = 0,incriment = 1, size = 50;
  public int x, y;
  public PImage[] images = new PImage[3];

  
  private goal goal;

  enemy(int x, int y, int dx, int dy, goal goal,int size) 
  {
    this.x = x;
    this.y = y;
    // these two lines set the direction on the x and y planes that the enemy moves
    this.dx = dx;
    this.dy = dy;
    this.goal = goal;
    this.size = size;
  }
  
  
  private void render() 
  {
    /* 
     the counter will go up one every frame
     after twenty frames the next image will be displayed
     the animNum is the current image in the images array that is being used
     3 is out of the array so it goes back to 1 which is the middle image
     the incriment is made minus so it goes backwards through the array
     then when it reaches -1 also out of the array it switches back to positive
     this allows the 3 images to properly loop from right foot forward then 
     both together then left foot forward
    */
    if (animNum == 3)
    {
      animNum -= 2;
      incriment *= -1;
    }
    else if(animNum == -1)
    {
      animNum+=2;
      incriment *=-1;
    }
    
    if (counter < 20)
    {
      image(images[animNum],x,y,size,size);
    }
    else if (counter >= 20)
    {
      image(images[animNum],x,y,size,size);
      animNum+= incriment;
      counter =0;
    }
    
    counter++;
  }
  
  protected void move() 
  {
    // while the enemies x or y is less than the goals it will move towards it
    if (x <= goal1.x)
    {
      if (dx < 0)
      {
        dx = 1;
      }
    }
    else if (x >= goal1.x)
    {
      dx = -1;
    }
    
    if (y <= goal1.y)
    {
      dy = 1;
    }
    else if (y >= goal1.y)
    {
      dy = -1;
    }
    
    
    x += dx;
    y += dy;
  }
  
  public void update() 
  {
    render();
    move();
  }
  
  
  public Boolean checkPlayerHit()
  {
    if (abs(this.x-player1.x)<50 && abs(this.y-player1.y)<50)
    {
      return true;
    }
    return false;
  }
  
  
  
  public Boolean checkGoalHit()
  {
    if (abs(this.x-goal.x)<55 && abs(this.y-goal.y)<55)
    {
      return true;
    }
    return false;
  }
  
}
