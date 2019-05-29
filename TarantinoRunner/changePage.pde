import java.util.Arrays;
import static java.lang.System.*;

class changePage extends Button
{
  int page;
  int pages;
  changePage(int x1, int x2, int y1, int y2, String role, int pages)
  {
    super(x1, x2, y1, y2, role);
    page = 1;
    this.pages = pages;
  }
  void pressed()
  {
    if (page == pages)
    {
      page = 1;
    } else 
    {
      page++;
    }
    background(25);
  }
  void display()
  {
    fill(50, 50, 175);
    rect(x1, y1, x2-x1, y2-y1);
    fill(10);
    textAlign(CENTER);
    textSize(16);
    text(role+" "+page, (x1+x2)/2, ((y1+y2)/2)+((y2-y1)/10));
  }
  int getPage()
  {
    return page;
  }
}
