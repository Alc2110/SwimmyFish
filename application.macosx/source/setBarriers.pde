void setBarriers()
{
  //Populate the block arrays with values.
  for (int i = 0; i < barrierX.length; i ++)
  {
    barrierX [i] = int(random(0, width / fishWidth)) * fishWidth; 
  }
  for (int i = 0; i < barrierY.length; i ++)
  {
    barrierY [i] = int(random(0, height / fishHeight)) * fishHeight;  
  }
}
