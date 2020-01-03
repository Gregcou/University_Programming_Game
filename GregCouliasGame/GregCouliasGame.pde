import java.util.ArrayList;

// comments refer to the line or block underneath them
ArrayList<enemy> enemies;
goal goal1;
system system1;
player player1;
enum gameMode {splashScreen,playing,gameOverScreen};
gameMode currentGameMode = gameMode.splashScreen;
enum animationState {up,down,idle,left,right};
PImage background;

void setup() 
{
  textSize(40);
  size(1300,700);
  system1 = new system();
  player1 = new player(650,500,1,1);
  // sets up the first level for when the player starts
  system1.startLevel();
  background = loadImage("grassbackground.png");
} 

void mousePressed() 
{
  if (currentGameMode == gameMode.playing)
  {
    // these are the positions the player character moves to
    player1.mouseClickedPosX = mouseX;
    player1.mouseClickedPosY = mouseY;
  }
  else if (currentGameMode == gameMode.splashScreen)
  {
    if (system1.checkStartClick())
    {
      currentGameMode = gameMode.playing; 
    }
  }
  else if (currentGameMode == gameMode.gameOverScreen)
  {
    system1.restartGame();
  }
}

void draw() 
{
  // these two lines let the images and text be set from the middle point rather than the left corner
  imageMode(CENTER);
  textAlign(CENTER);
  
  switch(currentGameMode)
  {
    case splashScreen:
      system1.displaySplashScreen();
    break;
    case playing:
    // this checks if the player has lost all their lives
    if (system1.endGame())
    {
      textSize(25);
      image(background,650,350);
      system1.displayLivesAndScores();
      goal1.render(system1.lives);
      player1.update();
      
      // this loops through all enemies updating them and checking for collisions
      for (int i = 0;i<enemies.size();i++)
      {
        enemies.get(i).update();
          
        if (enemies.get(i).checkGoalHit())
        {
          system1.lives -=1;
          enemies.remove(i);
        }
      }
      for (int i = 0;i<enemies.size();i++)
      {
        if (enemies.get(i).checkPlayerHit())
        {
          player1.playingAttackAnimation = true;
          system1.score+=10;
          enemies.remove(i);
        }
      }
      
      // this plays the player attack animation when the player collides with an enemy
      if (player1.playingAttackAnimation == true)
      {
        if (player1.attackAnimNum == 3)
        {
          player1.playingAttackAnimation = false;
          player1.attackAnimNum = 0;
        }
        else
        {
          player1.attackAnimation();
        }
      }
       
      if (enemies.size() == 0)
      {
        system1.startLevel();
      }
    }
    else 
    {
      currentGameMode = gameMode.gameOverScreen;
    }
    break;
    case gameOverScreen:
      system1.displayGameOverScreen();
    break;
  }

}
