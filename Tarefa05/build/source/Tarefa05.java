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

public class Tarefa05 extends PApplet {

//
//  Implementar e aplicar um filtro de rotação
//  em uma imagem salvar o resultado em um png.
//  Autor: Arthur Novais
//


PImage img;
int h,w;

public void setup(){
  img = loadImage("Crown.png");

  

  h = height;
  w = width;

  background(0xffE5E5FF);


}

public void draw( ) {

  translate(w/2 - img.width/2, h/2 - img.height/2);

  image(img, 0, 0, img.width, img.height);


}
  public void settings() {  size(800, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Tarefa05" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
