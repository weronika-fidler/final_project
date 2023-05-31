String[] startMenu = new String[]{"> PLAY", "EXIT"};
int startMenuSelected = 0;

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
   if  (startMenu[0].equals(startMenu[startMenuSelected])) phase = 1;
   if  (startMenu[1].equals(startMenu[startMenuSelected])) exit();
 }
