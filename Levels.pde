String[] startMenu = new String[]{"> PLAY", "EXIT", "SCORES"};
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
   if  (startMenu[2].equals(startMenu[startMenuSelected])) {
      phase = 4;
      try{ String content = new String(Files.readAllBytes(Paths.get(sketchPath("") + "\\data\\" + "score.txt"))); outScores = content.split(",");}
      catch(Exception ex){}
   }
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
   if  (pauseScreen[2].equals(pauseScreen[pauseScreenSelected])) frameCount = -1;
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
   ArrayList<PVector> positionsFree = new ArrayList<PVector>();
   score = 0;
   frameRate(framerate);
   player = new Player();
<<<<<<< HEAD
=======
   generateEnemies();
   /*for (int i = -1 ; i < 2 ; i++) {positionsFree.add(new PVector(map[0].length/2 - 5 * i, 0));}
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
    }*/
>>>>>>> 60eb45efdb223d900b9c8b741a6c21b32d24ea22
}
