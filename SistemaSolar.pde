// An array of 4 planet objects
Planet[] planets = new Planet[3];

void setup() {
  size(480, 480);
  
  // Getting the number that decides which one of the planets will have twin moons
  int lucky_number = int(random(planets.length));

  // The planet objects are initialized using the counter variable
  for (int i = 0; i < planets.length; i++ ) {
    // Getting a random color
    float r = random(256);
    float g = random(256);
    float b = random(256);
    
    if (i == lucky_number)
      planets[i] = new Planet(60 + i*36, 24, true, color(r, g, b));
    else
      planets[i] = new Planet(60 + i*36, 24, false, color(r, g, b));
  }
}

void draw() {
  background(255); //<>//

  // Drawing the Sun
  pushMatrix();
  translate(width/2, height/2);
  stroke(0); //<>//
  fill(255);
  ellipse(0, 0, 64, 64);

  // Drawing all Planets
  for (int i = 0; i < planets.length; i++ ) {
    planets[i].update();
    planets[i].display();
  }
  popMatrix();
}
