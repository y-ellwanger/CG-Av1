class Lua {
  // Cada objeto de Lua cuida do seu próprio ângulo de rotação
  float theta;             // Rotação ao redor do sol
  float diametro;          // Tamanho da lua
  float distancia;         // Distância do sol
  float velocidade_orbita; // Velocidade da órbita
  
  Lua(float distancia_, float diametro_, float velocidade_orbita_) {
    distancia = distancia_;
    diametro = diametro_;
    velocidade_orbita = velocidade_orbita_;
    theta = 0;
    velocidade_orbita = random(-0.1, 0.1);
  }
  
  float get_velocidade_orbita() {
    return velocidade_orbita;
  }
  
  void update() {
    // Incrementar o ângulo para rotacionar
    theta += velocidade_orbita;
  }
  
  void display() {
    // Antes da rotação e translação, o estado da matriz é salvo com pushMatrix()
    pushMatrix(); 
    // Rotacionar órbita
    rotate(theta); 
    // Transladar distância
    translate(distancia, 0); 
    stroke(0);
    fill(175);
    ellipse(0, 0, diametro, diametro);
    // Uma vez que a lua é desenhada, a matriz é restaurada com popMatrix() para o próximo planeta não ser afetado
    popMatrix(); 
  }
}
