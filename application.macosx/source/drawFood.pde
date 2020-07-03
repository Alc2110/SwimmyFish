void drawFood()
 {
   {
     int foodCount = 0;
     while (foodCount < foodX.length)
     {
       noStroke();
       fill(foodR, foodG, foodB);
       rect(foodX [foodCount], foodY [foodCount], foodWidth, foodHeight);
 
       foodCount ++;
     }
   }
 }
