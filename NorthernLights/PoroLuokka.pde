/*
Porot tehny Anssi. Kumma ko alle 3px halkaisijan ellipse ei enää piirry mihinkään :(
*/

public class Poro implements Sisalto {
  
  final int RUUDUN_KORKEUS = 450;
  
  int x;
  int y; 
  boolean petteri = false;
  int peiliY = 1;
  boolean kasvatus = false;
  float[] ylarajat;
  float klikkaushetki = 0;
  
Poro(float[] ylarajataulukko, int leveys) {
  if(random(10) < 0.5) {
    petteri = true;
  }
  
  ylarajat = ylarajataulukko;
  
  x = int(random(leveys));
  if(ylarajat == null) {
    y = int(random(400,434));
  }
}

void setup() {
  if(ylarajat != null) {
    y = annaY(int(ylarajat[x]));
  }
  
}

void draw() {
  piirraPoro();
}  

int annaY(int maksimi) {
  return int(random(maksimi, RUUDUN_KORKEUS-16));
}

void piirraPoro() {
  
  pushMatrix();
  translate(x,y);
  stroke(100);
  fill(200);
  strokeWeight(1);
  
  jalat();
  ruumis();
  paa();
  
  if(kasvatus) {
    kasvataSarvet();
  }
  
  popMatrix();
  
  if(!revontulenpiirtoMenossa) {
    if(!kasvatus && mousePressed && abs(pmouseX-x) < 10 && abs(mouseY-y) < 5) {
      kasvatus = true;
      klikkaushetki = millis();
    }
  }
}

void jalat() {
  line(2,5,2,15);
  line(4,5,4,15);
  line(15,5,15,15);
  line(17,5,17,15);
  return;
}


void ruumis() {
  ellipseMode(CORNER);
  ellipse(0,0,peiliY*18,8);
  //hanta
  fill(100);
  ellipse(16,0,4,4);
  fill(200);
}

void paa() {
  
  //sarvet
  line(0,0,-5,-5);
  line(0,0,+6,-6);
  
  /*
  if(kasvatus) {
    kasvata(); 
  }
  */
  
  //paa
  pushMatrix();
    rotate(-PI/6);
    strokeWeight(1);
    ellipseMode(CENTER);
    ellipse(0,0,10,5);
  popMatrix();
  
  strokeWeight(1);
  //nena
  if(petteri) {
    float m = millis();
    fill(m%220,20,20);
    stroke(m%220,20,20);
    ellipse(-5,1,4,4);
  }
  else {
    stroke(100,70,26);
    fill(100,70,26);
    ellipse(-5,1,4,4);
  }
  
  /*silma
  stroke(0);
  fill(0);
  ellipse(1,-1,4,4);
  */
  return;
}

void asetaYlarajataulukko(float[] rajat) {
  ylarajat = rajat;
}

void kasvataSarvet() {
  petteri = true;
  
}

/*Sarvien kasvatusmetodi jota kutsutaan joka draw:lla
Miten saan sen kutsumaan tätä vain esim. 4 kertaa sekunnissa?
Jätetään hyväksi jatkokehitysideaksi.
void kasvata() {
  int aikaaKulunut = int(millis() - klikkaushetki);
    for(int piirto = 0; piirto < aikaaKulunut; piirto++) {
      line(0,0,-piirto/100,-piirto/100);
      line(0,0,piirto/100+2,-piirto/100);
      if(aikaaKulunut > 1000) {
        line(-5,-5,-piirto/80,-piirto/80);
      }
    }
}
*/

}
