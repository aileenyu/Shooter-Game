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
float vSwish = 0.05;//speed of swish
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

void mousePressed() 
{
  ball1.makePew();
}

