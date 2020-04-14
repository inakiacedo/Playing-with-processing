class Cohete{
  
  PVector pos; 
  PVector vel;
  PVector acc;
  float maxfit;
  PVector diana = new PVector(width/2, 50);
  boolean blanco = false;
  boolean choque = false;
  boolean choquebar = false;
  
  //He puesto los valores de una segunda barrera
  float xbar2 = 0;
  float anchura2 = 180;
  float ybar2 = 180;
  float altura2 = 5;
  //y una tercera
  float xbar3 = 420;
  float anchura3 = width;
  float ybar3 = 180;
  float altura3 = 5;
  
  boolean choquebar2;
  
  Barrera barrera = new Barrera();
  
  int lifespan = 400;
  PVector[] genes = new PVector[lifespan];
  
  Cohete(){
    maxfit = 0;
    pos = new PVector(width/2, height);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    ADN();
  }
  
  Cohete(PVector[] genesXX, PVector[] genesXY){
    maxfit = 0;
    pos = new PVector(width/2, height);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    reproduce(genesXX, genesXY);
  }
  
  void ADN(){
    for(int i = 0; i < lifespan; i++ ){
      genes[i] = PVector.random2D();
      genes[i].setMag(0.1);
      //genes[i].mult(-1);
    }
  }
  
  void showbar2(){
    fill(0);
    rect(xbar2, ybar2, anchura2, altura2);
  }
  
  void showbar3(){
    fill(0);
    rect(xbar3, ybar3, anchura3, altura3);
  }
  
  void reproduce(PVector[] genesXX, PVector[] genesXY){
    int longitud = genesXX.length;
    int mid = floor(random(longitud));
    for(int i = 0; i < longitud; i++){
      if(i < mid){
        genes[i] = genesXX[i];
      } else{
        genes[i] = genesXY[i];  
      }
    }
    mutate();
  }
  
  void mutate(){
    for(int i = 0; i < genes.length; i++){
      float aleatorio = random(1);
      if(aleatorio < 0.01){
        genes[i] = PVector.random2D();
        genes[i].setMag(0.1);
      }
    }
  }
  
  void evaluate(){
    if(!blanco && !choque && !choquebar && !choquebar2){
      float d = pos.dist(diana);
      float fit = map(d, 0, width, 1, 0);
      if (fit > maxfit){
        maxfit = fit;
      }
      if(d < 30){
        blanco = true;
        maxfit*=10;
      }
      if(choque){
        maxfit/=(2);
      }
      if(choquebar){
        maxfit/=10;
      }
      if(choquebar2){
        maxfit/=5;
      }
    }
  }
  
  void show_diana(){
  noStroke();
  fill(0);
  circle(diana.x, diana.y, 30);
  fill(255);
  circle(diana.x, diana.y, 25);
  fill(0, 0, 255);
  circle(diana.x, diana.y, 20);
  fill(255, 0, 0);
  circle(diana.x, diana.y, 15);
  fill(255, 255, 0);
  circle(diana.x, diana.y, 10);
}
  
  void applyforce(int j){
    acc.add(genes[j]);
  }
  
  void versichoca(){
    if(pos.x > barrera.x && pos.x < barrera.x + barrera.anchura && pos.y > barrera.y && pos.y < barrera.y + barrera.altura){
      choquebar = true;
    }
    if(pos.x > xbar2 && pos.x < xbar2 + anchura2 && pos.y > ybar2 && pos.y < ybar2 + altura2){
      choquebar2 = true;
    }
    if(pos.x > xbar3 && pos.x < xbar3 + anchura3 && pos.y > ybar3 && pos.y < ybar3 + altura3){
      choquebar2 = true;
    }
    if((pos.x < 0) || (pos.x > width) || (pos.y < 0) || (pos.y > height)  ){
      choque = true;
    }
  }
  
  void update(){
    barrera.show();
    showbar2();
    showbar3();
    versichoca();
    if(blanco){
      pos = diana.copy();
    }
  
    if(!blanco && !choque && !choquebar && !choquebar2){
      vel.add(acc);
      pos.add(vel);
      acc.mult(0);
    }
  }
  
  void show(){
    fill(0);
    push();
    translate(pos.x, pos.y);
    //rotate(vel.heading() + PI/2);
    rectMode(CENTER);
    //rect(0, 0, 10, 30);
    circle(0, 0, 20);
    fill(255, 200);
    circle(0, 0, 17);
    fill(0);
    circle(0, 0, 10);
    fill(255);
    circle(0, 0, 4);
    pop();
  }
}
