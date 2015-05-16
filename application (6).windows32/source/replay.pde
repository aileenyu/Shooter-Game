void keyPressed() {
  if (key == ' ') {//shoots if spacebar is pressed
    ball1.makePew();
  }
  if (gameOver == true) {
    background(255);
    if (keyCode == RETURN || keyCode == ENTER) {//restarts the game if return is pressed when gameover (resets all the variables to original values)
      pewHit = false;
      pew = false;
      pewMove = true;
      vSwish = 0.05;
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

