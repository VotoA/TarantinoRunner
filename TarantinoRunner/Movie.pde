import java.util.Arrays;
import java.util.Map;
import java.util.HashMap;
import static java.lang.System.*;

class Movie
{
  String title;
  int runTime;
  ArrayList deaths;
  ArrayList words;
  Movie(String title, int runTime)
  {
    this.title = title;
    this.runTime = runTime;
    deaths = new ArrayList<Event>();
    words = new ArrayList<Event>();
  }
  void lists(ArrayList<Event> d, ArrayList<Event> w)
  {
    for(Event e : d)
    {
      if(e.movie.equals(title))
      {
        deaths.add(e);
      }
    }
    for(Event e : w)
    {
      if(e.movie.equals(title))
      {
        words.add(e);
      }
    }
  }
  ArrayList<Event> getDeaths()
  {
    return deaths;
  }
  ArrayList<Event> getWords()
  {
    return words;
  }
  String toString()
  {
    return title;
  }
}
