public class Entity{
  PImage sprite;
  PVector position;
  PVector direction;

}

public class Enemy extends Entity{

}

public class Player extends Entity{
  public Player() {
    sprite = loadImage("ship.png");
    position = new PVector( height/16/2, width/15/2);
    direction = new PVector(0,0);
  }
}
