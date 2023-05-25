public class Entity{
  PVector position, direction;
  PImage sprite;
  float rotation;
  
  void move(){
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
  int hp; = 1
  int points = 0;
  int ships 1;
  int lives = 3;
  
  
  
  void fire(){
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
