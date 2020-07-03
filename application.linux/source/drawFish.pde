void drawFish() 
{
  noStroke();
  fill (fishR, fishG, fishB); 

  // Draw the body
  rect (fishX, fishY, fishWidth, fishHeight); 

  // Eye
  // The position offset of the eye from the body
  int eyeX = fishX + fishWidth / 2;
  int eyeY = fishY + fishHeight / 2;

  // The diameter of the eye
  int eyeDiameter = 10;

  // The eyeColour
  int eyeR = 0;
  int eyeG = 255;
  int eyeB = 0;

  // Set the eye colour
  fill (eyeR, eyeG, eyeB);

  // Draw the eye
  ellipse (eyeX, eyeY, eyeDiameter, eyeDiameter);

  //Draw the tail
  for (int tailCount = 1, tailY = fishY; tailCount <= 5; tailCount ++, tailY = tailY + fishHeight / 4)
  {
    stroke(0);
    line(fishX, fishY + fishHeight / 2, fishX - fishWidth, tailY);
  }
}
