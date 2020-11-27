//
//  realizada é criar a planta de uma casa (ou prédio)
//  3D com janelas, um teto, portas e árvores.
//  Autor: Arthur Novais
//

// Variaveis da Camera
float newXmag, newYmag = 0;
float xmag, ymag;
int zoom = -50;
int mX, mY ;

// Posicao da arvores
PVector[]  array = new PVector[40];

// Estruturas da renderizacao
Rua rua;
Arvore arvore;
Predio predio1;
Predio predio2;
Predio predio3;

void setup(){
  size(500,500,P3D);
  inicio();

  mX = (width / 2);
  mY = (3*height / 4);

  inicializar();

}

void inicializar(){
  rua = new Rua(300,10,100);
  arvore = new Arvore();
  predio1 = new Predio();
  predio2 = new Predio();
  predio3 = new Predio();

  // Gerando a posicao das arvores
  int i,x ,y;
  for(i = 0; i < 40; i++){
    x = int( random(10,290) );
    y = int( random(100,190) );
    array[i] = new PVector(x,y);
  }
}

void inicio(){
  String texto = "Funcionalidades:\n 'Botão Direito' - Rotaciona a Camera \n 'Botão Esquerdo' - Altera a posicao da renderização \n 'Scroll do Mouse' - Zoom in e Zoom out \n 'Espaço' - Gera uma nova cidade";
  javax.swing.JOptionPane.showMessageDialog ( null, texto, "Imagem Salva", javax.swing.JOptionPane.INFORMATION_MESSAGE  );
}



void draw(){
  camera();
  directionalLight(200, 200, 200, 50, 20, -60);
  ambientLight(255, 255, 255);
  background(50,50,200);

  //Gera (n*2)+1 "Bairros"
  cidade(6);

  frameRate(24);

}

//Carrega todas as Cidades em suas posicoes
void cidade(int bairros){
  push();
    rua.show();
    floresta();
    predio1.show();
    translate(100,0,0);
    predio2.show();
    translate(100,0,0);
    predio3.show();
  pop();

  for(int i = 0; i < bairros; i++){
    push();
    translate(-300*i,0,0);
      rua.show();
      floresta();
      predio1.show();
      translate(100,0,0);
      predio2.show();
      translate(100,0,0);
      predio3.show();
    pop();

    push();
    translate(300*i,0,0);
      rua.show();
      floresta();
      predio1.show();
      translate(100,0,0);
      predio2.show();
      translate(100,0,0);
      predio3.show();
    pop();

  }
}

//Carrega todas as arvores em suas posicoes
void floresta(){

  int i;
  for(i = 0; i < 40; i++){
    arvore.show(array[i].x, array[i].y);
  }

}

void mouseDragged() {

  if (mouseButton == LEFT) {
    newXmag = mouseX/float(width) * TWO_PI;
    newYmag = mouseY/float(height) * TWO_PI;

    float diff = xmag - newXmag;

    if (abs(diff) >  0.01) {
      xmag -= diff/4.0;
    }

    diff = ymag - newYmag;

    if (abs(diff) >  0.01) {
      ymag -= diff/4.0;
    }
  }
  if (mouseButton == RIGHT) {
    mX = mouseX;
    mY = mouseY;
  }

}

//Espaco para gerar outra cidade
void keyPressed(){
  if (keyCode == ' ' ) {
  inicializar();
  }
}

//Rotacao da Camera
void camera(){
  translate(mX, mY, zoom);
  rotateX(map(-ymag, 0, 400, -50, 50));
  rotateY(map(-xmag, 0, 400, -100, -20));
}
//Zoom da Camera
void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  zoom += e*10;
}
