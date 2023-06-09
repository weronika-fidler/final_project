public class Entity{
  public PVector position, direction;
  public PImage sprite;
  public float rotation;
  
  void move(){
  }
  public void updatePosition(){
    position.add(direction);
    if (!(this instanceof Bullet)) this.direction = new PVector(0,0);
    }
}

public class Enemy extends Entity{
  String kind;
  boolean alive = true;
  int hp = 1;
  public Enemy(String enemycolor){
    if (enemycolor == "Red")  {sprite = loadImage("redenemy.png");}
    else if (enemycolor == "Yellow") {sprite = loadImage("yellowenemy.png");}
    kind = enemycolor;
    }
    
  void loop(){
    ArrayList<Enemy> enemies = new ArrayList<Enemy>();
    for (int enemy = 0; enemy < enemies.size(); enemy++){
      if (isEnter == true){
        Enemy temp = new Enemy("Blue");
        temp.position = new PVector(0, 0.33 * height);
        temp.direction = new PVector(1,0);
        enemies.add(temp);    
      }
    }
  }
  
  void fire(){
    Bullet temp = new Bullet("not player");
    temp.direction = new PVector(0,1);
    temp.position = new PVector(this.position.x, this.position.y);
    bullets.add(temp);
    }
  
  
}
void chooseEnemiesToShoot() {
        ArrayList<Enemy> selectedEnemies = new ArrayList<Enemy>();
        ArrayList<Enemy> availableEnemies = new ArrayList<Enemy>(enemies);
        
        for (int i = 0 ; i < enemies.size() ; i++){
          if (enemies.get(i).position.y == lowestLevel) availableEnemies.add(enemies.get(i));
        }
        for (int i = 0 ; i < availableEnemies.size() ; i++){
          if (Math.random() < 0.5) selectedEnemies.add(availableEnemies.get(i));
        }
        int numEnemiesToShoot = 3;
        for (int i = 0; i < numEnemiesToShoot && availableEnemies.size() > 0; i++) {
            int randomIndex = (int) random(availableEnemies.size());
            Enemy enemyToShoot = availableEnemies.get(randomIndex);
            selectedEnemies.add(enemyToShoot);
            availableEnemies.remove(randomIndex);
        }
        for (Enemy temp : selectedEnemies) temp.fire();
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
      if (keys[1] != 0 && position.y != 61) { direction = new PVector( direction.x , keys[1]); } // down
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
    position = new PVector(map[0].length/2, map.length - 1);
    direction = new PVector(0,0);
  }
}

public class Boss extends Enemy{
  public Boss(){
    super("Boss");
    sprite = loadImage("boss.png");
    hp = 2;
  }
  
  
 
  
}

public class Bullet extends Entity{
  String type;
  public Bullet(String type){
    if (type.equals("player")) { sprite = loadImage("playerbullet.png"); this.type = "player"; }
    else {sprite = loadImage("enemybullet.png"); this.type = "enemy";}
  }
  void hasHit(){
    if ( (this.position.y == 0 || this.position.y == 63 )){
      bullets.remove(this);
    }
  if (this.type.equals("player")){
  for (int i = 0 ; i < enemies.size() ; i++){
    Enemy temp = enemies.get(i);
    if ( Math.abs(position.x - temp.position.x) < 2 && Math.abs(position.y - temp.position.y) < 2){
      bullets.remove(this); temp.hp--;
      if (temp instanceof Boss && temp.hp == 1) temp.sprite = loadImage("bosshit.png");
      if (temp.hp == 0) {
        enemies.remove(temp);
        if(temp.kind == "Yellow") score += 50;
        if(temp.kind == "Red") score += 80;
        if(temp.kind == "Boss") score += 200;
      }
      
    }
   boolean lowLevel, midLevel, highLevel;
   lowLevel = midLevel = highLevel = false;
   for (Enemy tempTwo : enemies){
     if (tempTwo.position.y == 8) lowLevel = true;
     if (tempTwo.position.y == 4) midLevel = true;
     if (tempTwo.position.y == 0) highLevel = true; 
   }
   if (lowLevel == false) lowestLevel = 4;
   if (midLevel == false) lowestLevel = 0;
   if (highLevel == false) lowestLevel = 8;
  }
  }
  
  for (int i = 0 ; i < enemies.size() ; i++){
    Enemy temp = enemies.get(i);
    if ( Math.abs(position.x - temp.position.x) < 2 && Math.abs(position.y - temp.position.y) < 2){
      bullets.remove(this); temp.hp--;
      if (temp instanceof Boss && temp.hp == 1) temp.sprite = loadImage("bosshit.png");
      if (temp.hp == 0) {
        enemies.remove(temp);
        if(temp.kind == "Yellow") score += 50;
        if(temp.kind == "Red") score += 80;
        if(temp.kind == "Boss") score += 200;
      }
    }
 
  }
  }
}
