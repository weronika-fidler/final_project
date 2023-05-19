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
