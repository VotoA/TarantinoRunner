import java.util.Arrays;
import static java.lang.System.*;

class Death extends Event
{
 Death(String[] arr)
 {
   super(arr);
 }
 String toString()
 {
   return super.toString()+"Death";
 }
}
