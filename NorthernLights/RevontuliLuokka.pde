

class Revontulet implements Sisalto {
  
  // constants
  int Y_AXIS = 1;
  int X_AXIS = 2;
  
  //revontulikertoimia
  int revontulenleveys = 500;
  int xspacing = 4;   // How far apart should each horizontal location be spaced
  int maxwaves = 4;   // total # of waves to add together
  int vaakaGradient = 100;
  
  float theta = 0.0;
  float[] amplitude = new float[maxwaves];   // Height of wave
  float[] dx = new float[maxwaves];
  float[] yvalues;          // Using an array to store height values for the wave (not entirely necessary)
  
  void setup() {
    size(800, 600);
    background(color(0,0,0)); 
  
  
    for (int i = 0; i < maxwaves; i++) {
      amplitude[i] = random(3,10);
      float period = random(400,900); // How many pixels before the wave repeats
      dx[i] = (TWO_PI / period) * xspacing;
    }
  
    
    yvalues = new float[revontulenleveys];
  }
  
  
  void draw() {
    
    background(color(0,0,0));  
  
    
    //Maa
    fill(127,127,127);
    rect(0,300,800,300);
    
    calcWave();
    renderWave();
    
    fill(255,255,255, 100);
    rect(250,40,5,5);
    rect(150,80,5,5);
    rect(50,10,5,5);
    rect(200,100,5,5);
  }
  
  
  void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ){
    // calculate differences between color components 
    float deltaR = red(c2)-red(c1);
    float deltaG = green(c2)-green(c1);
    float deltaB = blue(c2)-blue(c1);
  
    // choose axis
    if(axis == Y_AXIS){
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
  
        }
      }  
    }  
    else if(axis == X_AXIS){
      // column 
      for (int i=y; i<=(y+h); i++){
        // row
        for (int j = x; j<=(x+w); j++){
          color c = color(
          (red(c1)+(j-x)*(deltaR/h)),
          (green(c1)+(j-x)*(deltaG/h)),
          (blue(c1)+(j-x)*(deltaB/h))
            );
          int thisColour = color(c, 10);
          set(j, i, thisColour);
        }
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
      color ala = color(47, 181+(ero), 0);
      color yla = color(0, 0,0);
      setGradient(x+200, (int)yvalues[x], 1, 150, yla, ala, Y_AXIS);
    }
  }

}
