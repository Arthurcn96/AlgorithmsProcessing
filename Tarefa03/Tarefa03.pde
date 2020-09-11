//
//	Implementar e aplicar um filtro negativo
//	em uma imagem salvar o resultado em um png.
//	Autor: Arthur Novais
//

import java.awt.*;
PImage img;
String name;

  
void setup() {

  // Abre a janela de para selecionar imagens 
  selectInput("Selecione uma imagem:", "fileSelected");
  do{
    delay(100);
  //Enquanto a imagem não foi selecionada espere
  }while(img == null);
  
  img.resize(width,height);
  
  size(1260,720);
  
}

void draw() {
    //Abre a imagem e aplica o filtro na imagem
    image(img, 0, 0, width, height);
    filtro(img)
}

void filtro(PImage img){
    
}

//Salva Imagem Quando Fecha Janela
void dispose(){
    javax.swing.JOptionPane.showMessageDialog ( null, "A Imagem Foi Salva Na Pasta Do Projeto", "Imagem Salva", javax.swing.JOptionPane.INFORMATION_MESSAGE  );
    save("inverted"+name);
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
