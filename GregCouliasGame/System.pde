class system
{
  public int lives, score;
  private int numberOfElk, numberOfOx, currentLevel;
  private PImage bear;
  
  system()
  {
    lives = 3;
    currentLevel = 0;
    score = 0;
    numberOfElk = 2;
    numberOfOx = 0;
    bear = loadImage("bear3.png");
  }
  
  public void displayGameOverScreen()
  {
    textSize(40);
    background(0);
    text("Game over",width/2,height/3);
    fill(255);
    text("Score = " + score,width/2,height/2);
    text("Click Here To Try Again",width/2,height-height/4);
  }
  
  public void displaySplashScreen()
  {
    textSize(40);
    background(0);
    text("Bear Game",width/2,height/3);
    fill(255);
    text("Click Here To Start",width/2,height/2);
    textSize(20);
    text("Instructions",width/2-width/3,height/2);
    text("Click to move the bear.",width/2-width/3,height/2+20);
    text("Hit the other animals before",width/2-width/3,height/2+40);
    text(" they make it to the goal.",width/2-width/3,height/2+60);
    image(bear,width/2,height-height/4,200,200);
  }
  
  public void displayLivesAndScores()
  {
    text("Lives = " + lives,1020,25);
    text("Score = "+ score,1020,50);
    text("Level = "+ currentLevel,80,50);
    fill(0);
  }
  
  public boolean checkStartClick()
  {
    if (abs(width/2-mouseX)<100 && abs(height/2-mouseY)<100)
    {
      return true;
    }
    return false;
  }
  
  public void startLevel()
  {
    goal1 = new goal(400,600);
    // this array uses polymrphism to contain objects of the two subclasses of enemy
    enemies = new ArrayList<enemy>();
    currentLevel++;
   
   // the number of elk goes up on even levels and the number of ox on odd levels
    if (currentLevel % 2 == 0)
    {
      numberOfElk++;
    }
    else
    {
      numberOfOx++;
    }
    
    for(int i = 0;i<numberOfElk;i++)
    {
      enemies.add(new elk(i*100,50,1,1,goal1,50));
    }
    
    for(int i = 0;i<numberOfOx;i++)
    {
      enemies.add(new ox(width-i*100,50,1,1,goal1,50));
    }
    
    
  }
  
  
  public boolean endGame()
  {
    if (lives <= 0)
    {
      return false;
    }
    return true;
  }
  
  public void restartGame()
  {
    if (abs(width/2-mouseX)<100 && abs(height-height/4-mouseY)<100)
    {
      score = 0;
      currentLevel = 0;
      lives = 3;
      numberOfElk = 2;
      numberOfOx = 0;
      startLevel();
      player1.x = 650;
      player1.y = 500;
      player1.mouseClickedPosX = 650;
      player1.mouseClickedPosY = 500;
      currentGameMode = gameMode.splashScreen;
    }
    
  }
}
