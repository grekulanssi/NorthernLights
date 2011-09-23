class Lapintausta implements Sisalto{


  int ykorkeus = int(random(400,450));
  boolean piirretaankoKuuset; // Artin lisäämä
  boolean piirretaankoKuusikko; // Artin lisäämä
  KuusiLuokka kuusiLuokka; // Artin lisäämä
  
  //Tomi tästä eteenpäin
  float kuunX = 0, kuunY = 0; //Kuun sijaintikoordinaatit
  ArrayList<Float> takavuorenPisteet = new ArrayList<Float>(); //taaimmaisen vuoren y-koordinaatit
  ArrayList<Float> etuvuorenPisteet = new ArrayList<Float>(); //etummaisen vuoren y-koordinaatit
  
  void setup(){
    background(3,3,30);
    smooth();

    piirretaankoKuuset = true; // Artin lisäämä
    piirretaankoKuusikko = true; // Artin lisäämä
    kuusiLuokka = new KuusiLuokka(); // Artin lisäämä
    kuusiLuokka.kuuset = new ArrayList(); // Artin lisäämä
    int ykorkeus = int(random(400,450));
   
  }
  
  
  void draw(){
      background(5,5,50); //piirretään tausta uudestaan
      teeKuu();
      teeTakavuoret();
      teeEtuvuoret();
  }
  
  /* Piirretään kuu */
  void teeKuu(){
    //Ensimmäisellä kerralla määritetään kuun sijainti
    if(kuunX == 0) {      
      kuunX  = random(50,750);
      kuunY = random(50,300);      
    }
    //Piirretään kuu
    ellipseMode(CENTER);
    fill(190,175,120);
    //fill(255,236,139);
    noStroke();
    ellipse(kuunX,kuunY,50,50);
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
    if (etuvuorenPisteet.size() == 0) {
      float[] taulukko = new float[800]; // Artin lisäämä    
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
          taulukko[j] = (py2+py3)/2;
          kuusiLuokka.lisaaListaan(taulukko[j]);
        }
          
      }
    }
    //Piirretään etuvuoret
    stroke(255);
    for (int i=0; i<etuvuorenPisteet.size(); i++) {
      line(i, etuvuorenPisteet.get(i), i, 450); 
    }
    
    kuusiLuokka.luoKuusikko();
   
  }
  
  
}
