float newXmag, newYmag = 0;
float xmag, ymag = 0;
int zoom = 0;
int mX, mY;

Rua rua;
Arvore arvore;

void setup(){
  size(500,500,P3D);

  rua = new Rua(300,10,100);
  arvore = new Arvore();

  mX = (width / 2);
  mY = (height / 2);

}

void draw(){
  background(50,50,200);
  camera();

  directionalLight(255, 255, 255, 0, 10, 10);
  ambientLight(255, 255, 255);

  rua.show();
  arvore.show();




}

void mouseDragged() {

  if (mouseButton == LEFT) {
    newXmag = mouseX/float(width) * TWO_PI;
    newYmag = mouseY/float(height) * TWO_PI;

    float diff = xmag-newXmag;
    if (abs(diff) >  0.01) {
      xmag -= diff/4.0;
    }

    diff = ymag-newYmag;
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
