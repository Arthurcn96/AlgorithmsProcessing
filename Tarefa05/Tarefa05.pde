//
//  Implementar e aplicar um filtro de rotação
//  em uma imagem salvar o resultado em um png.
//  Autor: Arthur Novais
//

import java.awt.*;
PImage img;
String name;
int h,w;
float xx,yy;
float h_resize;
float w_resize;
int aux = 0;
int pontos = 50;
int tamanho = 2;
int x, loc, y = 0;

// ANGULO
float ang;

void setup(){
   background(#E5E5FF);
   size(700, 700);

    // Abre a janela de para selecionar imagens
  selectInput("Selecione uma imagem:", "fileSelected");
  do{
    delay(100);
    //Enquanto a imagem não foi selecionada espere
  }while(img == null);

  h = height;
  w = width;

  // Muda o tamanho da imagem original
  h_resize = w/3;
  w_resize = w/3;
  img.resize(int(h_resize), int(w_resize));

  // Pega os angulo da imagem
  String graus = javax.swing.JOptionPane.showInputDialog("Deseja rotacionar a imagem em quantos graus?");
  ang = radians(float(graus));

}

void draw() {
  translate(w/2 , h/2 );
  float r, g, b;

  if( y < h_resize){

    for( x = 0; x < w_resize; x++){

      loc = x + y*img.width;

      // Look up the RGB color in the source image
      loadPixels();
      r = red(img.pixels[loc]);
      g = green(img.pixels[loc]);
      b = blue(img.pixels[loc]);
      noStroke();

      xx = x * (cos (ang)) + y * (- sin (ang));
      yy = x * (sin (ang)) + y * (cos (ang));

      fill(r,g,b,100);
      square(xx, yy, tamanho);

    }

    y++;

  }else{
    y = 0;
    noLoop();
  }

  frameRate(60);

}

//Salva Imagem Quando Fecha Janela
void dispose(){
    javax.swing.JOptionPane.showMessageDialog ( null, "A Imagem Foi Salva Na Pasta Do Projeto", "Imagem Salva", javax.swing.JOptionPane.INFORMATION_MESSAGE  );
    save("rotated"+name);
}

// Fecha o programa clicando 'q'
void keyPressed(){
  if (key == 'q'){
    exit();
  }
}

// Selecionar arquivos de imagem
void fileSelected(File selection) {

  if (selection == null) {

    // println("Nenhum arquivo selecionado.");
    javax.swing.JOptionPane.showMessageDialog ( null, "Você deve escolher um arquivo", "Nenhum Arquivo Selecionado", javax.swing.JOptionPane.WARNING_MESSAGE  );
    selectInput("Selecione uma imagem:", "fileSelected");

  }
  else {
    String[] list;

    // println("User selected " + selection.getAbsolutePath());
    name = selection.getName();
    list = split(name,'.');

    //Caso o arquivo tenha uma extensão de imagem
    if( list[1].equals("jpg") || list[1].equals("png") || list[1].equals("tga")){
      img = loadImage(selection.getAbsolutePath());
    }else{
      javax.swing.JOptionPane.showMessageDialog ( null, "Você deve escolher um formato .png, .jpeg ou .jpg", "Formato Inválido", javax.swing.JOptionPane.WARNING_MESSAGE  );
      selectInput("Selecione uma imagem:", "fileSelected");
    }
  }

}
