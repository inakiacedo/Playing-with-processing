Poblacion poblacion;


int cont = 0;
int generacion =1;

void setup(){
  size(600, 600);
  poblacion = new Poblacion();
}

void draw(){
  background(255);
  poblacion.run();
  cont++;
  if(cont == 399){
    cont = 0;
    generacion++;
  }
  fill(0);                          
  text("Gerenacion: " + str(generacion),15,15);
  text("Dia: " + str(poblacion.cont), 15, 30);
  //text("Mejor: " + str(poblacion.mejor),15,45);
}
