/* 
 Name: Alex Chlabicz 
 Student number: 43664636
 Date: 05/06/14
 Macquarie University COMP115 Assignment 3 Semester 1 2014 - "The Great Barrier Fish"
 */

//Press "P" key to toggle pause functionality. 
boolean isPaused;

final int N_BARRIERS = 10;
final int N_FOOD = 5;

//Fish parameters.
int fishWidth = 40;
int fishHeight = 40;

final int BLOCKS_TO_MOVE = 15;
final int LANES = 10;

//Parameters for each block. 
int [] barrierX = new int [N_BARRIERS];
int [] barrierY = new int [N_BARRIERS];
int barrierR = 240;
int barrierG = 10;
int barrierB = 50;
int barrierWidth = fishWidth;
int barrierHeight = fishHeight;

//Parameters for food blocks.
int [] foodX = new int [N_FOOD];
int [] foodY = new int [N_FOOD];
int foodR = 0;
int foodG = 255;
int foodB = 0;
int foodWidth = fishWidth;
int foodHeight = fishHeight;

//The components of the water colour.
int waterR = 89;
int waterG = 181;
int waterB = 188;

//The current position of the fish.
int fishX;
int fishY;

//The components of the fish colour (start red).
int fishR = 0;
int fishG = 0;
int fishB = 255;

int score;

int timer = 60;

void setup () 
{
  isPaused = false;

  frameRate(60);

  //Set up the window
  size (fishWidth * BLOCKS_TO_MOVE, fishHeight * LANES); 

  //Clear the background so that the previous drawing is erased.
  background(waterR, waterG, waterB);

  //Set barrier parameters for displaying them.
  setBarriers();

  //Set food block parameters for displaying them.
  setFood();

  //Set initial position of fish.
  fishX = 0 - fishWidth;
  fishY = 0 + int(random(0, height / fishHeight)) * fishHeight;

  score = 0;
}

void draw () 
{
    background(waterR, waterG, waterB);

    drawFish();

    //Ensure fish stays between top and bottom boundaries of the window.
    fishY = constrain(fishY, 0, height - fishHeight);

    //Move fish towards the right.
    fishX = fishX + 2;

    drawBarriers();

    drawFood();

    //Reset barriers and fish if fish escapes.
    if (fishX == width + 2 * fishWidth)
    {
      score = score + 3;

      setBarriers();

      setFood();

      fishX = 0 - fishWidth;
      fishY = 0 + int(random(0, height / fishHeight)) * fishHeight;

      drawFish();

      drawBarriers();

      drawFood();
    }

    //Display score
    fill(0);
    textSize(25);
    text("Score: " + score, 20, 30);

    //Display timer
    fill(0);
    textSize(25);
    text("Time Remaining: " + -(millis() / 1000 - timer), 20, height - 30);

    //Stop game and display score when time is up.
    if (millis() / 1000 >= 60)
    {
      background(waterR, waterG, waterB);
      text("Game Over!", width / 2 - 40, height / 2);
      text("Score: " + score, width / 2 - 40, height / 2 + 40);
      
      noLoop();
    }

    //If fish collides with a barrier, deduct 3 points and start again.
    for (int index = 0; index < barrierX.length; index ++)
    {
      if ((barrierX [index] - fishWidth <= fishX) && (fishX <= barrierX [index] + fishWidth) && !(fishY < barrierY [index] || fishY + fishHeight > barrierY [index] + barrierHeight))
      {
        score = score - 3;

        setBarriers();

        setFood();

        fishX = 0 - fishWidth;
        fishY = 0 + int(random(0, height / fishHeight)) * fishHeight;

        drawFish();

        drawBarriers();

        drawFood();
      }
    }

    //If fish collides with a food block, give 1 point.
    for (int index = 0; index < foodX.length; index ++)
    {
      if ((foodX [index] - fishWidth <= fishX) && (fishX <= foodX [index] + fishWidth) && !(fishY < foodY [index] || fishY + fishHeight > foodY [index] + foodHeight))
      {
        score ++;

        foodX [index] = width * 2;
      }
    }
}

//User-controlled movement of fish and pausing functionality.
void keyPressed()
{
  if (keyCode == UP)
  {
    fishY = fishY - fishHeight;
  }
  else if (keyCode == DOWN)
  {
    fishY = fishY + fishHeight;
  }
  else if (key == 'p')
  {
    if (!isPaused)
    {
      noLoop();
      isPaused = !isPaused;
    }
    else
    {
      loop();
      isPaused = !isPaused;
    }
  }
  
  //Ensure fish stays between top and bottom boundaries of the window.
  fishY = constrain(fishY, 0, height - fishHeight);
}

