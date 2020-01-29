import processing.sound.*;
SoundFile sound_confirm;
SoundFile sound_cancel;
SoundFile sound_good;
SoundFile sound_bad;

// The values attached to each block's task
int happiness;
int productivity;
int inputNumber;
int maxInputs = 4;

Button bttn_nap;
Button bttn_class;
Button bttn_meal;
Button bttn_entertainment;
Button bttn_friends;
Button bttn_hobbies;
Button bttn_selfcare;
Button bttn_homework;
Button bttn_study;

// All of the available buttons
ArrayList<Button> allButtons;
// the 4 available choices that make up a timeline
ArrayList<Button> chosenButtons = new ArrayList<Button>();



// Set up the initial values for the project
void setup()
{
  size(500, 500);
  background(0);

  sound_confirm = new SoundFile(this, "click.wav");
  sound_cancel = new SoundFile(this, "ding.wav");
  sound_good = new SoundFile(this, "ding.wav");
  sound_bad = new SoundFile(this, "ding.wav");

  // Each of the buttons available
  // name, sound, productivity, happiness
  bttn_nap = new Button(this, "nap", "click.wav", 1, 3);
  bttn_class = new Button(this, "class", "click.wav", 3, -2);
  bttn_meal = new Button(this, "meal", "click.wav", -1, 1);
  bttn_entertainment = new Button(this, "entertainment", "click.wav", -3, 3);
  bttn_friends = new Button(this, "friends", "click.wav", -2, 2);
  bttn_hobbies = new Button(this, "hobbies", "click.wav", 2, 3);
  bttn_selfcare = new Button(this, "selfcare", "click.wav", -1, 2);
  bttn_homework = new Button(this, "homework", "click.wav", 1, -1);
  bttn_study = new Button(this, "study", "click.wav", 0, -2);
  allButtons = new ArrayList<Button>();

  // Array of all buttons
  allButtons.add(bttn_nap);
  allButtons.add(bttn_class);
  allButtons.add(bttn_meal);
  allButtons.add(bttn_entertainment);
  allButtons.add(bttn_friends);
  allButtons.add(bttn_hobbies);
  allButtons.add(bttn_selfcare);
  allButtons.add(bttn_homework);
  allButtons.add(bttn_study);

  ResetValues();
}

// Needed to check if the mouse was pressed
void draw()
{
}

// Checks if the mouse was pressed
void mousePressed()
{
  ResetValues();
}

// Checks if a key was pressed and checks which one
void keyPressed()
{
  if (key == CODED)
  {
    // Directional keys
    switch(keyCode)
    {
      // // Block 7
    case UP :
      if (!bttn_selfcare.pressed)
      {
        AttemptConfirmOption("selfcare");
      }
      break;

      // Block 8
    case DOWN :
      if (!bttn_homework.pressed)
      {
        AttemptConfirmOption("homework");
      }
      break;

      // Block 9
    case LEFT :
      if (!bttn_study.pressed)
      {
        AttemptConfirmOption("study");
      }
      break;
    }
  }

  switch(key)
  {
    // Additional MakeyMakey Keyboard keys
    // Nap
  case 'w' :
    if (!bttn_nap.pressed)
    {
      AttemptConfirmOption("nap");
    }
    break;

    // Homework / Class
  case 'a' :
    if (!bttn_class.pressed)
    {
      AttemptConfirmOption("class");
    }
    break;

    // Home Cooked Meal
  case 's' :
    if (!bttn_meal.pressed)
    {
      AttemptConfirmOption("meal");
    }
    break;    

    // Netflix
  case 'd' :
    if (!bttn_entertainment.pressed)
    {
      AttemptConfirmOption("entertainment");
    }
    break;

    // Friends
  case 'g' :
    if (!bttn_friends.pressed)
    {
      AttemptConfirmOption("friends");
    }
    break;

    // Block 6
  case 'f' :
    if (!bttn_hobbies.pressed)
    {
      AttemptConfirmOption("hobbies");
    }
    break;

    // Confirm option
  case ' ':
    ConfirmOptions();
    break;
  }
}

//
void AttemptConfirmOption(String name)
{
  boolean found = false;

  if (inputNumber > 0)
  {
    // Check if the button was already added to chosen buttons
    for (Button b : chosenButtons)
    {
      if (b.name == name)
        found = true;
    }
    // If the button was not found, 
    // then find it in all the buttons and add it to the chosen button list
    if (!found)
    {
      for (Button b : allButtons)
      {
        if (b.name == name) 
        {
          b.chosen = true;
          b.pressed = true;
          b.sound.play();
          println(b.name);

          happiness += b.happiness * inputNumber;
          productivity += b.productivity * inputNumber;
          chosenButtons.add(b);

          inputNumber--;
        }
      }
    }
  }
  // Let user know there are no more inputs left
  if(inputNumber <= 0)
  {
    println("Ready to Confirm, no more optons left");
  }
}

//
void ConfirmOptions()
{
  if (inputNumber <= 0)
  {
    PrintValues();
    ResetValues();
  }
}

// Resets all of the values of the program
void ResetValues()
{
  println("Reset");

  productivity = 0;                                              
  happiness = 0;
  inputNumber = maxInputs;

  chosenButtons.clear();

  // Reset each button
  for (Button b : allButtons)
  {
    b.chosen = false;
    b.pressed = false;
  }
}

// Outputs all of the values of the program
void PrintValues()
{
  // NEED TO DETERMINE WHAT THE VALUES DO GIVEN CERTAIN RANGES
  println();
  println("All Inputs Entered. The results are in...");
  println("Total Happiness: " + happiness);
  println("Total Productivity: " + productivity);
  println();
  
  if(productivity == happiness)
  {
    println("You live a well balanced life!");
  }
  else if(productivity < happiness)
  {
    println("You value happiness over your productivity!");
  }
  else if(productivity > happiness)
  {
    println("You value productivity over your happiness!");
  }
  println();
}
