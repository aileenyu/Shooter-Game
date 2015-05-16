RedBall ball1 = new RedBall();
Swish swish1 = new Swish(); 
Swish swishA1 = new Swish(); 
Level level1 = new Level();
Score score1 = new Score();

//pew (bullet) parameters
boolean pewHit = false;
boolean pew = false;//is there a pew out there
boolean pewHitted;
boolean pewSpawn= true;

boolean gameOver = false;

// swish (target) parameters
float LeftorRight;

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


void setup()
{
  size(500, 500);
  frameRate(1000);
}

void draw() 
{  
// update screen information

  ball1.update();
  swish1.respawn();
  swish1.leftRight();
  swishA1.respawn();
  swishA1.leftRight();

//update pew information
  ball1.pew();
  ball1.pewDraw();
  ball1.yPosition();

//update score information
  score1.scoreUp();
  score1.printText();
  score1.loser();
  level1.levelUp();
}

void mousePressed() 
{
  //create a pew when the mouse is clicked.
  ball1.makePew();
}

