void setFood()
{
  //Populate the food block arrays with values
  for (int i = 0; i < foodX.length; i ++)
  {
    foodX [i] = int(random(0, width / fishWidth)) * fishWidth; 
  }
  for (int i = 0; i < foodY.length; i ++)
  {
    foodY [i] = int(random(0, height / fishHeight)) * fishHeight;  
  }
}

