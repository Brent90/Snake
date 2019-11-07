Snake snake;
Food food;

void setup() {
  size(600, 600);
  frameRate(10);

  snake = new Snake();
  food = new Food();
  food.getNewLocation();

}

void draw() {
  background(50);
  snake.getScore();
  
  food.display();
  
  if(snake.intersectsWith(food.location)) {
    food.getNewLocation();
    snake.eat();
  }
  
  snake.checkIfGameIsOver();
  snake.display();
  snake.update();
}


void keyPressed() {

  if (keyCode == UP) {
    snake.setDirection(0, -1);
  } else if (keyCode == DOWN) {
    snake.setDirection(0, 1);
  } else if (keyCode == LEFT) {
    snake.setDirection(-1, 0);
  } else if (keyCode == RIGHT) {
    snake.setDirection(1, 0);
  }
}
