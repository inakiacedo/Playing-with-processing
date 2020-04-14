class Poblacion{
  
  int numpop = 30;
  Cohete[] cohetes;
  int cont = 0;
  ArrayList<PVector[]> tinder;
  
  Poblacion(){
   cohetes = new Cohete[numpop];
    for(int i = 0; i < cohetes.length; i++ ){
      cohetes[i] = new Cohete();   
    }
  }
  
  Poblacion(ArrayList<PVector[]> tinder){
    cohetes = new Cohete[numpop];
    for(int i = 0; i < cohetes.length; i++ ){
      int index1 = floor(random(0, tinder.size()));
      int index2 = floor(random(0, tinder.size()));
      cohetes[i] = new Cohete(tinder.get(index1), tinder.get(index2));   
    }
  }
  
  void run(){
    cohetes[1].show_diana();
    if (cont == cohetes[1].genes.length){
      cont = 0;
      downloadtinder();
      poblacion = new Poblacion(tinder);
    }
    for(int i = 0; i < cohetes.length; i++){
      cohetes[i].evaluate();
      cohetes[i].applyforce(cont);
      cohetes[i].update();
      cohetes[i].show();
    }
    cont++;
  }
 
  void downloadtinder(){
    tinder = new ArrayList<PVector[]>();
    for(int i = 0; i < cohetes.length; i++){
      for(int j = 0; j < floor((cohetes[i].maxfit)*100); j++){
        tinder.add(cohetes[i].genes);
      }
    }
  }
}
