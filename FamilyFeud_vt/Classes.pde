//add questions and stuff here
//...
class Answer
{
  String itemText;
  int itemScore;
  int itemImgType; //0 = blank, 1 = answer unknown, 2 = answer on board
  PImage itemImg;

  Answer()
  {
    itemImg = blankImg;
    itemText = "COFFEE";
    itemScore = 0;
    itemImgType = 0;
  }
  void resetAnswer()
  {
    itemImg = loadImage("img/blank.png");
    itemText = "";
    itemScore = 0;
    itemImgType = 0;
    items = 0;
  }
}
//QUESTIONS and ANSWERS
void getRound()
{
    switch(round)
  {
  case 1: 
    items = 6;
    question = "What do people need?";
    ANSWER[0].itemText = "COFFEE1";
    ANSWER[0].itemScore = 49;
    ANSWER[1].itemText = "COFFEE2";
    ANSWER[1].itemScore = 21;
    ANSWER[2].itemText = "COFFEE3";
    ANSWER[2].itemScore = 13;
    ANSWER[3].itemText = "COFFEE4";
    ANSWER[3].itemScore = 8;
    ANSWER[4].itemText = "COFFEE5";
    ANSWER[4].itemScore = 6;
    ANSWER[5].itemText = "COFFEE6";
    ANSWER[5].itemScore = 3;
    fill(0);
    text(question, width/3, height/6);
    break;
  default:
    break;
  }
}
