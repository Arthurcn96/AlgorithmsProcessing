PShape folhas;
PShape caule;

class Arvore{
  int x, y, z;
  int localx, localy;

  Arvore(){

      caule = caule();
      folhas = folhas();

  }

  void show(float x_, float y_){
    push();
      localx = int(x_);
      localy = int(y_);

      translate(localx,-30,localy);

      push();
        translate(0,0,0);
        shape(caule, 0, 0);
      pop();

      push();
        translate(-10,0,-10);
        shape(folhas, 0, 0);
      pop();

    pop();

  }

  PShape caule(){
    x = 6;
    y = 30;
    z = 6;

    // Criando pontos
    PVector p1 = new PVector( 0, 0, 0);
    PVector p2 = new PVector( 0, y, 0);
    PVector p3 = new PVector( x, y, 0);
    PVector p4 = new PVector( x, 0, 0);
    PVector p5 = new PVector( 0, 0, z);
    PVector p6 = new PVector( 0, y, z);
    PVector p7 = new PVector( x, y, z);
    PVector p8 = new PVector( x, 0, z);

    PShape s = createShape();


    s.beginShape(QUADS);
    s.fill(48, 32, 4);

      s.noStroke();
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

      s.vertex(p8.x, p8.y, p8.z);
      s.vertex(p4.x, p4.y, p4.z);
    s.endShape(CLOSE);

    return s;

  }

  PShape folhas(){

    x = 26;
    y = - 40;
    z = 26;

    // Criando pontos
    PVector p1 = new PVector( 0, 0, 0);
    PVector p2 = new PVector( x, 0, 0);
    PVector p3 = new PVector( x, 0, z);
    PVector p4 = new PVector( 0, 0, z);
    PVector p5 = new PVector( x/2, y, z/2);

    PShape s = createShape();

    s.beginShape(TRIANGLES);
    s.fill(20, 69, 0);
      s.noStroke();
      s.vertex(p5.x, p5.y, p5.z);
      s.vertex(p1.x, p1.y, p1.z);
      s.vertex(p2.x, p2.y, p2.z);

      s.vertex(p5.x, p5.y, p5.z);
      s.vertex(p2.x, p2.y, p2.z);
      s.vertex(p3.x, p3.y, p3.z);

      s.vertex(p5.x, p5.y, p5.z);
      s.vertex(p3.x, p3.y, p3.z);
      s.vertex(p4.x, p4.y, p4.z);

      s.vertex(p5.x, p5.y, p5.z);
      s.vertex(p4.x, p4.y, p4.z);
      s.vertex(p1.x, p1.y, p1.z);


    s.endShape(CLOSE);

    return s;


  }

}
