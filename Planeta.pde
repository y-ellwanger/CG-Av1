class Planet {
  // Each planet object keeps track of its own angle of rotation.
  float theta;      // Rotation around sun
  float diameter;   // Size of planet
  float distance;   // Distance from sun
  float orbitspeed; // Orbit speed
  boolean twins;    // Flag to indicate twin moons
  color flavor;     // Color of planet
 
  // Each Planet now has a Moon!
  Moon moon;
  // One Planet will be randomly selected to have a second Moon
  Moon twin;
  
  Planet(float distance_, float diameter_, boolean twins_, color flavor_) {
    distance = distance_;
    diameter = diameter_;
    twins = twins_;
    flavor = flavor_;
    theta = 0;
    orbitspeed = random(0.01,0.03);
    
    float moon_distance = 24;
    float moon_diameter = 8;
    
    // create the Moon with a random distance and diameter within the ranges specified
    moon = new Moon(moon_distance, moon_diameter, random(-0.1,0.1));
    
    if (twins) {
      // Ensure that the attributes of the twin Moon are different from the original
      moon_distance = random(25, 36);
      moon_diameter = random (9, 12);
      
      float twin_orbitspeed = random(-0.1,0.1);
      
      if (twin_orbitspeed == moon.getorbitspeed())
        twin_orbitspeed = random(-0.1,0.1);
      
      // create the twin Moon
      twin = new Moon(moon_distance, moon_diameter, twin_orbitspeed);
    }
    else
      twin = null;
  }
  
  void update() {
    // Increment the angle to rotate
    theta += orbitspeed;
    // Update the moon
    moon.update();
    
    if (twins)
      twin.update();
  }
  
  void display() {
    // Before rotation and translation, the state of the matrix is saved with pushMatrix().
    pushMatrix(); 
    // Rotate orbit
    rotate(theta); 
    // translate out distance
    translate(distance,0); 
    stroke(0);
    fill(flavor);
    ellipse(0,0,diameter,diameter);
    // The planet is drawn, now draw the moon
    moon.display();
    
    if (twins)
      twin.display();
    
    // Once the planet is drawn, the matrix is restored with popMatrix() so that the next planet is not affected.
    popMatrix(); 
  }
}
