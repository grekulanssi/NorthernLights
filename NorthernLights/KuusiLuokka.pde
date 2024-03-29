/**

KuusiLuokka - osa NorthernLights -harkkaa.

Artti Kaipainen 2011

*/
  public class KuusiLuokka implements Sisalto {
  
  ArrayList kuuset;
  ArrayList kannat;
  ArrayList sijainnitX;
  ArrayList sijainnitY;
  ArrayList koot;
  boolean ensimmainenKerta;
  color kantojenVari = color(92,36,6); // Asetetaan kuusien kannoille ruskea väri
  color latvojenVari = color(23,84,25); // Latvoille puolestaan vihreä
  
    void setup() {}
  
    void draw() {}
    
    KuusiLuokka() {
      ensimmainenKerta = true;
      kuuset = new ArrayList(); // Artin lisäämä
      sijainnitX = new ArrayList<Float>();
      sijainnitY = new ArrayList<Float>();
      koot = new ArrayList<Float>();
    }
    
    void luoKuusi(float sijaintiX, float sijaintiY) {
      
     noStroke();
    
     float koko;
   
     if(sijaintiY > 447) {
       sijaintiY=550;
     }
     
     float kerroin = random(0.05,0.95);
     
     sijaintiY += (450-sijaintiY)*kerroin;
   
     float minkaKokoinen = random(0,100);
   
      if(minkaKokoinen <= 33) {
         koko = 7;
       } else if(minkaKokoinen <= 66) {
         koko = 9;
       } else {
         koko = 10;
       }

     fill(kantojenVari);
     rect(sijaintiX,sijaintiY,koko,koko/2);   
     
     fill(latvojenVari);
     triangle(sijaintiX-koko,sijaintiY,sijaintiX+(koko*2),sijaintiY,sijaintiX+(koko/2),sijaintiY-(koko+(koko/2)));
     
     triangle(sijaintiX-(koko/2),sijaintiY-(koko/(9/5)),sijaintiX+(koko/2)+koko,sijaintiY-(koko/(9/5)),sijaintiX+(koko/2),sijaintiY-(koko*2));
     
     sijainnitX.add(sijaintiX);
     sijainnitY.add(sijaintiY);
     koot.add(koko);   

    }
    
    void luoKuusikko() {
      
      for(int k = kuuset.size()-1; k>=0; k--) {
       
       float tehdaankoKuusi = random(0,100);
      
        if(tehdaankoKuusi <= 1.7) {
         luoKuusi((float)k,(Float)kuuset.get(k));
        } 
      }
      
      ensimmainenKerta = false;
      
    }      
    
    void lisaaListaan(float lisays) {
      if(kuuset.size() < 800) {
        kuuset.add(lisays);
      }
    }
  
    void piirraSamatKuuset() {
      
      for(int a = koot.size()-1; a>=0; a--) {
             
        fill(kantojenVari);
        rect((Float)sijainnitX.get(a),(Float)sijainnitY.get(a),(Float)koot.get(a),(Float)koot.get(a)/2);
        fill(latvojenVari);
        triangle((Float)sijainnitX.get(a)-(Float)koot.get(a),(Float)sijainnitY.get(a),(Float)sijainnitX.get(a)+(Float)((Float)koot.get(a)*2),(Float)sijainnitY.get(a),(Float)sijainnitX.get(a)+((Float)koot.get(a)/2),(Float)sijainnitY.get(a)-((Float)koot.get(a)+((Float)koot.get(a)/2)));
        
        triangle((Float)sijainnitX.get(a)-((Float)koot.get(a)/2),(Float)sijainnitY.get(a)-((Float)koot.get(a)/(9/5)),(Float)sijainnitX.get(a)+((Float)koot.get(a)/2)+(Float)koot.get(a),(Float)sijainnitY.get(a)-((Float)koot.get(a)/(9/5)),(Float)sijainnitX.get(a)+((Float)koot.get(a)/2),(Float)sijainnitY.get(a)-((Float)koot.get(a)*2));
        
      }    
    }
    
  }
