import java.util.*;

class Snake {
  PVector location;
  PVector velocity;
  int length = 0;
  float gridScale = 20;
  List<PVector> totalSize = new ArrayList<PVector>();

  Snake() {
    location = new PVector(20, 20);
    velocity = new PVector(1, 0);
  }


  void update() {

    totalSize.add(location.copy());
    
    //prvent snake from growing continuously
    if(totalSize.size() > length) {
     totalSize.remove(0); 
    }

    location.x += (velocity.x * gridScale);
    location.y += (velocity.y * gridScale);

    //make sure snake can't go out of window
    location.x = constrain(location.x, 0, width-gridScale);
    location.y = constrain(location.y, 0, height-gridScale);
  }


  void display() {
    fill(225);
    noStroke();
    rect(location.x, location.y, gridScale, gridScale);

    for (PVector p : totalSize) {
      rect(p.x, p.y, gridScale, gridScale);
    }
  }


  void setDirection(int x, int y) {
    velocity.x = x;
    velocity.y = y;
  }


  boolean intersectsWith(PVector foodPosition) {
    
    float distance = dist(location.x, location.y, foodPosition.x, foodPosition.y);
    
    return distance < 2 ? true : false;
  }
  
  void checkIfGameIsOver() {
     for(PVector p : totalSize) {
        float distance = dist(p.x, p.y, location.x, location.y); 
        if(distance < 1){
          length = 0;
          totalSize.clear();
          break;
        }
        
     }
  }

  void eat() {
    length++;
  }
  
  
  void getScore() {
     text("Score: " + String.valueOf(length + 1), width-90, 20);

  }
  
}
