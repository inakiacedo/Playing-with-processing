class Barrera{
  
  float x;
  float y;
  float anchura;
  float altura;
  
  Barrera(){
    x = 150;
    anchura = 250;
    y = 300;
    altura = 5;
  }
  
  void show(){
    fill(0);
    rect(x, y, anchura, altura);
  }
}
