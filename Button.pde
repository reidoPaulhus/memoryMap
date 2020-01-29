// button
public class Button
{
  public String name;
  public boolean pressed;
  public boolean chosen;
  
  public int happiness;
  public int productivity;
  
  public SoundFile sound;

  // Constructor
  Button(PApplet ref, String n, String s, int p, int h)
  {
    name = n;
    pressed = false;
    chosen = false;
    
    productivity = p;
    happiness = h;

    sound = new SoundFile(ref, s);
  }
}
