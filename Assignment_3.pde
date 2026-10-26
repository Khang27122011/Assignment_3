int level = 0;
char letter;
int score = 0;
boolean gameOver = false;

int startTime;
int endTime;
String message = "";

void setup() {
  size(500, 400);
  textAlign(CENTER, CENTER);
}

void draw() {
  background(40, 50, 80);

  fill(255);
  textSize(28);
  text("TYPING TEST", 250, 50);

  if (level == 0) {
    textSize(18);
    text("Choose a difficulty", 250, 100);

    fill(50, 180, 80);
    rect(50, 150, 120, 60);
    fill(255);
    
    text("Easy", 110, 180);

    fill(220, 160, 40);
    rect(190, 150, 120, 60);
    fill(255);
    text("Medium", 250, 180);

    fill(200, 60, 60);
    rect(330, 150, 120, 60);
    fill(255);
    text("Hard", 390, 180);

  } else {
    textSize(20);
    text("Score: " + score, 250, 90);

    if (gameOver == false) {
      textSize(100);
      text(letter, 250, 180);

      textSize(18);
      text(message, 250, 250);

      int seconds = (millis() - startTime) / 1000;
      text("Time: " + seconds + " seconds", 250, 320);

    } else {
      textSize(25);
      text("Wrong! Game Over", 250, 170);

      textSize(20);
      text("Final Score: " + score, 250, 220);

      int seconds = (endTime - startTime) / 1000;
      text("Time: " + seconds + " seconds", 250, 255);

      fill(70, 130, 200);
      rect(150, 300, 200, 50);
      fill(255);
      text("Play Again", 250, 325);
    }
  }
}

void mousePressed() {
  if (level == 0) {
    if (mouseX >= 50 && mouseX <= 170 &&
        mouseY >= 150 && mouseY <= 210) {
      level = 1;
      startGame();

    } else if (mouseX >= 190 && mouseX <= 310 &&
               mouseY >= 150 && mouseY <= 210) {
      level = 2;
      startGame();

    } else if (mouseX >= 330 && mouseX <= 450 &&
               mouseY >= 150 && mouseY <= 210) {
      level = 3;
      startGame();
    }

  } else if (gameOver == true) {
    if (mouseX >= 150 && mouseX <= 350 &&
        mouseY >= 300 && mouseY <= 350) {
      level = 0;
      score = 0;
      gameOver = false;
      message = "";
    }
  }
}

void startGame() {
  score = 0;
  gameOver = false;
  message = "";
  startTime = millis();
  newLetter();
}

void newLetter() {
  if (level == 1) {
    letter = "ab".charAt(int(random(2)));
  } else if (level == 2) {
    letter = "abcd".charAt(int(random(4)));
  } else if (level == 3) {
    letter = "abcdef".charAt(int(random(6)));
  }
}

void keyPressed() {
  if (level != 0 && gameOver == false) {
    if (key == letter) {
      score++;
      message = "Correct! Great work!";
      newLetter();
    } else {
      message = "Wrong!";
      gameOver = true;
      endTime = millis();
    }
  }
}
