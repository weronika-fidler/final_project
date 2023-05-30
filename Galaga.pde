static int[] keys = new int[4];
static Entity[][] map = new Entity[64][47];
int framerate = 22;
static ArrayList<Enemy> enemies = new ArrayList<Enemy>();
static ArrayList<Bullet> bullets = new ArrayList<Bullet>();
Player player;
float score = 0;
PFont bit;


void setup(){
  size(783, 997); // 192 x 250, 4x scale
  background(0);
  frameRate(framerate);
  bit = createFont("bit.ttf", 25);
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
    if (keyPressed) player.move();
    for (int i = 0 ; i < bullets.size() ; i++){
      Bullet temp = bullets.get(i);
      image(temp.sprite, temp.position.x * 16, temp.position.y * 15);
      temp.updatePosition();
      temp.hasHit();
    }
  }
  
}

void keyPressed() {
    if (phase == 1){
      if (keyCode ==  UP   || key == 'w') keys[0] = -1;
      if (keyCode == DOWN  || key == 's') keys[1] = 1;
      if (keyCode == LEFT  || key == 'a') { keys[2] = -1; }
      if (keyCode == RIGHT || key == 'd') { keys[3] = 1; }
      if (key == ' ') { player.fire(); }
  }
}
void keyReleased() {
  if (phase == 1){
      if (keyCode ==  UP   || key == 'w') { keys[0] = 0;  player.direction = new PVector(player.direction.x, 0); }
      if (keyCode == DOWN  || key == 's') { keys[1] = 0; player.direction = new PVector(player.direction.x, 0); }
      if (keyCode == LEFT  || key == 'a') { keys[2] = 0; player.direction = new PVector(0, player.direction.y); }
      if (keyCode == RIGHT || key == 'd') { keys[3] = 0; player.direction = new PVector(0, player.direction.y);}
      
}
}
