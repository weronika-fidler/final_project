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
String playerName = "";
String[] outScores;
int frameCounter = 0;
int shootingInterval = 60;
static int lowestLevel;


void setup(){
  size(783, 997); // 192 x 250, 4x scale
  background(0);
  textFont = createFont("bit.ttf", 25);
  textFont(textFont);
  fill(255,0,0);
  init();
  
  
  
}



void draw(){
  if(phase == 0){
    background(0);
    for (int i = 0; i < startMenu.length ; i++){
      text(startMenu[i], 2 * width / 6, height / 4 + i * 45);
    }
    

  }
  if(phase == 1){
    background(0);
    if (onPause == false){
      if (frameCounter >= shootingInterval) {
      chooseEnemiesToShoot();
      frameCounter = 0;
    }
     
frameCounter++;
print(" ");
    text("1UP", 15, 25);
    text( (int) score, 15 , 60);
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
    if (enemies.size() == 0){
      generateEnemies();
      if (score != 0) framerate = framerate + 10;
    } 
  }
  }
  if(phase == 2){
    background(0);
    for (int i = 0; i < pauseScreen.length ; i++){
      text(pauseScreen[i], 2 * width / 6, height / 4 + i * 45);
    }
  }
  if (phase == 4){
    background(0);
    for (int i = 0 ; i < outScores.length && i < 12 ; i++){
      text(outScores[i], 60, 75 + i * 50);
    }
  }
  if(phase == 5){
    background(0);
    text("PLEASE ENTER YOUR NAME", 60, 150);
    text(playerName, 60, 200);
    text("THEN PRESS ENTER", 150, 450);
  }
}

void keyPressed() {
  if (phase == 5){
    if (key == ESC) key = TAB;
    if (key == BACKSPACE && playerName.length() > 0) {playerName = playerName.substring(0,playerName.length()-1);}
    else if (playerName.length() > 0 && key == ENTER) {
      try{saveScore(new Score(playerName, (int)score));} catch(Exception ex){}
      frameCount = -1;
    }
    else if (key != CODED) {playerName += key; key = TAB;}
  }
  if (phase == 4){
    if (keyCode == ESC || keyCode == BACKSPACE) {frameCount = -1; key = 0;}
  }
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
      if (key == BACKSPACE) phase = 5;
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

void generateEnemies(){
    for (int i = -1 ; i < 2 ; i++) {positionsFree.add(new PVector(map[0].length/2 - 5 * i, 0));}
   for (int i = 0 ; i < positionsFree.size(); ) {
     PVector pos = positionsFree.get(0);
     Boss temp = new Boss();
     temp.position = pos;
     enemies.add(temp);
     positionsFree.remove(0);
    }
   for (int i = -2 ; i < 3 ; i++) {positionsFree.add(new PVector(map[0].length/2 - 5 * i, 4));}
   for (int i = 0 ; i < positionsFree.size(); ) {
     PVector pos = positionsFree.get(0);
     Enemy temp = new Enemy("Yellow");
     temp.position = pos;
     enemies.add(temp);
     positionsFree.remove(0);
    }
    for (int i = -2 ; i < 3 ; i++) {positionsFree.add(new PVector(map[0].length/2 - 5 * i, 8));}
    for (int i = 0 ; i < positionsFree.size(); ) {
     PVector pos = positionsFree.get(0);
     Enemy temp = new Enemy("Red");
     temp.position = pos;
     enemies.add(temp);
     positionsFree.remove(0);
    }
}
