//
//
//
//  Autor: Arthur Novais
//

import java.awt.*;
PImage img, rotatedImg;

String name = null;

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

  rotatedImg = createImage(img.width, img.height, RGB);

  // Pega os angulo da imagem
  String graus = javax.swing.JOptionPane.showInputDialog("Deseja rotacionar a imagem em quantos graus?");
  ang = radians(float(graus));

}

void draw() {
 img.loadPixels();

 reverseRotating();

 image(rotatedImg, 0, 0, 800, 500);
 save("reverseRotatedImage.png");
}

void reverseRotating() {
  for (int x = 0; x < img.width; x++) {
    for (int y = 0; y < img.height; y++ ) {

      float rotatedY, rotatedX ;

      color c = img.get(x,y);
      rotatedX = reversedRotateX(ang, x, y);
      rotatedY = reversedRotateY(ang, x, y);

      rotatedImg.set((int)rotatedX,(int)rotatedY + 350, c);
    }
  }
  rotatedImg.updatePixels();

  for (int x = 0; x < rotatedImg.width; x++) {
    for (int y =-500; y < rotatedImg.height; y++ ) {
      float rotatedX = rotateX(ang, x, y);
      float rotatedY = rotateY(ang, x, y);

      color c = getPx(rotatedX,rotatedY);

      rotatedImg.set(x,y + 350, c);

     }
  }
  rotatedImg.updatePixels();
}

//Reverse rotating the x pixels
float reversedRotateX(float grau, int x, int y){
  return ((x * cos(radians(grau))) + y * (sin(radians(grau))));
}

//Reverse rotating the y pixels
float reversedRotateY(float grau,int x, int y){
  return ((x * (-sin(radians(grau)))) + y * cos(radians(grau)));
}

//Rotating the x pixels
int rotateX(float degrees,int x, int y) {
  return round(((x * cos(degrees)) + y * (-sin(degrees))));
}

//Rotating the y pixels
int rotateY(float degrees, int x, int y) {
  return round((x * sin(degrees) + ((cos(degrees)) * y)));
}

//Getting the pixels
color getPx (float x, float y){

      //Red pixels
      float pixelARed = red(img.get(floor(x), floor(y)));
      float pixelBRed = red(img.get(ceil(x), floor(y)));
      float pixelCRed = red(img.get(floor(x), ceil(y)));
      float pixelDRed = red(img.get(ceil(x), ceil(y)));

       //Green pixels
      float pixelAGreen = green(img.get(floor(x), floor(y)));
      float pixelBGreen = green(img.get(ceil(x), floor(y)));
      float pixelCGreen = green(img.get(floor(x), ceil(y)));
      float pixelDGreen = green(img.get(ceil(x), ceil(y)));

      //Blue pixels
      float pixelABlue = blue(img.get(floor(x), floor(y)));
      float pixelBBlue = blue(img.get(ceil(x), floor(y)));
      float pixelCBlue = blue(img.get(floor(x), ceil(y)));
      float pixelDBlue = blue(img.get(ceil(x), ceil(y)));

      float Dcol = (( x - floor(x) ));
      float Dlin = (( y - floor(y) ));

      float ctrlABRed = (Dcol * (pixelBRed - pixelARed)) + pixelARed;
      float ctrlCDRed = (Dcol * ( pixelDRed - pixelCRed)) + pixelCRed;

      float ctrlABGreen = (Dcol * (pixelBGreen - pixelAGreen)) + pixelAGreen;
      float ctrlCDGreen = (Dcol * ( pixelDGreen - pixelCGreen)) + pixelCGreen;

      float ctrlABBlue = (Dcol * (pixelBBlue - pixelABlue)) + pixelABlue;
      float ctrlCDBlue = (Dcol * ( pixelDBlue - pixelCBlue)) + pixelCBlue;

      float PxRed = Dlin * (ctrlCDRed - ctrlABRed) + ctrlABRed ;
      float PxGreen = Dlin * (ctrlCDGreen - ctrlABGreen) + ctrlABGreen ;
      float PxBlue = Dlin * (ctrlCDBlue - ctrlABBlue) + ctrlABBlue ;

      return color(PxRed, PxGreen, PxBlue);
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
