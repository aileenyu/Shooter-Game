class Swish {//target 1
  void respawn() { 
    if (swish==true) //determines the direction of each target for every respawn 
    {
      LeftorRight=random(1);
      swish=false;
    }
    if (swishHit==true)//resets variables for target respawn
    {
      swishHit=false;
      swish=true;
      xSwishLeft=0;
      xSwishRight=500;
    }
  }

  void leftRight() { 
    if (LeftorRight>=0.5) //target moves from left to right
    {
      if ((xSwishLeft<510)&&(swishHit==false)) //draw target until it's been hit or goes off the screen
      {
        rect(xSwishLeft, ySwish, 20, 10);
        xSwishLeft=xSwishLeft+vSwish;
        xSwish=xSwishLeft;
      }
    }
    else if (LeftorRight<0.5) //target moves from right to left
    {
      if ((xSwishRight>-10)&&(swishHit==false)) //draw target until it's been hit or goes off the screen
      {
        rect(xSwishRight, ySwish, 20, 10);
        xSwishRight=xSwishRight-vSwish;
        xSwish=xSwishRight;
      }
    }
  }
}

