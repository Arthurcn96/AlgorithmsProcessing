//
//  Implementar e aplicar um filtro de espelhamento vertical e horizontal
//  em uma imagem salvar o resultado em um png.
//  Autor: Arthur Novais
//

import java.awt.*;
PImage img;
String name;
boolean espelhamento = true;

void setup() {

  // Abre a janela de para selecionar imagens 
  selectInput("Selecione uma imagem:", "fileSelected");
  do{
    delay(100);
  //Enquanto a imagem não foi selecionada espere
  }while(img == null);
  
  img.resize(width,height);
  image(img, 0, 0, width, height);
  size(1260,720);
  
  javax.swing.JOptionPane.showMessageDialog ( null, "Use o Clique do Mouse Para Alterar Entre Espelhamento Vertical e Horizontal", "Como usar", javax.swing.JOptionPane.INFORMATION_MESSAGE  );

  
}

void draw() {    
}

void mouseClicked() {
  if (espelhamento) {
    
    filtroHorizontal(img);
    image(img, 0, 0, width, height);
    save("Horizontal"+name);
    filtroHorizontal(img);
    espelhamento = !espelhamento;
    
  } else {
    
    filtroVertical(img);
    image(img, 0, 0, width, height);
    save("Vertical"+name);
    filtroVertical(img);
    espelhamento = !espelhamento;
    
  }
}

void filtroHorizontal(PImage img){
  img.loadPixels();
  
  int aux;
  
  for (int y = 0; y < height; y++){
    for (int x = 0, z = width-1; x < width/2; x++, z--){
      
      int start = x + y*width;
      int end = z + y*width;
      
      aux = img.pixels[start];
      img.pixels[start] = img.pixels[end];
      img.pixels[end] = aux;
    }
  }
  img.updatePixels();
}

void filtroVertical(PImage img){
  img.loadPixels();
  
  int aux;
  
  for (int y = 0, z = height-1; y < height/2; y++, z--){
    for (int x = 0; x < width; x++){
      
      int start = x + y*width;
      int end = x + z*width;
      
      aux = img.pixels[start];
      img.pixels[start] = img.pixels[end];
      img.pixels[end] = aux;
    }
  }
  img.updatePixels();
}

//Salva Imagem Quando Fecha Janela
void dispose(){
    javax.swing.JOptionPane.showMessageDialog ( null, "As Imagens Foi Salva Na Pasta Do Projeto", "Imagem Salva", javax.swing.JOptionPane.INFORMATION_MESSAGE  );
}


// Selecionar arquivos de imagem
void fileSelected(File selection) {
 
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
