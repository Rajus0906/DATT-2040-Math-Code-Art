public void mousePressed() {
 if (mousePressed) {
    Plane.fire();
    PewSound.amp(0.5);
    PewSound.play();
  }
   if (gameScreen=="START") {
    startGame();
  }
}
