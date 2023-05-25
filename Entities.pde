public class Entity{
  public PImage sprite;
  public PVector position;
  public PVector direction;
  
  public void updatePosition(){
    // new vector = current positon + direction
  }

}

public class Enemy extends Entity{

}

public class Player extends Entity{
  public Player() {
    sprite = loadImage("ship.png");
    position = new PVector( 0, 0);
    direction = new PVector(0,0);
  }
}
