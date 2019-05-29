import java.util.Arrays;
import java.util.Map;
import java.util.TreeMap;
import java.util.Set;
import java.util.HashSet;
import static java.lang.System.*;

class Timeline
{
  int wid;
  int hei;
  Map<Integer, Integer> deathData;
  Map<Integer, Integer> profanityData;
  Set<Movie> activeMovies;
  Timeline(int wid, int hei)
  {
    this.wid = wid;
    this.hei = hei;
    deathData = new TreeMap<Integer, Integer>();
    profanityData = new TreeMap<Integer, Integer>();
    activeMovies = new HashSet<Movie>();
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
    for (Integer i : deathData.keySet())
    {
      deathData.put(i, 0);
    }
    for (Integer i : profanityData.keySet())
    {
      profanityData.put(i, 0);
    }
    for (Movie m : activeMovies)
    {
      double divider = (((double)m.runTime)/((double)wid))*20;
      Integer pos = 0;
      for (double i = divider; i<=m.runTime; i+=divider)
      {
        if (p.active) {
          for (Event e : m.getWords())
          {
            if (e.getTime()<i && e.getTime()>(i-divider))
            {
              if (profanityData.get(pos) == null)
              {
                profanityData.put(pos, 0);
              }
              profanityData.put(pos, profanityData.get(pos)+1);
            }
          }
        }
        if (d.active) {
          for (Event e : m.getDeaths())
          {
            if (e.getTime()<i && e.getTime()>(i-divider))
            {
              if (deathData.get(pos) == null)
              {
                deathData.put(pos, 0);
              }
              deathData.put(pos, deathData.get(pos)+1);
            }
          }
        }
        pos++;
      }
    }
  }
  void display()
  {
    fill(150);
    rect((width/2)-(wid/2), hei, wid, 3);
    for (int i = 0; i<(wid/20); i++)
    {
      if (deathData.get(i)!=null && profanityData.get(i)!=null) {
        if (deathData.get(i)<profanityData.get(i)) {
          fill(0, 25, 225);
          if (profanityData.get(i)!=null)
          {
            rect(((width/2)-(wid/2))+20*(i)+1, hei-(profanityData.get(i)*8), 16, profanityData.get(i)*8);
          }
          fill(200, 0, 0);
          if (deathData.get(i)!=null)
          {
            rect(((width/2)-(wid/2))+20*(i)+2, hei-(deathData.get(i)*8), 16, deathData.get(i)*8);
          }
        } else {
          fill(200, 0, 0);
          if (deathData.get(i)!=null)
          {
            rect(((width/2)-(wid/2))+20*(i)+2, hei-(deathData.get(i)*8), 16, deathData.get(i)*8);
          }
          fill(0, 25, 225);
          if (profanityData.get(i)!=null)
          {
            rect(((width/2)-(wid/2))+20*(i)+1, hei-(profanityData.get(i)*8), 16, profanityData.get(i)*8);
          }
        }
      } else {
        fill(200, 0, 0);
        if (deathData.get(i)!=null)
        {
          rect(((width/2)-(wid/2))+20*(i)+2, hei-(deathData.get(i)*8), 16, deathData.get(i)*8);
        }
        fill(0, 25, 225);
        if (profanityData.get(i)!=null)
        {
          rect(((width/2)-(wid/2))+20*(i)+1, hei-(profanityData.get(i)*8), 16, profanityData.get(i)*8);
        }
      }
    }
  }
}
