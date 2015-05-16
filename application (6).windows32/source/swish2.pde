class SwishA {//target 2
  void respawn2() { 
    if (swish2==true)  //determines the direction of each target for every respawn 
    {
      LeftorRight2=random(1);
      swish2=false;
    }
    if (swish2Hit==true)//resets variables for target respawn
    {
      swish2Hit=false;
      swish2=true;
      xSwish2Left=0;
      xSwish2Right=500;
    }
  }

  void leftRight2() {
    if (LeftorRight2>=0.5) //target moves from left to right
    {
      if ((xSwish2Left<510)&&(swish2Hit==false)) //draw target until it's been hit or goes off the screen
      {
        fill(255, 0, 0);
        rect(xSwish2Left, ySwish2, 20, 10);
        xSwish2Left=xSwish2Left+vSwish;
        xSwish2=xSwish2Left;
      }
    }
    else if (LeftorRight2<0.5) //target moves from right to left
    {
      if ((xSwish2Right>-10)&&(swish2Hit==false)) //draw target until it's been hit or goes off the screen
      {
        fill(255, 0, 0);
        rect(xSwish2Right, ySwish2, 20, 10);
        xSwish2Right=xSwish2Right-vSwish;
        xSwish2=xSwish2Right;
      }
    }
  }
}

