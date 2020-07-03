void drawBarriers()
{
  int barrierCount = 0;
  while (barrierCount < barrierX.length)
  {
    noStroke();
    fill(barrierR, barrierG, barrierB);
    rect(barrierX [barrierCount], barrierY [barrierCount], barrierWidth, barrierHeight);
    
    barrierCount ++;
  }
}

