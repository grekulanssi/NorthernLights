
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
  
  float theta = 0.0;
  float[] amplitude = new float[maxwaves];   // Height of wave
  float[] dx = new float[maxwaves];
  float[] yvalues;          // Using an array to store height values for the wave (not entirely necessary)
  
  
  void setup() {
    
    revontulenleveys = (int)random(500,700);
    aloitusX = (int)random(-100,250);
    vinouskerroin = random(-0.2, 0.2);
    aloitusY = (int)-(vinouskerroin*400);
    xspacing = (int)random(2,4.8);
    
    for (int i = 0; i < maxwaves; i++) {
      amplitude[i] = random(3,10);
      float period = random(400,900); // How many pixels before the wave repeats
      dx[i] = (TWO_PI / period) * xspacing;
    }
  
    
    yvalues = new float[revontulenleveys];
  }
  
  
  void draw() {
     
    calcWave();
    renderWave();
    

    
  }
  
  
  void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ){
    // calculate differences between color components 
    float deltaR = red(c2)-red(c1);
    float deltaG = green(c2)-green(c1);
    float deltaB = blue(c2)-blue(c1);
  
    /*nested for loops set pixels
     in a basic table structure */
    // column
    for (int i=x; i<=(x+w); i++){
      // row
      for (int j = y; j<=(y+h); j++){
        
        color c = color(
        (red(c1)+(j-y)*(deltaR/h)),
        (green(c1)+(j-y)*(deltaG/h)),
        (blue(c1)+(j-y)*(deltaB/h))
          );
       set(i, j, c);
       //fill(c);
       //point(i,j);
      }  
    }  
    
  }
  
  
  
  void calcWave() {
    // Increment theta (try different values for 'angular velocity' here
    theta += 0.02;
  
    // Set all height values to zero
    for (int i = 0; i < yvalues.length; i++) {
      yvalues[i] = 0;
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
      
      color tulenvari;
      
      /* Revontulen reunat feidaa */
      if (x <= feidiSivusta) {
        float valmius = 1-(float)x/feidiSivusta;
        //println(valmius);
        tulenvari = color(47-42*(valmius), 181+ero-(181+ero-5)*(valmius), 50*(valmius)); //tulenvarireuna vaihtelee
      }
      else if (x >= revontulenleveys-feidiSivusta) {
        float valmius = (float)(x-revontulenleveys+feidiSivusta)/feidiSivusta;
        //println(valmius);
        tulenvari = color(47-42*(valmius), 181+ero-(181+ero-5)*(valmius), 50*(valmius)); //tulenvarireuna vaihtelee
      }
      /* Keskikohta on tasainen */
      else {
        tulenvari = color(47, 181+(ero), 0); //tulenvarireuna vaihtelee
      }
      
      color tausta = color(5, 5,50); //yläreuna
      
      setGradient(aloitusX+x, aloitusY+(int)(yvalues[x]+vinouskerroin*x),
                 1, 150, tausta, tulenvari, Y_AXIS);
    }
  }

}
