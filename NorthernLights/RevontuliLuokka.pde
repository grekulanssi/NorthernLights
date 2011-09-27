
/**

Revontuliluokka

Käytetty apuna Processingin Gradient ja AddictiveWave exampleja.

*/

class Revontulet implements Sisalto {
  
  // constants
  int Y_AXIS = 1;
  int X_AXIS = 2;
  
  //revontulikertoimia
  int revontulenleveys;
  int aloitusX;
  int aloitusY;
  int xspacing;   // How far apart should each horizontal location be spaced
  int maxwaves = 3;   // total # of waves to add together
  int vaakaGradient = 100;
  float vinouskerroin;
  boolean klikattu;
  float revontuliaika;
  
  float theta = 0.0;
  float[] amplitude = new float[maxwaves];   // Height of wave
  float[] dx = new float[maxwaves];
  float[] yvalues;          // Using an array to store height values for the wave (not entirely necessary)
  float[] ymouses;
  
  //varijuttuja
  float arpa = random(0,3.4);
  color tulenvari;
  
  void setup() {
    
    revontulenleveys = (int)random(500,700);
    //aloitusX = (int)random(-100,250);
    vinouskerroin = random(-0.2, 0.2);
    //aloitusY = (int)-(vinouskerroin*400);
    xspacing = (int)random(2,4.8);
    klikattu = false;
    
    
    for (int i = 0; i < maxwaves; i++) {
      amplitude[i] = random(3,10);
      float period = random(400,900); // How many pixels before the wave repeats
      dx[i] = (TWO_PI / period) * xspacing;
    }
  
    
    yvalues = new float[revontulenleveys];
    ymouses = new float[revontulenleveys];
    
    // Set all height values to zero
    for (int i = 0; i < ymouses.length; i++) {
      ymouses[i] = 0;
    }
  }
  
  
  void draw() {
    
    if (mousePressed && klikattu == false) {
       klikattu = true; 
       revontuliaika = millis();
       aloitusX = mouseX;
       aloitusY = mouseY-150;
    }
    
    
    if (klikattu == true) {
      calcWave();
      renderWave();      
    }
     
    
    
    //println("X: " + mouseX + ", Y: " + mouseY);

    
  }
  
  
  void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ){

   
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
  
  void renderWave() {

    //Piirretään liukuväripystypalkkeja vierekkäin
    for (int x = 0; x < yvalues.length; x++) {
  
      noStroke();   
      int luku = x % vaakaGradient;
      int ero = Math.abs(vaakaGradient/2-luku);
      int feidiSivusta = 200;
     if(int(arpa) == 0){
       tulenvari = color(0, 181+(ero), 0, 255);
       println(0);
     } 
     if(int(arpa) == 1){
       tulenvari = color(181+(ero), 0, 0, 255);
       println(1);
     } 
     if(int(arpa) == 2){
       tulenvari = color(181+(ero),255,0,255);
       println(2);
     } 
     if(int(arpa) == 3){
       tulenvari = color(181+(ero),0,106,255);
       println(3);
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
                 1, 150, tausta, tulenvari, Y_AXIS);
    }
  }

}
