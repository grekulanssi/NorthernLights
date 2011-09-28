
/**

Revontuliluokka

Käytetty apuna Processingin Gradient ja AddictiveWave exampleja.

*/

class Revontulet implements Sisalto {
    
  //Revontulen koko, asento ja sijainti
  int revontulenleveys;
  int aloitusX;
  int aloitusY;
  float vinouskerroin;
  
  //Revontulen muoto
  int xspacing;   // aaltojen väli x-suunnassa
  int maxwaves = 3;   // montako aaltoa lisätään yhteen
  int vaakaGradient = 100; //vaakasuunnassa tapahtuvan liukuvärin väli
  
  //Muut muuttujat
  boolean aloitaUusi; // aloitetaanko seuraavalla klikkauksella uusi revontuli
  float revontuliaika; // revontulen luontiaika
  
  //Revontulen tietoja
  float theta = 0.0;
  float[] amplitude = new float[maxwaves];   // aallon korkeus
  float[] dx = new float[maxwaves];
  float[] yvalues; //revontulen oikeat y-arvot 
  float[] ymouses; //hiireltä saadut y-arvot
  
  //Revontulen värit
  float arpa;
  color tulenvari;
  
  /* Tämä metodi asettaa muistiin klikatut pisteet */
  void asetaPiste(int x1, int x2, int y1, int y2) {    

   float xdif = x2-x1;
   float ydif = y2-y1;
   float perone = ydif/xdif;
   
   //Hiirtä voi vetää vain vasemmalta oikealle
   if (xdif < 0)
     return;
   
   //Piirretään viivaa
   for (int q=0; q<=xdif; q++) {
    ymouses[x1+q] = y1+q*perone;
   }
   
   
  }
  
  void setup() {
    
    //Asetetaan revontulelle varalta tietyt arvot (nämä muuttuvat myöhemmin)
    revontulenleveys = (int)random(500,700);
    aloitusX = 0;
    aloitusY = 0;
    
    //Arvotaan revontulen muodolle määrittelyt
    vinouskerroin = random(-0.2, 0.2);    
    xspacing = (int)random(2,4.8);
    aloitaUusi = true;
    
    
    // Arvotaan revontulta
    for (int i = 0; i < maxwaves; i++) {
      amplitude[i] = random(3,10);
      float period = random(400,900); // How many pixels before the wave repeats
      dx[i] = (TWO_PI / period) * xspacing;
    }
  
    
    //Nollataan revontulen y(x) -käyrä
    yvalues = new float[revontulenleveys];
    ymouses = new float[revontulenleveys];
    
    for (int i = 0; i < ymouses.length; i++) {
      ymouses[i] = -9999;
    }

  }
  
  
  
  
  void draw() {
    
    
    int yKorjaus = 150; //paljonko revontulta siirretään hiireen nähden
    
    /* Hiirtä ei paineta, piirtäminen on päättynyt, aktivoidaan aloitaUusi */
    if (mousePressed == false && aloitaUusi == false) {
      aloitaUusi = true;      
    }
    
    /* Painetaan hiirtä ja aloitetaan uusi revontuli */
    if (aloitaUusi == true && mousePressed) {
      arpa = random(0,3.4);

      setup();
      aloitusX = mouseX;
      aloitusY = mouseY-yKorjaus;
    }
    
    /* Painetaan hiirtä, otetaan talteen revontulen pisteitä */
    if (mousePressed && pmouseX-aloitusX >= 0 && mouseX-aloitusX < revontulenleveys) {
      asetaPiste(pmouseX-aloitusX, mouseX-aloitusX, pmouseY-yKorjaus, mouseY-yKorjaus);
      aloitaUusi = false;
  }    
    
    /* Piirretään revontuli */
      calcWave();
      renderWave();      

   
    
  }
  
  /* Tämä metodi piirtää pystypalkkigradientin */
  void setGradient(int x, int y, float w, float h, color c1, color c2 ){

   
    //c2 on revontulen väri
  
    // column
    for (int i=x; i<=(x+w); i++){
      // row
      for (int j = y; j<=(y+h); j++){
        
        int alfa = (int)(((float)(j-y)/h)*255);
        
        if (alpha(c2) < alfa) {
          alfa = (int)(alpha(c2));
        }
        
        color c = color(
        (red(c2)),
        (green(c2)),
        (blue(c1)), alfa);
        
       stroke(c);
       point(i,j);
      }  
    }  
    
  }
  
  
  /* Tämä metodi laskee revontulen sinicosiniaallon */
  void calcWave() {
    // Increment theta (try different values for 'angular velocity' here
    theta += 0.02;
  
    // Set all height values to zero
    for (int i = 0; i < yvalues.length; i++) {
      yvalues[i] = ymouses[i];
    }
   
    // Accumulate wave height values
    for (int j = 0; j < maxwaves; j++) {
      float x = theta;
      for (int i = 0; i < yvalues.length; i++) {
        // Every other wave is cosine instead of sine
        if (j % 2 == 0)  yvalues[i] += sin(x)*amplitude[j];
        else yvalues[i] += cos(x)*amplitude[j];
        x+=dx[j];
      }
    }
  }
  
  /* Tämä metodi renderöi revontulen */
  void renderWave() {

    //Piirretään liukuväripystypalkkeja vierekkäin
    for (int x = 0; x < yvalues.length ; x++) {
  
      noStroke();   
      int luku = x % vaakaGradient;
      int ero = Math.abs(vaakaGradient/2-luku);
      int feidiSivusta = 200;
      
     if(int(arpa) == 0){
       tulenvari = color(0, 181+(ero), 0, 255);
       //println(0);
     } 
     if(int(arpa) == 1){
       tulenvari = color(181+(ero), 0, 0, 255);
       //println(1);
     } 
     if(int(arpa) == 2){
       tulenvari = color(181+(ero),255,0,255);
       //println(2);
     } 
     if(int(arpa) == 3){
       tulenvari = color(181+(ero),0,106,255);
       //println(3);
     }

      //color tulenvari = color(0, 181+(ero), 0, 255); //tulenvarireuna vaihtelee
      //color tulenvari = color(181+(ero), 0, 0, 255); //tulenvarireuna vaihtelee
      //color tulenvari = color(0, 0, 181+(ero), 255); //tulenvarireuna vaihtelee
      //color tulenvari = color(181+(ero),255,0,255);
      //color tulenvari = color(181+(ero),0,106,255);
      
      /* Revontulen reunat feidaa */
      if (x <= feidiSivusta) {
        float valmius = (float)x/feidiSivusta;
        //println(valmius);
        tulenvari = color(red(tulenvari), green(tulenvari), blue(tulenvari), (int)(valmius*255)); //tulenvarireuna vaihtelee

    }
      
      else if (x >= revontulenleveys-feidiSivusta) {
        float valmius = 1-((float)(x-revontulenleveys+feidiSivusta))/feidiSivusta;
        //println(valmius);
        tulenvari = color(red(tulenvari), green(tulenvari), blue(tulenvari), (int)(valmius*255)); //tulenvarireuna vaihtelee
      }
      
      color tausta = color(5, 5,50); //yläreuna
      
      setGradient(aloitusX+x, aloitusY+(int)(yvalues[x]+vinouskerroin*x),
                 1, 150, tausta, tulenvari);
    }
  }

}
