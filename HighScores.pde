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
  String content = new String(Files.readAllBytes(Paths.get(sketchPath("") + "\\data\\" + "score.txt")));
  String[] splitContent = content.split(",");
  boolean appended = false;
  ArrayList<Score> scoreList = new ArrayList<Score>();
  try{
  for (String splits : splitContent){
    String tempName = splits.split(": ")[0];
    int tempVal = Integer.parseInt(splits.split(": ")[1]);
    Score tempScore = new Score(tempName, tempVal);
    if (tempScore.score > score) scoreList.add(tempScore);
    else if (appended == false) {scoreList.add(playerScore); appended = true; scoreList.add(tempScore);}
    else scoreList.add(tempScore);
  }
  } catch (Exception ex){}
  if (appended == false) {scoreList.add(playerScore); appended = true;}
  content = "";
  for (Score newScore : scoreList) content += newScore + ",";
  output = new BufferedWriter(new FileWriter(sketchPath("") + "\\data\\" + "score.txt"));
  output.write(content);
  output.close();
}
