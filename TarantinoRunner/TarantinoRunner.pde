import java.io.File;
import java.io.File;
import java.io.IOException;
import java.util.Scanner;
import java.util.Map;
import java.util.HashMap;
import static java.lang.System.*;

ArrayList wordList;
ArrayList deathList;
ArrayList<Button> buttons;
Movie movies[];
Map<Button, Movie> movieLink;
Timeline tl;
wordVisual wv;
Button d;
Button p;
Button page;
Button censor;
void setup()
{
  size(1500, 800);
  background(25);
  wordList = new ArrayList<Word>();
  deathList = new ArrayList<Death>();
  buttons = new ArrayList<Button>();
  movieLink = new HashMap<Button, Movie>();
  Movie dogs = new Movie("Reservoir Dogs", 99);
  Movie pulp = new Movie("Pulp Fiction", 154);
  Movie bill1 = new Movie("Kill Bill: Vol. 1", 112);
  Movie bill2 = new Movie("Kill Bill: Vol. 2", 138);
  Movie inglorious = new Movie("Inglorious Basterds", 153);
  Movie unchained = new Movie("Django Unchained", 165);
  movies = new Movie[]{dogs, pulp, bill1, bill2, inglorious, unchained};
  d = new Button(515, 715, 685, 755, "Deaths");
  p = new Button(785, 985, 685, 755, "Profanity");
  page = new changePage(1335, 1485, 725, 785, "Page", 2);
  censor = new Button (15, 165, 725, 785, "Censor");
  buttons.add(censor);
  buttons.add(page);
  int buttonSize = 1300/7;
  for (Movie m : movies)
  {
    Button x = new Button(buttonSize-90, buttonSize+90, 580, 640, m.title);
    buttonSize+=1300/7+41;
    buttons.add(x);
    movieLink.put(x, m);
  }
  tl = new Timeline(1300, 550);
  wv = new wordVisual(250, 475, 10);
  Scanner file;
  try {
    file = new Scanner(new File("/Users/Anthony/Desktop/Tarantino.txt"));
    //Desktop/VotoA/Projects/TarantinoRunner/Tarantino.dat
    ///Users/Anthony/Desktop/Tarantino.txt
    while (file.hasNext())
    {
      String str = file.nextLine();
      String[] arr = str.split("\\s*,\\s*");
      if (arr[1].equals("death")) {
        deathList.add(new Death(arr));
      } 
      if (arr[1].equals("word"))
      {
        wordList.add(new Word(arr));
      }
    }
    dogs.lists(deathList, wordList);
    pulp.lists(deathList, wordList);
    bill1.lists(deathList, wordList);
    bill2.lists(deathList, wordList);
    inglorious.lists(deathList, wordList);
    unchained.lists(deathList, wordList);
  } 
  catch (Exception e) {
    out.println("File not found");
    e.printStackTrace();
  }
}
void draw()
{
  if(page.getPage()==1)
  {
    d.display();
    p.display();
    tl.display();
  } else 
  {
    wv.display();
  }
  for (Button b : buttons)
  {
    b.display();
  }
}
void mousePressed()
{
  for (Button b : buttons)
  {
    b.check();
  }
  p.check();
  d.check();
} 
