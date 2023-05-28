public class Entity{
  public PVector position, direction;
  public PImage sprite;
  public float rotation;
  
  void move(){
  }
  public void updatePosition(){
      this.position = new PVector(position.x + direction.x, position.y + direction.y);
      this.direction = new PVector(0,0);
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
    Bullet temp = new Bullet( "player" );
    temp.direction = new PVector(0,-1);
    temp.position = new PVector(this.position.x, this.position.y);
      bullets.add( temp ) ;
  }
  

  public Player() {
    sprite = loadImage("ship.png");
    sprite.resize(48,0);
    position = new PVector(map.length/2, map[0].length/2);
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
  public Bullet(String type){
    if (type.equals("player")) { sprite = loadImage("playerbullet.png"); }
    else { sprite = loadImage("enemybullet.png"); }
  }
  void hit(){
    
  }
}
