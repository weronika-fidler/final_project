public class Entity{
  public PVector position, direction;
  public PImage sprite;
  public float rotation;
  
  void move(){
  }
  public void updatePosition(){
      this.position = new PVector(position.x + direction.x, position.y + direction.y);
      if (!(this instanceof Bullet)) this.direction = new PVector(0,0);
    }
}

public class Enemy extends Entity{
  boolean alive;
  int hp = 1;
  public Enemy(String type, String enemycolor){
    if(type.equals("Boss")) { sprite = loadImage("boss.png"); }
    else if (enemycolor == "Red")  {sprite = loadImage("redenemy.png"); }
    else if (enemycolor == "Yellow") {sprite = loadImage("yellowenemy.png");}
    }
    
  }

  
  void loop(){
    ArrayList<Enemy> enemies = new ArrayList<Enemy>();
    for (int enemy = 0; enemy < enemies.size(); enemy++){
      if (isEnter = true){
        Enemy temp = new Enemy("not boss", "blue");
        temp.position = new PVector(0, 0.33 * height);
        temp.direction = new PVector(1,0);
        enemies.add(temp);
        
        
      }
    }
    
    
  }
  
  void fire(){
    Bullet temp = new Bullet("not player");
    temp.direction = new PVector(0,-1);
    temp.position = new PVector(this.position.x, this.position.y);
    bullets.add(temp);
  }
  



public class Player extends Entity{
  boolean alive;
  boolean captured;
  int hp = 1;
  int points = 0;
  int ships = 1;
  int lives = 3;
  
  
  
  void fire(){
    if (bullets.size() < 3){
      Bullet temp = new Bullet( "player" );
      temp.direction = new PVector(0,-1);
      temp.position = new PVector(this.position.x, this.position.y);
      bullets.add( temp ) ;
    }
  }
  
  void move(){
      if (keys[0] != 0 && position.y != 0) { direction = new PVector( direction.x , keys[0]); } // up
      if (keys[1] != 0 && position.y != 63) { direction = new PVector( direction.x , keys[1]); } // down
      if (keys[2] != 0 && position.x != 0) { direction = new PVector(keys[2], direction.y); }  // left
      if (keys[3] != 0 && position.x != 46) { direction = new PVector(keys[3],direction.y); }   // right
      
      map[(int)position.y][(int)position.x] = null;
      updatePosition();
      map[(int)position.y][(int)position.x] = this;
      
      if (position.y <= 0 || position.y >= 63 || position.x <= 0 || position.x >= 46) { direction = new PVector(0,0); }
  }
  

  public Player() {
    sprite = loadImage("ship.png");
    sprite.resize(48,0);
    position = new PVector(map.length/2, map[0].length/2);
    direction = new PVector(0,0);
  }
}

public class Boss extends Enemy{
  public Boss(String type, String enemycolor){
    super(type,enemycolor);
  }
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
  void hasHit(){
    if (this.position.y == 0 || this.position.y == 63){
      bullets.remove(this);
    }
  }
}
