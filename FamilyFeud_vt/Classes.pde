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
