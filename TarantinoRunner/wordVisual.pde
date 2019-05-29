import java.util.Arrays;
import java.util.Map;
import java.util.TreeMap;
import java.util.Set;
import java.util.HashSet;
import static java.lang.System.*;

class wordVisual
{
  int wid;
  int hei;
  int num;
  Map<String, Integer> words;
  Set<Movie> activeMovies;
  ArrayList topWords;
  ArrayList bottomWords;
  wordVisual(int wid, int hei, int num)
  {
    this.wid = wid;
    this.hei = hei;
    this.num = num;
    words = new HashMap<String, Integer>();
    activeMovies = new HashSet<Movie>();
    topWords = new ArrayList<String>();
    bottomWords = new ArrayList<String>();
  }
  void toggleMovie(Movie m)
  {
    if (activeMovies.contains(m))
    {
      activeMovies.remove(m);
    } else 
    {
      activeMovies.add(m);
    }
    orgData();
  }
  void orgData()
  {
    for (String s : words.keySet())
    {
      words.put(s, 0);
    }
    for (Movie m : activeMovies)
    {
      for (Event w : m.getWords())
      {
        if (words.get(w.getWord()) == null) {
          words.put(w.getWord(), 0);
        }
        words.put(w.getWord(), words.get(w.getWord())+1);
      }
    }
    sortData();
  }
  void sortData()
  {
    topWords.clear();
    bottomWords.clear();
    String tempStr = "";
    int tempInt;
    for (int i = 0; i < num; i++)
    {
      tempInt = Integer.MIN_VALUE;
      for (String s : words.keySet())
      {
        if (words.get(s) >= tempInt && topWords.contains(s) == false && words.get(s) >= 1)
        {
          tempInt = words.get(s);
          tempStr = s;
        }
      }
      topWords.add(i, tempStr);
    }
    for (int i = 0; i < num; i++)
    {
      tempInt = Integer.MAX_VALUE;
      for (String s : words.keySet())
      {
        if (words.get(s) <= tempInt && bottomWords.contains(s) == false && words.get(s) >= 1)
        {
          tempInt = words.get(s);
          tempStr = s;
        }
      }
      bottomWords.add(i, tempStr);
    }
  }
  String censor(Object e) 
  {
    String str = "";
    String s = e.toString();
    str+=s.charAt(0);
    for(int i = 0; i<s.length()-2; i++){
      str+="*";
    }
    str+=s.charAt(s.length()-1);
    return str;
  }
  void display()
  {
    fill(150);
    rect(((width/4))-(wid/2), hei, wid, 3);
    rect(((width/4)*3)-(wid/2), hei, wid, 3);
    textSize(30);
    textAlign(CENTER);
    int section = 500-35*num;
    if (censor.active == true)
    {
      if (topWords.size() != 0 && bottomWords.size() != 0 && activeMovies.isEmpty() == false) {
        for (int i = 0; i < num; i++)
        {
          text(censor(topWords.get(i))+" - "+words.get(topWords.get(i)), ((width/4)), section);
          text(censor(bottomWords.get(i))+" - "+words.get(bottomWords.get(i)), ((width/4)*3), section);
          section += 35;
        }
      }
    } else {
      if (topWords.size() != 0 && bottomWords.size() != 0 && activeMovies.isEmpty() == false) {
        for (int i = 0; i < num; i++)
        {
          text(topWords.get(i)+" - "+words.get(topWords.get(i)), ((width/4)), section);
          text(bottomWords.get(i)+" - "+words.get(bottomWords.get(i)), ((width/4)*3), section);
          section += 35;
        }
      }
    }
  }
}
