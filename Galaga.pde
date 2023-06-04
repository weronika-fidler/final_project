static int[] keys;
boolean isEnter;
static Entity[][] map;
int framerate;
static ArrayList<Enemy> enemies;
static ArrayList<Bullet> bullets;
Player player;
int phase;
float score;
PFont textFont;
ArrayList<PVector> positionsFree = new ArrayList<PVector>();


void setup(){
  size(783, 997); // 192 x 250, 4x scale
  background(0);
  textFont = createFont("bit.ttf", 25);
  textFont(textFont);
  fill(255,0,0);
  init();
}


void draw(){
                                                                                                               // System.out.println(500+phase);
  if(phase == 0){
    background(0);
    for (int i = 0; i < startMenu.length ; i++){
      text(startMenu[i], 2 * width / 6, height / 4 + i * 45);
    }
  }
  if(phase == 1){
    background(0);
    if (onPause == false){
    text("1UP", 15, 25);
    text("HIGH SCORE", 2* width / 6 , 25);
    image(player.sprite, player.position.x * 16, player.position.y * 15 + 30);
    if (keyPressed) player.move();
    for (int i = 0 ; i < bullets.size() ; i++){
      Bullet temp = bullets.get(i);
      image(temp.sprite, temp.position.x * 16, temp.position.y * 15);
      temp.updatePosition();
      temp.hasHit();
    }
    for (int i = 0; i < enemies.size() ; i++){
      Enemy temp = enemies.get(i);
      image(temp.sprite, temp.position.x * 16, temp.position.y * 15 + 30  );
    }
  }
  }
  if(phase == 2){
    background(0);
    for (int i = 0; i < pauseScreen.length ; i++){
      text(pauseScreen[i], 2 * width / 6, height / 4 + i * 45);
    }
  }
}

void keyPressed() {
  if  (phase == 2){
    if (keyCode ==  UP   || key == 'w' || keyCode == DOWN  || key == 's') updatePauseScreen();
    if (keyCode == ENTER || key == ' ') pauseSelection();
    if (key == ESC) key = 0;
  }
    if (phase == 1 && onPause == false){
      if (keyCode ==  UP   || key == 'w') keys[0] = -1;
      if (keyCode == DOWN  || key == 's') keys[1] = 1;
      if (keyCode == LEFT  || key == 'a') { keys[2] = -1; }
      if (keyCode == RIGHT || key == 'd') { keys[3] = 1; }
      if (key == ' ') { player.fire(); }
      if (key == ESC) {key = 0; phase = 2; onPause = true;}
  }
  if  (phase == 0){
    if (keyCode ==  UP   || key == 'w' || keyCode == DOWN  || key == 's') updateStartMenu();
    if (keyCode == ENTER || key == ' ') startSelection();
    if (key == ESC) key = 0;
  }
}
void keyReleased() {
  if (phase == 1){
      if (keyCode ==  UP   || key == 'w') { keys[0] = 0; player.direction = new PVector(player.direction.x, 0); }
      if (keyCode == DOWN  || key == 's') { keys[1] = 0; player.direction = new PVector(player.direction.x, 0); }
      if (keyCode == LEFT  || key == 'a') { keys[2] = 0; player.direction = new PVector(0, player.direction.y); }
      if (keyCode == RIGHT || key == 'd') { keys[3] = 0; player.direction = new PVector(0, player.direction.y);}
      if (keyCode == ENTER && onPause == true) {onPause = false; keyCode = TAB; phase = 0;}
      if (phase == 1 && onPause == true) {keyCode = TAB; phase = 0; onPause = false;}
      
}
}
static void generateEnemies(){
    
}
