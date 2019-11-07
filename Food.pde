
class Food {
   float gridScale = 20;
   PVector location;
   
   void getNewLocation() {
     //make food align with snake
     int rows = floor(height/gridScale);
     int columns = floor(width/gridScale);
     //make food location be random
     int x = floor(random(2, rows - 10));
     int y = floor(random(columns)); 
     
     location = new PVector(x,y);
     
     //scale food position back to window size
     location.mult(gridScale);
     
   }
   
   
   void display() {
     fill(225, 0, 0);
    rect(location.x, location.y, gridScale, gridScale); 
   }

  
  
}
