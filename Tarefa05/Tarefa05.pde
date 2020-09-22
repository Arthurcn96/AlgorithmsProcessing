//
//  Implementar e aplicar um filtro de rotação
//  em uma imagem salvar o resultado em um png.
//  Autor: Arthur Novais
//

import java.awt.*;
PImage img;
int h,w;

void setup(){
  img = loadImage("Crown.png");

  size(800, 800);

  h = height;
  w = width;

  background(#E5E5FF);


}

void draw( ) {

  translate(w/2 - img.width/2, h/2 - img.height/2);

  image(img, 0, 0, img.width, img.height);

}
