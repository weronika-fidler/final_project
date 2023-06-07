public class Score{
  String name;
  int score;
  
<<<<<<< Updated upstream
  public Score(String name, int score){
    this.name = name;
    this.score = score;
=======
  public int addScore(String name, int score, String enemycolor, String enemytype) throws Exception{
    boolean alive = true;
    if (names.size() == 10 && scores.size() == 10) throw new Exception("Cope");
    else {
      names.add(name);
      scores.add(score);
      if((enemycolor == "blue")  && (alive == false)) score += 50; 
      if((enemycolor == "red") && (alive == false)) score += 80;
      if((enemytype == "boss") && (alive == false)) score += 200;
      return score;
    }
>>>>>>> Stashed changes
  }
  public String toString(){ return this.score + ": " this.name; }
}

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.Writer;
Writer output;

public void saveScore(Score score){
  output = new BufferedWriter(new FileWriter("scores.txt",true));
  output.append(score);
  output.close;
}
