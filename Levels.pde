String[] startMenu = new String[]{"> PLAY", "EXIT"};
int startMenuSelected = 0;

void updateStartMenu(){
                                                                                                   System.out.println(1000+phase);
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
                                                                                                   System.out.println(100+phase);
                                                                                                   System.out.println(startMenu[startMenuSelected]);

   if  (startMenu[0].equals(startMenu[startMenuSelected])) phase = 1;
                                                                                                   System.out.println(phase);
   if  (startMenu[1].equals(startMenu[startMenuSelected])) exit();
                                                                                                   System.out.println(200+phase);
 }
 
String[] pauseScreen = new String[]{"> Continue", "Restart", "Back to Start", "Exit"}; 
int pauseScreenSelected = 0;
 
void updatePauseScreen(){
                                                                                                   System.out.println("updatePauseScreen");
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
                                                                                                    System.out.println("PauseSelection");
   if  (pauseScreen[0].equals(pauseScreen[pauseScreenSelected])) {phase = 1; System.out.println(30+phase);}
   //if  (pauseScreen[1].equals(pauseScreen[pauseScreenSelected])) exit();
   if  (pauseScreen[2].equals(pauseScreen[pauseScreenSelected])) {phase = 0; System.out.println(30+phase);}
   if  (pauseScreen[3].equals(pauseScreen[pauseScreenSelected])) exit();
 }
 
