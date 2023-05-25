public class Entity{
<<<<<<< HEAD
  PVector position, direction;
  PImage sprite;
  float rotation;
  
  void move(){
=======
  public PImage sprite;
  public PVector position;
  public PVector direction;
  
  public void updatePosition(){
    this.position = new PVector(position.x + direction.x, position.y + direction.y);
>>>>>>> 2c085cd628ebb79928a45be25771c69cd496c3df
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
<<<<<<< HEAD
  boolean alive;
  boolean captured;
  int hp; = 1
  int points = 0;
  int ships 1;
  int lives = 3;
  
  
  
  void fire(){
  }
  

=======
  public Player() {
    sprite = loadImage("ship.png");
    position = new PVector(1000/32, 750/30);
    direction = new PVector(0,0);
  }
>>>>>>> 2c085cd628ebb79928a45be25771c69cd496c3df
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
