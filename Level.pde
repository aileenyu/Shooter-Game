//

class Level {
  void levelUp() { //varies speed of target movement depending on the level
    if (counter==level*10)
    {
      if (level<=2)
      {
        
        swish1.setSpeed(0.1*level);
        yDisp=yDisp+(0.1*swish1.vSwish);
        level++;
      }
      else
      {
        swish1.setSpeed(swish1.vSwish+0.01);
        yDisp=yDisp+0.01;
        level++;
      }
    }
  }
}

