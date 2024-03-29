class VuoriLuokka implements Sisalto {
  
  KuusiLuokka kuusiLuokka;
  ArrayList<Float> takavuorenPisteet = new ArrayList<Float>(); //taaimmaisen vuoren y-koordinaatit
  ArrayList<Float> etuvuorenPisteet = new ArrayList<Float>(); //etummaisen vuoren y-koordinaatit
  private float[] ylareunanPisteet;
  ArrayList<Poro> porot = new ArrayList<Poro>();
  
  void setup() {
    
    kuusiLuokka = new KuusiLuokka(); // Artin lisäämä
    sisallot.add(kuusiLuokka);
    
    

    //Lisätään poroja
    int poroja = int(random(7))+1;
    for(int i = 0; i < poroja; i++) {
      Poro p = new Poro(annaYlareunanPisteet(),800);
      sisallot.add(p);
      porot.add(p);
    }  
    
    laskeEtuvuoret();
    
  }
  
  void draw() {
   teeTakavuoret();
    teeEtuvuoret();
  }
  
      /* Lasketaan ja piirretään etuvuoret */
    void teeTakavuoret(){
      
      //Lasketaan
      if (takavuorenPisteet.size() == 0) {
        float kulma = 0;
        float luku = random(1,3.2);
        float py;
        for(int i = 0; i<width; i++){
          py = 400 + (sin(kulma) + sin(luku*kulma)) * 25;
          if(py<450){
            line(i,py,i,450);
            takavuorenPisteet.add(py);
          }
          kulma += PI/200;
        }
      } 
      
      //Piirretään
      stroke(210,200,200);
      for (int i=0; i<takavuorenPisteet.size(); i++) {
          line(i, takavuorenPisteet.get(i), i, 450); 
      }
  
  
  
  
    }
    
    /* Lasketaan ja piirretään takavuoret */
    void teeEtuvuoret(){
      //Lasketaan etuvuoret
      //laskeEtuvuoret();
      
      //Piirretään etuvuoret
      stroke(255);
      for (int i=0; i<etuvuorenPisteet.size(); i++) {
        line(i, etuvuorenPisteet.get(i), i, 450); 
      }
      
      if(kuusiLuokka.ensimmainenKerta) {    
       kuusiLuokka.luoKuusikko();
      } else {
        kuusiLuokka.piirraSamatKuuset();
      }
     
    }
    
    void laskeEtuvuoret() {
      if (etuvuorenPisteet.size() == 0) {
        float[] ylareunanPisteet = new float[800]; // Artin lisäämä, Anssi vaihto nimen    
        float kulma3 = 0;
        float kulma2 = 0;
        float luku2 = random(0.80,1.5);
        float py2, py3;
        
        for(int j = 0; j<width; j++){
          py2 = 400 + (sin(luku2*kulma3)+sin(kulma3))*20;
          py3 = 400 + (sin(luku2*kulma2))*20;
  
          if(((py2+py3)/2)<450){
            etuvuorenPisteet.add((py2+py3)/2);
            //println("etupiste"+j);
          }
          kulma3 += PI/200;
          kulma2 += PI/200;
          
          
          if(j < 800) {
            ylareunanPisteet[j] = (py2+py3)/2;
            kuusiLuokka.lisaaListaan(ylareunanPisteet[j]);
          }
          for(int k = 0; k < porot.size(); k++) {
            porot.get(k).asetaYlarajataulukko(ylareunanPisteet);
          }
            
        }
      }
    }
  
  public float[] annaYlareunanPisteet() {
    return ylareunanPisteet;
  }
  
  
  
  
}
