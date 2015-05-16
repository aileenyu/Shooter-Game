import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class pew2 extends PApplet {

RedBall ball1 = new RedBall();
Swish swish1 = new Swish(); 
SwishA swishA1 = new SwishA(); 
Level level1 = new Level();
Score score1 = new Score();

boolean pewHit = false;
boolean pew = false;//is there a pew out there
boolean pewHitted;
boolean pewMove = true;
boolean gameOver = false;
float LeftorRight;
float vSwish = 0.05f;//speed of swish
int counter = 0;//count the score
int level = 1;
boolean swishHit = false;
boolean swish = true;
float ySwish = random (200);
float xSwishLeft = 0;
float xSwishRight = 500;
float xSwish;
float size = 50;
boolean swish2Hit = false;
boolean swish2 = true;
float LeftorRight2;
float ySwish2 = random(200);
float xSwish2Left = 0;
float xSwish2Right = 500;
float xSwish2;
int yPos = 500;
int xPos;
int xPew;
float yDisp = 1;
float yPew;
PFont f;
PFont z;
PFont a;


public void setup()
{
  size(500, 500);
  frameRate(1000);
}

public void draw() 
{  
  ball1.update();
  swish1.respawn();
  swish1.leftRight();
  swishA1.respawn2();
  swishA1.leftRight2();
  ball1.pew();
  ball1.pewDraw();
  ball1.yPosition();
  score1.scoreUp();
  score1.printText();
  score1.loser();
  level1.levelUp();
}

public void mousePressed() 
{
  ball1.makePew();
}

class Level {
  public void levelUp() { //varies speed of target movement depending on the level
    if (counter==level*10)
    {
      if (level<=2)
      {
        vSwish=vSwish*level;
        yDisp=yDisp+(0.1f*level);
        level++;
      }
      else
      {
        vSwish=vSwish+0.01f;
        yDisp=yDisp+0.01f;
        level++;
      }
    }
  }
}

class Score {
  public void scoreUp() { //adds up score when the target is hit 
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

  public void reset1() {//resets target 1
    ySwish=random (400);
    pewHit=false;
    swishHit=true;
    pew=false;
    pewHitted = false;
    pewMove=true;
  }

  public void reset2() {//resets target 2
    ySwish2=random (400);
    pewHit=false;
    swish2Hit=true;
    pew=false;
    pewHitted = false;
    pewMove=true;
  }
  public void printText() {//displays score and level count on the screen
    f=createFont("Arial", 16, true);
    textFont(f, 15);
    fill(123);
    rect(20, 40, 0, 0);
    fill(0);
    textAlign(LEFT);
    text("Score: "+counter, 5, 20);
    text("Level: "+level, 5, 40);
  }

  public void loser() { //determines if the game is over and displays gameover text
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

public void keyPressed() {
  if (key == ' ') {//shoots if spacebar is pressed
    ball1.makePew();
  }
  if (gameOver == true) {
    background(255);
    if (keyCode == RETURN || keyCode == ENTER) {//restarts the game if return is pressed when gameover (resets all the variables to original values)
      pewHit = false;
      pew = false;
      pewMove = true;
      vSwish = 0.05f;
      counter = 0;
      level = 1;
      swishHit = false;
      swish = true;
      ySwish = random (200);
      xSwishLeft = 0;
      xSwishRight = 500;
      swish2Hit = false;
      swish2 = true;
      ySwish2 = random(200);
      xSwish2Left = 0;
      xSwish2Right = 500;
      yPos = 500;
      yDisp = 1;
    }
    loop(); 
  }
}

class Swish {//target 1
  public void respawn() { 
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

  public void leftRight() { 
    if (LeftorRight>=0.5f) //target moves from left to right
    {
      if ((xSwishLeft<510)&&(swishHit==false)) //draw target until it's been hit or goes off the screen
      {
        rect(xSwishLeft, ySwish, 20, 10);
        xSwishLeft=xSwishLeft+vSwish;
        xSwish=xSwishLeft;
      }
    }
    else if (LeftorRight<0.5f) //target moves from right to left
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

class SwishA {//target 2
  public void respawn2() { 
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

  public void leftRight2() {
    if (LeftorRight2>=0.5f) //target moves from left to right
    {
      if ((xSwish2Left<510)&&(swish2Hit==false)) //draw target until it's been hit or goes off the screen
      {
        fill(255, 0, 0);
        rect(xSwish2Left, ySwish2, 20, 10);
        xSwish2Left=xSwish2Left+vSwish;
        xSwish2=xSwish2Left;
      }
    }
    else if (LeftorRight2<0.5f) //target moves from right to left
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

class RedBall {

  public void makePew() {
    pew = true; //there is a pew on the screen
  }

  public void update() { //redraws the circle
    xPos = mouseX;
    background(255);
    fill(255, 0, 0);
    ellipse(xPos, yPos, size, size);
  }

  public void pew() {
    if ((pew==true)&&(pewMove==true))  //sets a permenant x position for the pew when it is made
    {
      xPew=mouseX-3;//centers the pew
      yPew=475;
      pewMove=false; //pew has been made
    }
  }

  public void pewDraw() { //draws pew
    if (pewMove==false)
    {
      fill(255, 0, 0);
      rect(xPew, yPew, 6, 6);
    }
  }

  public void yPosition() {
    if ((pew==true)&&(pewHitted==false)&&(pewHit==false))//the pew moves up the screen if it is still on the screen and hasnt hit the target 
    {
      yPew=yPew-yDisp;
      if (yPew<0) //if pew goes off the screen, reset the pew
      {
        pew=false;
        pewMove=true;
      }
    }
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "pew2" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
