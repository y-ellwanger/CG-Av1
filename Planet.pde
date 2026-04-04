class Planeta {
  // Cada objeto de Planeta cuida do seu próprio ângulo de rotação
  float theta;             // Rotação ao redor do sol
  float diametro;          // Tamanho do planeta
  float distancia;         // Distância do sol
  float velocidade_orbita; // Velocidade da órbita
  boolean duas_luas;       // Se o planeta tem duas luas ou não
  color cor;               // Cor do planeta
 
  // Cada planeta agora possui uma lua
  Lua lua;
  // Um planeta possui uma segunda lua
  Lua lua_irma;
  
  Planeta(float distancia_, float diametro_, boolean duas_luas_, color cor_) {
    distancia = distancia_;
    diametro = diametro_;
    duas_luas = duas_luas_;
    cor = cor_;
    theta = 0;
    velocidade_orbita = random(0.01, 0.03);
    
    // Criar a lua a 24 pixels do planeta com um diâmetro de oito
    lua = new Lua(24, 8, random(-0.1, 0.1));
    
    if (duas_luas) {
      float distancia_irma = random(25, 36);
      float diametro_irma = random (9, 12);
      float velocidade_orbita_irma = random(-0.1, 0.1);
      
      // Garantir que a velocidade da órbita da segunda lua é diferente
      if (velocidade_orbita_irma == lua.get_velocidade_orbita())
        velocidade_orbita_irma = random(-0.1, 0.1);
      
      // Criar a segunda lua
      lua_irma = new Lua(distancia_irma, diametro_irma, velocidade_orbita_irma);
    }
  }
  
  void update() {
    // Incrementar o ângulo para rotacionar
    theta += velocidade_orbita;
    // Atualizar a lua
    lua.update();
    
    if (duas_luas)
      // Atualizar a segunda lua
      lua_irma.update();
  }
  
  void display() {
    // Antes da rotação e translação, o estado da matriz é salvo com pushMatrix()
    pushMatrix(); 
    // Rotacionar órbita
    rotate(theta); 
    // Transladar distância
    translate(distancia, 0); 
    stroke(0);
    fill(cor);
    ellipse(0, 0, diametro, diametro);
    // Desenhar a lua
    lua.display();
    
    if (duas_luas)
      // Desenhar a segunda lua
      lua_irma.display();
    
    // Uma vez que o planeta é desenhado, a matriz é restaurada com popMatrix() para o próximo planeta nao ser afetado
    popMatrix(); 
  }
}
