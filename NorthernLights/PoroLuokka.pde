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
  float klikkaushetki;
  
Poro(float[] ylarajataulukko, int leveys) {
  if(random(10) < 1) {
    petteri = true;
  }
  
  ylarajat = ylarajataulukko;
  
  x = int(random(leveys));
  if(ylarajat != null) {
    println("jepajepajepa");
    y = annaY(int(ylarajat[x]));
  }
  else {
    y = int(random(400,450));
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
    kasvataSarvet();
  }
  
  popMatrix();
  if(!kasvatus && mousePressed && abs(pmouseX-x) < 10 && abs(mouseY-y) < 5) {
    println("meni, mousex: " + abs(pmouseX) + ", x: " + x);
    println("meni, mousey: " + abs(pmouseY) + ", y: " + y);
    kasvatus = true;
    klikkaushetki = millis();
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
    ellipse(-5,0,5,5);
  }
  else {
    stroke(100,70,26);
    fill(100,70,26);
    ellipse(-5,0,5,5);
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

}
