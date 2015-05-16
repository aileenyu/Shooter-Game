class RedBall {

  void makePew() {
    pew = true; //there is a pew on the screen
  }

  void update() { //redraws the circle
    xPos = mouseX;
    background(255);
    fill(255, 0, 0);
    ellipse(xPos, yPos, size, size);
  }

  void pew() {
    if ((pew==true)&&(pewSpawn==true))  //sets a permenant x position for the pew when it is made
    {
      xPew=mouseX-3;//centers the pew
      yPew=475;
      pewSpawn=false; //pew has been made
    }
  }

  void pewDraw() { //draws pew when it's been made
    if (pewSpawn==false) 
    {
      fill(255, 0, 0);
      rect(xPew, yPew, 6, 6);
    }
  }

  void yPosition() {
    if ((pew==true)&&(pewHitted==false)&&(pewHit==false))//the pew moves up the screen if it is still on the screen and hasnt hit the target 
    {
      yPew=yPew-yDisp;
      if (yPew<0) //if pew goes off the screen, reset the pew
      {
        pew=false;
        pewSpawn=true;
      }
    }
  }
}

