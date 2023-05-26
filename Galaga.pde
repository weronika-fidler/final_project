Entity[][] map = new Entity[192*4/15][250*4/16];
int framerate = 20;
ArrayList<Enemy> test = new ArrayList<Enemy>();
ArrayList<Bullet> bullets = new ArrayList<Bullet>()
Player player;
float score = 0;
PFont bit;


void setup(){
  size(192*4, 250*4);
  background(0);
  bit = createFont("bit.ttf", 24);
  textFont(bit);
  fill(255,0,0);
  player = new Player();
}


void draw(){
  if(phase == 0){
    background(0);
    text("> PLAY", 2 * width / 6, height / 4);
  }
  if(phase == 1){
    background(0);
    text("1UP", 15, 25);
    text("HIGH SCORE", 2* width / 6 , 25);
    image(player.sprite, player.position.x * 16, player.position.y * 15);
    for(bullet: bullets){
      image(bullet.sprite, bullet.position.x * 16, bullet.position.y * 15)
      
    }
  }
  
}

void keyPressed() {
  if (key == CODED){
  if (keyPressed){
    if (phase == 1){
      if (keyCode == UP) { player.direction = new PVector(0,-1); }
      if (keyCode == DOWN) { player.direction = new PVector(0,1); }
      if (keyCode == LEFT) { player.direction = new PVector(-1,0); }
      if (keyCode == RIGHT) { player.direction = new PVector(1,0); }
      if (keyCode == UP || keyCode == DOWN || keyCode == LEFT || keyCode == RIGHT){
        map[(int)player.position.y][(int)player.position.x] = null;
        player.updatePosition();
        map[(int)player.position.y][(int)player.position.x] = player;
      }
    println(player.position.x + ", " + player.position.y);
    }
  }
  }
}
