float newXmag, newYmag = 0;
PVector pos;
float xmag, ymag;
int zoom = 0;
int mX, mY ;

Rua rua;
Arvore arvore;
Predio predio1;
Predio predio2;
Predio predio3;

void setup(){
  size(500,500,P3D);

  rua = new Rua(300,10,100);
  arvore = new Arvore();

  predio1 = new Predio();
  predio2 = new Predio();
  predio3 = new Predio();

  mX = (width / 2);
  mY = (3*height / 4);

}


void draw(){
  background(50,50,200);
  camera();

  directionalLight(200, 200, 200, 50, 20, -60);
  ambientLight(255, 255, 255);

  rua.show();

  floresta();

  predio1.show();
  translate(100,0,0);
  predio2.show();
  translate(100,0,0);
  predio3.show();

}

void floresta(){

      arvore.show(100,100);

}

void mouseDragged() {

  if (mouseButton == LEFT) {
    newXmag = mouseX/float(width) * TWO_PI;
    newYmag = mouseY/float(height) * TWO_PI;

    float diff = xmag - newXmag;

    if (abs(diff) >  0.01) {
      xmag -= diff/4.0;
    }

    diff = ymag - newYmag;

    if (abs(diff) >  0.01) {
      ymag -= diff/4.0;
    }
  }
  if (mouseButton == RIGHT || mouseButton == CENTER) {
    mX = mouseX;
    mY = mouseY;
  }
}

/**
Rotacao da Camera
*/
void camera(){
  translate(mX, mY, zoom);
  rotateX(-ymag);
  rotateY(-xmag);
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  zoom += e*10;
}
