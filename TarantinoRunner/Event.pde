import java.util.Arrays;
import static java.lang.System.*;

class Event implements Comparable<Event>
{
 String movie;
 double time;
 Event(String[] arr)
 {
   movie = arr[0];
   time = Double.parseDouble(arr[3]);
 }
 int compareTo(Event other)
 {
   if(time < other.time)
   {
     return -1;
   } else if (time > other.time)
   {
     return 1;
   }
   return 0;
 }
 double getTime()
 {
   return time;
 }
 String getWord()
 {
   return "Error";
 }
 String toString()
 {
   return movie+" - ";
 }
}
