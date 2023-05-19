boolean [] directions = new boolean[] {false, false, false, false};
PVector pos; // ship position
PVector dir = new PVector(0, 0); // ship direction (up, down, left right)


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
      directions = new boolean[] {true, false, false, false};
      dir = new PVector(0,-1);
    }
    if (keyCode == DOWN) {
      directions = new boolean[] {false, true, false, false};
      dir = new PVector(0,1);
    }
    if (keyCode == LEFT) {
      directions = new boolean[] {false, false, true, false};
      dir = new PVector(-1,0);
    }
    if (keyCode == RIGHT) {
      directions = new boolean[] {false, false, true, false};
      dir = new PVector(1,0);
    }
    for (boolean bool : directions) print(bool + " ");
    println();
  }
  }
}
