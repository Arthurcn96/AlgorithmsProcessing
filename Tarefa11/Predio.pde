class Predio{

  PShape estrutura;
  PShape janela;
  PShape porta;

  int andar;
  color cor_janela;
  color cor_porta;

  Predio(){
    andar = int (random(1,10));
    estrutura = estrutura( andar );

    porta = porta();
    janela = janela();

  }

  void show(){

    push();
      translate(10,0,-95);
      shape(estrutura,0,0);

      translate(30,0,82);
      shape(porta,0,0);

      andar(andar);

    pop();

  }

  void andar(int x){
    int i, andares;
    andares = x;
    translate(0,-40,0);

    for(i = 0; i < andares; i++){
      push();
        translate(-25,-30 * i,0);
        shape(janela,0,0);
      pop();

      push();
        translate(15,-30 * i,0);
        shape(janela,0,0);
      pop();
    }
  }


  PShape porta(){
    push();

      int x = 20;
      int y = 30;

      float r = random(0, 130);
      float g = random(0, 130);
      float b = random(0, 130);

      PVector p1 = new PVector( 0,  0,  -1);
      PVector p2 = new PVector( 0,  -y, -1);
      PVector p3 = new PVector( x,  -y, -1);
      PVector p4 = new PVector( x,  0,  -1);

      PShape s = createShape();

      s.beginShape(QUADS);
      s.fill(int( random(1,100)), int( random(1,100)), int( random(1,100)) );
        s.vertex(p1.x, p1.y, p1.z);
        s.vertex(p2.x, p2.y, p2.z);
        s.vertex(p3.x, p3.y, p3.z);
        s.vertex(p4.x, p4.y, p4.z);
      s.endShape(CLOSE);

    pop();
    return s;

  }

  PShape janela(){
    push();
      int x = 30;
      int y = 20;

      float r = random(0, 130);
      float g = random(0, 130);
      float b = random(0, 130);

      PVector p1 = new PVector( 0,  0,  -1);
      PVector p2 = new PVector( 0,  -y, -1);
      PVector p3 = new PVector( x,  -y, -1);
      PVector p4 = new PVector( x,  0,  -1);

      PShape s = createShape();

      s.beginShape(QUADS);
        int rand = int( random(170,255));
        s.fill(rand, rand, rand - 60 );
        s.vertex(p1.x, p1.y, p1.z);
        s.vertex(p2.x, p2.y, p2.z);
        s.vertex(p3.x, p3.y, p3.z);
        s.vertex(p4.x, p4.y, p4.z);

      s.endShape(CLOSE);

    pop();

    return s;
  }


  PShape estrutura(int y_){
    int x = 80;
    int y = y_*30 + 40;

    // Criando pontos
    PVector p1 = new PVector( 0, 0, 0);
    PVector p2 = new PVector( 0, -y, 0);
    PVector p3 = new PVector( x, -y, 0);
    PVector p4 = new PVector( x, 0, 0);
    PVector p5 = new PVector( 0, 0,  x);
    PVector p6 = new PVector( 0, -y,  x);
    PVector p7 = new PVector( x, -y,  x);
    PVector p8 = new PVector( x, 0,  x);

    PShape s = createShape();

    s.beginShape(QUADS);
    s.fill(int( random(0,255)), int( random(0,255)), int( random(0,255)) );
      s.vertex(p1.x, p1.y, p1.z);
      s.vertex(p2.x, p2.y, p2.z);
      s.vertex(p3.x, p3.y, p3.z);
      s.vertex(p4.x, p4.y, p4.z);

      s.vertex(p1.x, p1.y, p1.z);
      s.vertex(p5.x, p5.y, p5.z);
      s.vertex(p6.x, p6.y, p6.z);
      s.vertex(p2.x, p2.y, p2.z);

      s.vertex(p3.x, p3.y, p3.z);
      s.vertex(p7.x, p7.y, p7.z);
      s.vertex(p8.x, p8.y, p8.z);
      s.vertex(p4.x, p4.y, p4.z);

      s.vertex(p8.x, p8.y, p8.z);
      s.vertex(p5.x, p5.y, p5.z);
      s.vertex(p6.x, p6.y, p6.z);
      s.vertex(p7.x, p7.y, p7.z);

      s.vertex(p2.x, p2.y, p2.z);
      s.vertex(p3.x, p3.y, p3.z);
      s.vertex(p7.x, p7.y, p7.z);
      s.vertex(p6.x, p6.y, p6.z);

    s.endShape();

    return s;

  }



}
