void intro() {
  background(#2D2574);
  textSize(50);
  text("Asteroids!", 290, 300);
  text("start", 350, 500);
}



void introClicks() {
  mode = 1;
  
  myGameObjects.add(new Asteroid());
  myGameObjects.add(new Asteroid());
  myGameObjects.add(new Asteroid());
}
