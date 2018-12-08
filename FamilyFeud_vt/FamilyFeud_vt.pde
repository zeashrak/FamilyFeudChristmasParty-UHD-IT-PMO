//Family Feud [] //<>// //<>// //<>// //<>//
//NEW: Added SFX
import processing.sound.*;
SoundFile sfx0; //0 music? 1 on board 2 strike
SoundFile sfx1;
SoundFile sfx2;
PFont font;
//Global Variables
Answer [] ANSWER;
String question = "";
String answer = "";
int strikes = 0; //3 strikes = next player or round over
//TEAM SCORES & NAMES
int roundScore = 0; //add this score to round winner's score
//trigger and compare for who gets the points for the round
boolean p1Win = false;
boolean p2Win = false;
int p1Score = 0;
int p2Score = 0;
String p1 = "TEAM ???";
String p2 = "TEAM XXX";
static final int P1 = 1;
static final int P2 = 2;
int currentPlayer;
int nextPlayer;
int lastPlayer;
//time variables
int timeStart = 0;
int timeEnd = 0;
int elapsedTime = 0;
int delay = 3000;
//
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
//String [] itemText;
//String [] itemScore;
//int [] itemImgType; //0 = blank, 1 = answer unknown, 2 = answer on board
boolean [] onTheBoard;
//PImage [] itemImg;
int itemIndex = 0; //set answer slot that will change on board
//images
PImage boardImg;
PImage blankImg;
PImage scoreImg; //
PImage [] numImg;
PImage [] strikeImg;
boolean animate = false; //show animation if true
//SETUP
void setup() {
  size(1280, 900);
  //set values
  itemIndex = 0;
  //somehow could only load buzzer and blip sounds...
  sfx1 = new SoundFile (this, "sounds/blip.mp3");
  sfx2 = new SoundFile (this, "sounds/buzzer.mp3");
  font = loadFont("BritannicBold.vlw");
  textFont(font, 48);
  //set images
  boardImg = loadImage("img/board.png");
  boardImg.resize(720, 640);
  blankImg = loadImage("img/blank.png");
  blankImg.resize(350, 150);
  scoreImg = loadImage("img/score.png");
  scoreImg.resize(350, 150);
  initGame();
  //resetItems();
}
void initGame()
{
  strikeImg = new PImage [3];
  numImg = new PImage [8];
  ANSWER = new Answer[8];
  onTheBoard = new boolean [8];
  for (int s = 1; s < 4; s++)
  {
    strikeImg [s-1] = loadImage("img/strikes" + s + ".png");
    strikeImg [s-1].resize(600, 300);
  }
  for (int n = 1; n < 9; n++)
  {
    numImg [n-1] = loadImage("img/" + n + ".png");
    numImg[n-1].resize(350, 150);
    ANSWER[n-1] = new Answer();
  }
  items = 0;

  currentPlayer = P1;
  nextPlayer = P2;
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
  getRound();
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
    if (ANSWER[i].itemImgType == 2)
    {
      //do nothing
    } else
      ANSWER[i].itemImgType = 1;
    //display item images
    //ADD function to display images and text
    switch(ANSWER[i].itemImgType)
    {
    case 1: //answer not on board
      ANSWER[i].itemImg = numImg[i];
      break;
    case 2: //answer is on board
      //animate and play sound if not on board
      //...
      ANSWER[i].itemImg = scoreImg;
      break;
    default: //nothing
      break;
    }
  }
  //left half of board
  for (int i = 0; i < 4; i++)
  {
    imageMode(CORNER);
    image(ANSWER[i].itemImg, posX - 20, posY + 100*i);
    if (onTheBoard[i])
    {
      fill(255);
      textAlign(LEFT);
      text(ANSWER[i].itemText, posX - 10, posY + 50 + 100*i, 300, 140);
      textAlign(CENTER);
      text(ANSWER[i].itemScore, posX + 290, posY + 80 + 100*i);
    }
  }
  //variable to get correct position (next to left half)
  int j = 0;
  //right half of board
  for (int i = 4; i < 8; i++)
  {
    imageMode(CORNER);
      textAlign(LEFT);
    image(ANSWER[i].itemImg, posX*2 + 20, posY + 100*j);
    if (onTheBoard[i])
    {
      fill(255);
      text(ANSWER[i].itemText, posX*2 + 30, posY + 50 + 100*j, 300, 140);
      textAlign(CENTER);
      text(ANSWER[i].itemScore, posX*2 +320, posY + 80 + 100*j);
    }
    j++;
  }
  //textbox
  //fill(255);
  //rect(answerX, answerY, w, h);
  //displayUserInput();
  ////display user text if flag is true
  //if (enterText)
  //{
  //  fill(255, 0, 0);
  //  ellipse(30, 30, 10, answerY);
  //  fill(0);
  //  text(answer, answerX*4, answerY*4);
  //}
}
//void displayUserInput()
//{
//  fill(0);
//  textSize(24);
//  text("Entered text: "+answer, answerX*4, answerY*9);
//}
void displayItems()
{
  //show images and answers on board
  //animate: if type = 2, true, then set type=-1 (already animated)
  //
  //need to add delay
}
//checks if answer is on board
//boolean answerOnBoard()
//{
//  //for (int i = 0; i < 8; i++)
//  //{
//  //}
//  return true;
//  //compares entered text with itemText (for loop) 
//  //    change to upper case to check
//  //returns true if there is a match, else false
//  //save the index of match to itemIndex
//}
void keyPressed()
{
  // click keys 1-8 to reveal answers
  switch(key)
  {
  case '1': 
    itemIndex = 0;
    break;
  case '2': 
    itemIndex = 1;
    break;
  case '3': 
    itemIndex = 2;
    break;
  case '4': 
    itemIndex = 3;
    break;
  case '5': 
    itemIndex = 4;
    break;
  case '6': 
    itemIndex = 5;
    break;
  case '7': 
    itemIndex = 6;
    break;
  case '8': 
    itemIndex = 7;
    showOnBoard();
    break;  
  default: //strikes
    int strikePosX = width/2;
    int strikePosY = height/2;
    strikes += 1;
    sfx2.play();
    imageMode(CENTER);
    timeStart = millis();
    switch(strikes)
    {
    case 1: 
      image(strikeImg[0], strikePosX, strikePosY);
      break;
    case 2: 
      image(strikeImg[1], strikePosX, strikePosY);
      break;
    case 3: 
      image(strikeImg[2], strikePosX, strikePosY);
      break;
    }
    if (strikes == 3)
    {
      lastPlayer = currentPlayer;
      currentPlayer = nextPlayer;
      nextPlayer = lastPlayer;
      strikes = 0;
    } 
    break;
  }
  if (key >= 49 && key <=56)
  {
    showOnBoard();
  }
  //mouse click to select player
  //or 
  //to enter and display user entered text
  //if (enterText)
  //{
  //  if (key == ENTER)
  //  {
  //    enterText = false;
  //    //TEST: answer is on board, change panel and display answer and points
  //    if (answerOnBoard())
  //    {
  //      if (!onTheBoard[itemIndex])
  //      {
  //        ANSWER[itemIndex].itemImgType = 2;
  //        //animate
  //        //play sound
  //      }
  //      //the answer is now on the board = true
  //      onTheBoard[itemIndex] = true;
  //      if (itemIndex < items)
  //        itemIndex += 1;
  //      else
  //        itemIndex = 0;
  //    }
  //    //TEST: display user input that is stored in answer
  //    println(answer);
  //  } else if (key == BACKSPACE)
  //  {
  //    size--;
  //    if (size>0)
  //      answer = answer.substring(0, size);
  //    else if (size <= 0)
  //    {
  //      size = 0; 
  //      answer="";
  //    }
  //  } else if (key != CODED) //avoid special keys
  //  {      
  //    answer += key;
  //    size++;
  //  }
  //compare answer?
  //...
  //then clear answer
  //}
}
void showOnBoard()
{  
  if (!onTheBoard[itemIndex] && itemIndex < items)
  {
    sfx1.play();
    ANSWER[itemIndex].itemImgType = 2;
    //the answer is now on the board = true
    onTheBoard[itemIndex] = true;
    //animate
    //play sound
  }
  if (itemIndex < items)
    itemIndex += 1;
  else if (itemIndex > items-1)
  {
  }
}
void mousePressed()
{
  //turn on flag to enter text
  //if ((mouseX < (answerX + w) && mouseX > (answerX)) && (mouseY < (answerY + h) && mouseY > (answerY)) && mousePressed)
  //{
  //  //flag to display user text
  //  enterText = true;
  //}
}
