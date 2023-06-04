String[] startMenu = new String[]{"> PLAY", "EXIT"};
int startMenuSelected = 0;
boolean onPause = false;

void updateStartMenu(){
  startMenu[startMenuSelected] = startMenu[startMenuSelected].substring(2);
  if (keyCode ==  UP   || key == 'w'){
      if (startMenuSelected == 0) startMenuSelected = startMenu.length - 1;
      else startMenuSelected--;
    }
  if (keyCode == DOWN  || key == 's'){
      if (startMenuSelected == startMenu.length - 1) startMenuSelected = 0;
      else startMenuSelected++;
    }
  startMenu[startMenuSelected] = "> " + startMenu[startMenuSelected];
}

 void startSelection(){

   if  (startMenu[0].equals(startMenu[startMenuSelected])) {phase = 1;}
   if  (startMenu[1].equals(startMenu[startMenuSelected])) exit();
 }
 
String[] pauseScreen = new String[]{"> Continue", "Restart", "Back to Start", "Exit"}; 
int pauseScreenSelected = 0;
 
void updatePauseScreen(){
  pauseScreen[pauseScreenSelected] = pauseScreen[pauseScreenSelected].substring(2);
  if (keyCode ==  UP   || key == 'w'){
      if (pauseScreenSelected == 0) pauseScreenSelected = pauseScreen.length - 1;
      else pauseScreenSelected--;
    }
  if (keyCode == DOWN  || key == 's'){
      if (pauseScreenSelected == pauseScreen.length - 1) pauseScreenSelected = 0;
      else pauseScreenSelected++;
    }
  pauseScreen[pauseScreenSelected] = "> " + pauseScreen[pauseScreenSelected];
}
 void pauseSelection(){
   if  (pauseScreen[0].equals(pauseScreen[pauseScreenSelected])) {onPause = false; phase = 1;}
   if  (pauseScreen[1].equals(pauseScreen[pauseScreenSelected])) init();
   if  (pauseScreen[2].equals(pauseScreen[pauseScreenSelected])) {phase = 0;}
   if  (pauseScreen[3].equals(pauseScreen[pauseScreenSelected])) exit();
 }
 
 void init(){
   phase = 0;
   onPause = false;
   keys = new int[4];
   isEnter = false;
   map = new Entity[62][47];
   framerate = 22;
   enemies = new ArrayList<Enemy>();
   bullets = new ArrayList<Bullet>();
   score = 0;
   frameRate(framerate);
   player = new Player();
   for (int i = -1 ; i < 2 ; i++) {positionsFree.add(new PVector(map[0].length/2 - 5 * i, 0));}
   for (int i = 0 ; i < positionsFree.size(); i++) {
     PVector pos = positionsFree.get(0);
     Boss temp = new Boss();
     temp.position = pos;
     enemies.add(temp);
     positionsFree.remove(pos);
    }
   for (int i = -2 ; i < 3 ; i++) {positionsFree.add(new PVector(map[0].length/2 - 5 * i, 5));}
   for (PVector pos : positionsFree){
     Enemy temp = new Enemy("Yellow");
     temp.position = pos;
     enemies.add(temp);
   }
}
