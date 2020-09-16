import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.awt.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Tarefa03 extends PApplet {

//
//  Implementar e aplicar um filtro negativo
//  em uma imagem salvar o resultado em um png.
//  Autor: Arthur Novais
//


PImage img;
String name;

public void setup() {

  // Abre a janela de para selecionar imagens 
  selectInput("Selecione uma imagem:", "fileSelected");
  do{
    delay(100);
  //Enquanto a imagem não foi selecionada espere
  }while(img == null);

  img.resize(width,height);
  

}

public void draw() {

    image(img, 0, 0, width, height);
    filtro(img);

    noLoop();
}

public void filtro(PImage img){

loadPixels();

//Carrega os pixels

for (int y = 0; y < height; y++){
  for (int x = 0; x < width; x++){
    int loc = x + y*width;

    //Salva os valores dos pixels
    float R = red(img.pixels[loc]);
    float G = green(img.pixels[loc]);
    float B = blue(img.pixels[loc]);

    //Salvando as novas cores
    pixels[loc] = color(255 - R,255 - G,255 - B);
  }
}

//Atualiza a imagem com os novos pixels
updatePixels();

}

//Salva Imagem Quando Fecha Janela
public void dispose(){
    javax.swing.JOptionPane.showMessageDialog ( null, "A Imagem Foi Salva Na Pasta Do Projeto", "Imagem Salva", javax.swing.JOptionPane.INFORMATION_MESSAGE  );
    save("inverted"+name);
}


// Selecionar arquivos de imagem
public void fileSelected(File selection) {

  if (selection == null) {

    println("Nenhum arquivo selecionado.");
    javax.swing.JOptionPane.showMessageDialog ( null, "Você deve escolher um arquivo", "Nenhum Arquivo Selecionado", javax.swing.JOptionPane.WARNING_MESSAGE  );
    selectInput("Selecione uma imagem:", "fileSelected");

  }
  else {
    String[] list;

    println("User selected " + selection.getAbsolutePath());
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
  public void settings() {  size(1260,720); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Tarefa03" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
