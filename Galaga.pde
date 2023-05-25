Entity[][] map = new Entity[height/16][width/15];
int framerate = 20;
ArrayList<Enemy> test = new ArrayList<Enemy>();
Player player;
float score = 0;


void setup(){
  size(250*3,250*4);
  background(0);
  PFont bit;
  bit = createFont("bit.ttf", 24);
  textFont(bit);
  fill(255,0,0);
  text("1UP", 15, 25);
  text("HIGH SCORE", 2* width / 6 , 25);
  player = new Player();
}


void draw(){
  if(phase = 0){
    background(0);
    text("PLAY", 2 * width / 6, length / 4);
}

void keyPressed() {
  if (key == CODED){
  if (keyPressed){
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
