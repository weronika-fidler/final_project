public class Entity{
  public PImage sprite;
  public PVector position;
  public PVector direction;
  
  public void updatePosition(){
    this.position = new PVector(position.x + direction.x, position.y + direction.y);
  }

}

public class Enemy extends Entity{

}

public class Player extends Entity{
  public Player() {
    sprite = loadImage("ship.png");
    position = new PVector(1000/32, 750/30);
    direction = new PVector(0,0);
  }
}
