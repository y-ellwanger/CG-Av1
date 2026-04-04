// Um vetor de três objetos de Planeta
Planeta[] planetas = new Planeta[3];

void setup() {
  size(480, 480);
  
  // Gerar o número que decide qual dos planetas terá duas luas
  int numero_sorte = int(random(planetas.length));
  
  // Inicializar os planetas usando uma variável contadora
  for (int i = 0; i < planetas.length; i++) {
    // Gerar uma cor aleatória
    float r = random(256);
    float g = random(256);
    float b = random(256);
    
    if (i == numero_sorte)
      // Criar planeta com duas luas           v  v
      planetas[i] = new Planeta(60 + i*36, 24, true, color(r, g, b));
    else 
      planetas[i] = new Planeta(60 + i*36, 24, false, color(r, g, b));
  }
}

void draw() {
  background(255);

  // Desenhar o sol
  pushMatrix();
  translate(width/2, height/2);
  stroke(0);
  fill(255);
  ellipse(0, 0, 64, 64);

  // Desenhar os planetas
  for (int i = 0; i < planetas.length; i++) {
    planetas[i].update();
    planetas[i].display();
  }
  popMatrix();
}
