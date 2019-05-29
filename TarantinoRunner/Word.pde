import java.util.Arrays;
import static java.lang.System.*;

class Word extends Event
{
 String word;
 Word(String[] arr)
 {
   super(arr);
   word = arr[2];
 }
 String getWord()
 {
   return word;
 }
 String toString()
 {
   return super.toString()+word;
 }
}
