int[][] map = new int[height/16][width/15];
int framerate = 20;
ArrayList<Enemy> test = new ArrayList<Enemy>();
Player player;
float score = 0;
int phase = 0;



void setup(){
  size(250*3,250*4);
  background(0);
  PFont bit;
  bit = createFont("bit.ttf", 24);
  textFont(bit);
  fill(255,0,0);
  text("1UP", 15, 25);
  text("HIGH SCORE", 2* width / 6 , 25);
  
  Player player = new Player();
}

void draw(){
}

void keyPressed() {
  if (key == CODED){
  if (keyPressed){
    if (keyCode == UP) {
      
    }
    if (keyCode == DOWN) {

    }
    if (keyCode == LEFT) {

    }
    if (keyCode == RIGHT) {

    }
  }
  }
}
