public class KuusiLuokka implements Sisalto{

ArrayList kuuset;

  void setup() {}

  void draw() {}
  
  void luoKuusi(float sijaintiX, float sijaintiY) {
  
   noStroke();
  
   int koko;
 
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
 
   fill(200,100,50);
   rect(sijaintiX,sijaintiY,koko,koko/2);
 
   fill(0,180,0);
   triangle(sijaintiX-koko,sijaintiY,sijaintiX+(koko*2),sijaintiY,sijaintiX+(koko/2),sijaintiY-(koko+(koko/2)));
   triangle(sijaintiX-(koko/2),sijaintiY-(koko/(9/5)),sijaintiX+(koko/2)+koko,sijaintiY-(koko/(9/5)),sijaintiX+(koko/2),sijaintiY-(koko*2));
 
   float tehdaankoKolmas = random(0,100);
 
   if(tehdaankoKolmas <= 50) {
     fill(0,180,0);
     triangle(sijaintiX-(koko*0.3),sijaintiY-(koko*1.6),sijaintiX+(koko*1.3),sijaintiY-(koko*1.6),sijaintiX+(koko/2),sijaintiY-(koko*(2.6)));
   }
 
  }
  
  void luoKuusikko() {
    
    for(int k = kuuset.size()-1; k>=0; k--) {
     
     float tehdaankoKuusi = random(0,100);
    
      if(tehdaankoKuusi <= 2) {
       luoKuusi((float)k,(Float)kuuset.get(k));
      } 
    }
    
  }
  
  void lisaaListaan(float lisays) {
    
    kuuset.add(lisays);
  }

}
