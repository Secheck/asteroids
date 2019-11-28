boolean upkey, downkey, leftkey, rightkey, spacekey;
Ship myShip;
ArrayList<GameObject> myGameObjects;
int mode = 0; 
PImage spaceGif; 
PImage ship; 
int angle; 
float radius;
ArrayList<Particle> particles;



void setup() {
  size(800, 600);
  mode = 0; 
  spaceGif = loadImage("space.jpg");
  ship = loadImage("ship.png");
  spaceGif.resize(800, 600);
  myShip = new Ship(50);
  myGameObjects = new ArrayList<GameObject>(); 

  particles = new ArrayList<Particle>();
}

void draw() {
  background(spaceGif);
  imageMode(CENTER);
  particles.add(new Particle());
  myShip.show();
  myShip.act();
  if ( mode == 0 ) { 
    intro();
  } else if ( mode == 1 ) { 
    game();
  } else if ( mode == 2 ) {
    gameover();
  } else {
    println("Mode error!");
  }

  int i = 0;
  while (i < myGameObjects.size()) {
    GameObject myObj = myGameObjects.get(i);
    myObj.show();
    myObj.act();
    if (myObj.lives == 0) {
      myGameObjects.remove(i);
    } else {
      i++;
    }
  }

  for (i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.update();
    p.display();

    if (p.Dead()) {
      particles.remove(i);
    }
  }
}

void keyPressed() {
  if (keyCode == UP)    upkey = true; 
  if (keyCode == DOWN)  downkey = true;
  if (keyCode == LEFT)  leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (key == ' ')       spacekey = true;
}

void keyReleased() {
  if (keyCode == UP)    upkey = false; 
  if (keyCode == DOWN)  downkey = false;
  if (keyCode == LEFT)  leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
  if (key == ' ')       spacekey = false;
}

void mouseReleased() {
  if ( mode == 0 ) { 
    introClicks();
  } else if ( mode == 1 ) {  
    gameClicks();
  } else if ( mode == 2 ) {
    gameoverClicks();
  } else {
    println("Mode error!");
  }
}
