class Score {
  void scoreUp() { //adds up score when the target is hit 
    if ((xSwish<xPew+6)&&(xSwish+20>=xPew)&&(ySwish<yPew+6)&&(ySwish+20>yPew))
    {
      counter++;
      reset1();
    }
    if ((xSwish2<xPew+6)&&(xSwish2+20>=xPew)&&(ySwish2<yPew+6)&&(ySwish2+20>yPew))
    {
      counter++;
      reset2();
    }
  }

  void reset1() {//resets target 1
    ySwish=random (400);
    pewHit=false;
    swishHit=true;
    pew=false;
    pewHitted = false;
    pewMove=true;
  }

  void reset2() {//resets target 2
    ySwish2=random (400);
    pewHit=false;
    swish2Hit=true;
    pew=false;
    pewHitted = false;
    pewMove=true;
  }
  void printText() {//displays score and level count on the screen
    f=createFont("Arial", 16, true);
    textFont(f, 15);
    fill(123);
    rect(20, 40, 0, 0);
    fill(0);
    textAlign(LEFT);
    text("Score: "+counter, 5, 20);
    text("Level: "+level, 5, 40);
  }

  void loser() { //determines if the game is over and displays gameover text
    if ((xSwishLeft>510)||(xSwishRight<-10)||(xSwish2Left>510)||(xSwish2Right<-10))
    {
      background(255);
      z = createFont("Arial", 16, true);
      textFont(z, 70);
      textAlign(CENTER);
      text("Game Over", 250, 250);
      a = createFont("Arial", 16, true);
      textFont(a, 20);
      text("Press Enter to replay", 250, 300);
      printText();
      gameOver=true;
      noLoop();
    }
  }
}

