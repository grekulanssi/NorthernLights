/*TODO: peilaa osa poroista, pienennä niitä, laita petterin nenä vilkkumaan
//background colorin mukaan sijainnin asettaminen.

*/

void setup() {
  size(800,450);
  background(250);
  smooth();
  for(int i = 0; i < 10; i++) {
    Poro poro = new Poro(250,800);
  }
}


public class Poro implements Sisalto {
  
  final int RUUDUN_KORKEUS = 450;
  
  int x;
  int y;
  boolean petteri;

Poro(int ylaraja, int leveys) {
  if(random(10) < 1) {
    petteri = true;
  }
  else {
    petteri = false;
  }
  
  println("Petteri: " + petteri);

  
  y = annaY(ylaraja);
  x = int(random(leveys));
  piirraPoro();
}

int annaY(int maksimi) {
  return int(random(maksimi, RUUDUN_KORKEUS));
}

void piirraPoro() {
  stroke(100);
  strokeWeight(2);
  fill(200);
  jalat();
  ruumis();
  paa();
}

void ruumis() {
  strokeWeight(1);
  ellipseMode(CORNER);
  ellipse(x,y,20,10);
}

void paa() {
  strokeWeight(2);
  
  //sarvet
  line(x,y,x-5,y-5);
  line(x,y,x+5,y-5);
  
  //paa
  strokeWeight(1);
  ellipseMode(CENTER);
  ellipse(x,y,10,5);
  
  strokeWeight(1);
  //nena
  if(petteri) {
    fill(220,20,20);
  }
  else {
    stroke(112,70,26);
    fill(112,70,26);
  }
  ellipse(x-5,y,2,2);
  
  //silma
  stroke(100);
  fill(0);
  ellipse(x,y-1,2,2);
  
  return;
}

void jalat() {
  strokeWeight(2);
  line(x+2,y+5,x,y+15);
  line(x+2,y+5,x+4,y+15);
  line(x+20,y+5,x+18,y+15);
  line(x+20,y+5,x+22,y+15);
  return;
}


}
