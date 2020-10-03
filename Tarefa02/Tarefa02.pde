//
//	Programa para gerar gerar e salvar a imagem de um prédio
//	Autor: Arthur Novais
//

void setup() {
  size(600, 600);
}

void draw() {

  arvore();
  predio();

  frameRate(0.5);
  save("predio.png");
}

//Salva a imagem ao fechar janela
void dispose(){
    javax.swing.JOptionPane.showMessageDialog ( null, "A Imagem Foi Salva Na Pasta Do Projeto", "Imagem Salva", javax.swing.JOptionPane.INFORMATION_MESSAGE  );
    //save("predio.png");
}

//Função que desenha a Árvore
void arvore() {

  pushMatrix();
  strokeWeight(2);
  translate(75, 450);
  fill(132, 96, 53);
  rect(0, 0, 45, 150);

  translate(23, 0);
  fill(42, 153, 16);
  ellipse(0, 0, 185, 110);
  popMatrix();
}


//Função que desenha o prédio
void predio() {

  pushMatrix();
    translate(260, 20);
    fill(132, 179, 181);
    rect(0, 0, 320, 580);

  int j, i = 0;

  //Desenha as janelas
  while(i<5){
    janela(true, 30+(90*i), 30);
    janela(true, 30+(90*i), 170);
    i++;
  }

  //Desenha a janela fechada
  i = (int)random(1,5);
  janela(false, 30+(90*i), 170);

  i = (int)random(1,5);
  janela(false, 30+(90*i), 30);

  do{
    j = (int)random(1,5);
    janela(false, 30+(90*j), 30);
  }while(j==i);

  porta();


  popMatrix();

}

//Função que desenha a janela
void janela(Boolean aberta, int d, int l) {
  int h, w;
  w=120;
  h=60;

  pushMatrix();

    translate(l, d);

    if (aberta) {
      fill(255, 255, 0);
      rect(0, 0, w, h);
      translate(w/2, 0);
      line(0, 0, 0, h);
    } else {
      fill(0, 0, 0);
      rect(0, 0, w, h);
      translate(w/2, 0);
      line(0, 0, 0, h);
    }
    popMatrix();

}

//Função que desenha a porta
void porta() {
  int h, w;
  h=90;
  w=130;

  translate((320-w)/2, 580-h);
  fill(0, 53, 88);
  rect(0, 0, w, h);
  translate(w/2, 0);
  line(0, 0, 0, h);

  strokeWeight(10);
  point(20, h/2);
  point(-20, h/2);
}
