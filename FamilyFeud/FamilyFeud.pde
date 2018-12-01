//ArrayList <PVector> points = new ArrayList <PVector> ();
//int marge = 50;
//int numPoints = 10;
//int currentPoint;
//PVector current;
String answer = "";
//Global Variables
int size = 0;
int answerX = 10;
int answerY = 10;
int w = 300;
int h = 40;
boolean enterText = false;

void setup() {
  size(500, 500);
}

void draw() {
  background(255);
  fill(255);
  //textbox
  rect(answerX, answerY, w, h);
  displayUserInput();
  //turn on flag to enter text
  if ((mouseX < (answerX + w) && mouseX > (answerX)) && (mouseY < (answerY + h) && mouseY > (answerY)) && mousePressed)
  {
    //flag to display user text
    enterText = true;
  }
  //display user text if flag is true
  if (enterText)
  {
    line(20,20,20, answerY*4);
    text(answer, answerX*4, answerY*4);
  }
  //displayUserInput();
}

void keyPressed()
{
  //to enter and display user entered text
  if (enterText)
  {
    if (key == ENTER)
    {
      enterText = false;
      println(answer);
    } else if (key == BACKSPACE)
    {
      size--;
      if (size>0)
        answer = answer.substring(0, size);
      else if (size <= 0)
      {
        size = 0; 
        answer="";
      }
    } else if (key != CODED) //avoid special keys
    {      
      answer += key;
      size++;
    }
    //compare answer?
    //...
    //then clear answer
  }
}

void displayUserInput()
{
  fill(0);
  textSize(24);
  text("Entered text: "+answer, answerX*4, answerY*9);
}
