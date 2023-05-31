public static class HighScores{
  ArrayList<String> names = new ArrayList<String>();
  ArrayList<Integer> scores = new ArrayList<Integer>();
  
  public void addScore(String name, int score) throws Exception{
    if (names.size() == 10 && scores.size() == 10) throw new Exception("Cope");
    else {
      names.add(name);
      scores.add(score);
    }
  }
}
