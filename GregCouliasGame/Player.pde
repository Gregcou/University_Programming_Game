class player
{
  private int x, y, dx, dy, animNum = 0, counter = 0,incriment = 1, attackAnimIncriment = 1, attackAnimCounter = 0;
  private PImage[] images = new PImage[12];
  private PImage[] attackImages = new PImage[3];
  public int attackAnimNum = 0, mouseClickedPosX, mouseClickedPosY;
  public boolean playingAttackAnimation = false;
  
  animationState currentState = animationState.idle;
  
  player(int x, int y, int dx, int dy) 
  {
    this.x = x;
    mouseClickedPosX = x;
    this.y = y;
    mouseClickedPosY = y;
    this.dx = dx;
    this.dy = dy;
    for (int i = 0;i<images.length;i++)
    {
      images[i] = loadImage("bear" + i + ".png");
    }
    
    for (int i = 0;i<attackImages.length;i++)
    {
      attackImages[i] = loadImage("claw" + i + ".png");
    }
  }
  
  
   public void update() 
   {
     render();
     move();
   }
   
   private void move()
   {
     // the player will move towards the last mouse click position 
     // while its x and y are different to the mouse clicks
     if (x < mouseClickedPosX) //<>//
     {
       x += dx;
     }
     else if (x > mouseClickedPosX)
     {
       x += -dx;
     }
     
     // based on whether the x or y is higher or lower than the mouse click position
     // a differnet animation state will be set which controls the current animation
     if (y < mouseClickedPosY)
     {
       y += dy;
       currentState = animationState.down;
     }
     else if (y > mouseClickedPosY)
     {
       y += -dy;
       currentState = animationState.up;
     }
     else if (y == mouseClickedPosY && x == mouseClickedPosX)
     {
       currentState = animationState.idle;
     }
     else if (y == mouseClickedPosY && x < mouseClickedPosX)
     {
       currentState = animationState.right;
     }
     else if (y == mouseClickedPosY && x > mouseClickedPosX)
     {
       currentState = animationState.left;
     }

   }
   
   private void render() 
    {
      // this sets the values passed to animate deciding which of the three
      // images in the array should be used for the current state
      if (currentState == animationState.up)
      {
        if (animNum  > 3)
        {
          animNum = 0;
        }
        animate(3);
      }
      else if(currentState == animationState.down)
      {
        if (animNum  < 2 || animNum > 6)
        {
          animNum = 3;
        }
        animate(6);
      }
      else if(currentState == animationState.right)
      {
        if (animNum  < 5 || animNum > 9)
        {
          animNum = 6;
        }
        animate(9);
      }
      else if(currentState == animationState.left)
      {
        if (animNum  < 8)
        {
          animNum = 9;
        }
        animate(12);
      }
      else if (currentState == animationState.idle)
      {
        image(images[4],x,y,50,50);
      }

      counter++;
    }
    
    private void animate(int currentArrayRange)
    {
      if (animNum == currentArrayRange)
      {
        animNum -= 2;
        incriment *= -1;
      }
      else if(animNum == currentArrayRange - 4)
      {
        animNum+=2;
        incriment *=-1;
      }
      
     
      if (counter < 20)
      {
        image(images[animNum],x,y,50,50);
      }
      else if (counter >= 20)
      {
        image(images[animNum],x,y,50,50);
        animNum+= incriment;
        counter =0;
      }
      
    }
    
    public void attackAnimation()
    {
      // this works the same as the other animations except it does not need to loop
      if (attackAnimCounter < 5)
      {
        image(attackImages[attackAnimNum],x,y,100,100);
      }
      else if (attackAnimCounter >= 5)
      {
        image(attackImages[attackAnimNum],x,y,100,100);
        attackAnimNum+= attackAnimIncriment;
        attackAnimCounter =0;
      }
      attackAnimCounter++;
    }
      
    
    
}
