class Particle {
PVector location;
PVector velocity;
PVector acceleration;

float life = 255;

Particle() {
  acceleration = new PVector(0, 0.05);
  velocity = new PVector(random(-1, 1), random(-1, 1));
  location = new PVector(width/2, 50);
}

void update() {
  velocity.add(location);
  acceleration.add(velocity);

  life -= 2;
}

boolean Dead() {
  if (life <= 0) {
    return true;
  } else {
    return false;
  }
}

void display() {
  stroke(0, life);
  strokeWeight(2);
  fill(127, life);
  ellipse(location.x, location.y, 12, 12);
}
}
