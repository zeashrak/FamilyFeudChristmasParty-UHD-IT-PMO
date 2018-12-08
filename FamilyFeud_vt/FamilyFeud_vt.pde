//ArrayList <PVector> points = new ArrayList <PVector> ();
//int marge = 50;
//int numPoints = 10;
//int currentPoint;
//PVector current;
String question = "";
String answer = "";
//Global Variables
int size = 0;
int answerX = 10;
int answerY = 10;
int w = 300;
int h = 40;
boolean enterText = false;
//game state
int state = 1; //0 main menu 1 game 
//current round
int round = 1;
//amount of answers/items
int items = 0;
//item Text and Score
//could use ArrayList as alternative...
String [] itemText;
String [] itemScore;
int [] itemImgType; //0 = blank, 1 = answer unknown, 2 = answer on board
int itemIndex = 0; //set answer slot that will change on board
//images
PImage boardImg;
PImage blankImg;
PImage scoreImg; //
PImage [] itemImg;
//TEAM SCORES & NAMES
int roundScore = 0; //add this score to round winner's score
//trigger and compare for who gets the points for the round
boolean p1Win = false;
boolean p2Win = false;
int p1Score = 0;
int p2Score = 0;
String p1 = "TEAM ???";
String p2 = "TEAM XXX";
//SETUP
void setup() {
  size(1280, 900);
  //set images
  boardImg = loadImage("img/board.png");
  boardImg.resize(720, 640);
  blankImg = loadImage("img/blank.png");
  scoreImg = loadImage("img/score.png");
  scoreImg.resize(350, 150);
  itemImg = new PImage [8];
  itemText = new String [8];
  itemScore = new String [8];
  itemImgType = new int [8];
  resetItems();
}

void draw() {
  background(255);
  PImage backgroundImg = loadImage("img/background.jpg");
  backgroundImg.resize(width, height);
  fill(255);
  imageMode(CENTER);
  //display background
  image(backgroundImg, width/2, height/2);
  //game states
  switch(state)
  {
  case 0: //main menu //show logo and start button //change team names?
    break;
  case 1: //game
    loadBoard();
    break;
  }
}

void loadBoard()
{
  int posX, posY;
  posX = width/4;
  posY = height/4;
  int imgNum = 0;
  switch(round)
  {
  case 1: 
    items = 5;
    break;
  default:
    break;
  }
  //draw background board
  //orange
  fill(238, 132, 78);
  rect(posX - 60, posY-20, 790, 480);
  //black
  fill(0);
  rect(posX - 40, posY, 750, 440);
  //enter items
  for (int i = 0; i < items; i++)
  {
    imgNum = i + 1;
    if (itemImgType[i] == 2)
    {
      //do nothing
    } else
      itemImgType[i] = 1;
    //display item images
    //ADD function to display images and text
    switch(itemImgType[i])
    {
    case 1: //unknown answer
      itemImg[i] = loadImage("img/"+ imgNum + ".png");
      break;
    case 2: //answer is on board
      itemImg[i] = scoreImg;
      break;
    default: 
      break;
    }
  }
  //left half
  for (int i = 0; i < 4; i++)
  {
    itemImg[i].resize(350, 150);
    imageMode(CORNER);
    image(itemImg[i], posX - 20, posY + 100*i);
  }
  //dummy variable to get correct position
  int j = 0;
  //posX = width/2;
  //right half
  for (int i = 4; i < 8; i++)
  {
    itemImg[i].resize(350, 150);
    imageMode(CORNER);
    image(itemImg[i], posX*2 + 20, posY + 100*j);
    j++;
  }
  //textbox
  fill(255);
  rect(answerX, answerY, w, h);
  displayUserInput();
  //display user text if flag is true
  if (enterText)
  {
    fill(255, 0, 0);
    ellipse(30, 30, 10, answerY);
    fill(0);
    text(answer, answerX*4, answerY*4);
  }
}
void displayUserInput()
{
  fill(0);
  textSize(24);
  text("Entered text: "+answer, answerX*4, answerY*9);
}
//checks if answer is on board
boolean answerOnBoard()
{
  //compares entered text with itemText (for loop) 
  //    change to upper case to check
  //returns true if there is a match, else false
  //save the index of match to itemIndex
  return true;
}
//reset all items for new round
void resetItems()
{
  for (int i = 0; i < 8; i++)
  {
    itemImg[i] = loadImage("img/blank.png");
    itemText[i] = "";
    itemScore[i] = "";
    itemImgType[i] = 0;
  }
  items = 0;
}
void displayItems()
{
  //show images and answers on board
  //need to add delay
}
void keyPressed()
{
  //to enter and display user entered text
  if (enterText)
  {
    if (key == ENTER)
    {
      enterText = false;
      //TEST: answer is on board, change panel and display answer and points
      if (answerOnBoard())
        itemImgType[itemIndex] = 2;
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
void mousePressed()
{
  //turn on flag to enter text
  if ((mouseX < (answerX + w) && mouseX > (answerX)) && (mouseY < (answerY + h) && mouseY > (answerY)) && mousePressed)
  {
    //flag to display user text
    enterText = true;
  }
}
