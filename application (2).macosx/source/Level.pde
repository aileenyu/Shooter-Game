class Level {
  void levelUp() { //varies speed of target movement depending on the level
    if (counter==level*10)
    {
      if (level<=2)
      {
        vSwish=vSwish*level;
        yDisp=yDisp+(0.1*level);
        level++;
      }
      else
      {
        vSwish=vSwish+0.01;
        yDisp=yDisp+0.01;
        level++;
      }
    }
  }
}

