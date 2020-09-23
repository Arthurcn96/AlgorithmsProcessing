//
//  Implementar e aplicar um filtro de rotação
//  em uma imagem salvar o resultado em um png.
//  Autor: Arthur Novais
//

import java.awt.*;
PImage img;
String name;
int h,w;

void setup(){
   background(#E5E5FF);
   size(800, 800);
  
    // Abre a janela de para selecionar imagens 
  selectInput("Selecione uma imagem:", "fileSelected");
  do{
    delay(100);
  //Enquanto a imagem não foi selecionada espere
  }while(img == null);

  h = height;
  w = width;



}

void draw( ) {
  background(#E5E5FF);

  translate(w/2 - img.width/2, h/2 - img.height/2);

   image(img, 0, 0, img.width, img.height);

}

// Fecha o programa clicando 'q'
void keyPressed(){
  if (key == 'q'){
    exit();
  }if(key == 'o'){
      selectInput("Selecione uma imagem:", "fileSelected");
  }
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
