import java.util.Arrays;
import java.util.Map;
import java.util.HashMap;
import static java.lang.System.*;

class Button
{
  int x1, x2, y1, y2;
  boolean active;
  String role;
  Button(int x1, int x2, int y1, int y2, String role)
  {
    this.x1 = x1;
    this.x2 = x2;
    this.y1 = y1;
    this.y2 = y2;
    active = false;
    this.role = role;
  }
  void check()
  {
    if (mouseX >= x1 && mouseX <= x2 && mouseY >= y1 && mouseY <= y2)
    {
      pressed();
    }
  }
  void pressed()
  {
    if (active == true)
    {
      active = false;
    } else 
    {
      active = true;
    }
    if(this.role.equals("Censor")){
    } else if(movieLink.get(this) == null) {
      tl.orgData();
    } else {
      tl.toggleMovie(movieLink.get(this));
      wv.toggleMovie(movieLink.get(this));
    }
    background(25);
  }
  void display()
  {
    if (active == true) {
      fill(0, 200, 0);
    } else {
      fill(150, 0, 0);
    }
    rect(x1, y1, x2-x1, y2-y1);
    fill(10);
    textAlign(CENTER);
    textSize(16);
    text(role, (x1+x2)/2, ((y1+y2)/2)+((y2-y1)/10));
  }
  String toString()
  {
    return role;
  }
  int getPage()
  {
    return -1;
  }
}
