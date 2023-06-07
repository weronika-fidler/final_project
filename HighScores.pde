public class Score{
  String name;
  int score;
  
  public Score(String name, int score){
    this.name = name;
    this.score = score;
  }
  public String toString(){ return this.score + ": " + this.name; }
}

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.Writer;
Writer output;

public void saveScore(Score score) throws Exception {
    output = new BufferedWriter(new FileWriter("scores.txt",true));
    output.append(" "+ score);
    output.close();
}
