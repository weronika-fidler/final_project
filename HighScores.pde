public class Score{
  String name;
  int score;
  
  public Score(String name, int score){
    this.name = name;
    this.score = score;
  }
  public String toString(){ return this.name.toUpperCase() + ": " + this.score; }
}

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.Writer;
import java.nio.file.Files;
import java.nio.file.Paths;
Writer output;

public void saveScore(Score playerScore) throws Exception {
  output = new BufferedWriter(new FileWriter(sketchPath("") + "\\data\\" + "score.txt", true));
  output.append(playerScore + ",");
  output.close();
}
