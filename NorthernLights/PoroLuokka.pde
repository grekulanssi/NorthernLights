/*TODO: peilaa osa poroista, pienennä niitä, laita petterin nenä vilkkumaan
//background colorin mukaan sijainnin asettaminen.

*/
import java.awt.event.*;


public class Poro implements Sisalto {
  
  final int RUUDUN_KORKEUS = 450;
  
  int x;
  int y; 
  boolean petteri = false;
  int peiliY = 1;
  boolean kasvatus = false;
  float[] ylarajat;
  
Poro(int ylaraja, int leveys) {
  if(random(10) < 1) {
    petteri = true;
  }
  
  x = int(random(leveys));
  if(ylarajat != null) {
    y = annaY(int(ylarajat[x]));
  }
  else {
    y = annaY(ylaraja);
  }
}

void setup() {
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
    float t = millis() / 1000.0;
    rotate(t);
    kasvataSarvet();
  }
  
  if(!kasvatus && mousePressed && abs(pmouseX) < x+10 && abs(mouseY) < y+5) {
    kasvatus = true;
  }
  
  popMatrix();
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
    fill(220,20,20);
    stroke(220,20,20);
    ellipse(-5,0,3,3);
  }
  else {
    stroke(100,70,26);
    fill(100,70,26);
    ellipse(-5,0,2,2);
  }
  
  //silma
  stroke(100);
  fill(0);
  ellipse(1,-1,1,1);
  
  return;
}

void kasvataSarvet() {
  petteri = true;
  
}

void asetaYlarajat(float[] rajat) {
  if(ylarajat == null) {
    ylarajat = rajat;
  }
}

}
