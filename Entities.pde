public class Entity{
  public PVector position, direction;
  public PImage sprite;
  public float rotation;
  
  void move(){
  }
  public void updatePosition(){
      this.position = new PVector(position.x + direction.x, position.y + direction.y);
    }
}

public class Enemy extends Entity{
  boolean alive;
  
  void loop(){
  }
  
  void fire(){
  }
  

}

public class Player extends Entity{
  boolean alive;
  boolean captured;
  int hp = 1;
  int points = 0;
  int ships = 1;
  int lives = 3;
  
  
  
  void fire(){
  }
  

  public Player() {
    sprite = loadImage("ship.png");
    position = new PVector(1000/32, 750/30);
    direction = new PVector(0,0);
  }
}

public class Boss extends Enemy{
  int hp = 2;
  
  
  void fire(){
  }
  
  void steal(){
  }
  
}

public class Bullet extends Entity{
  void hit(){
  }
}
