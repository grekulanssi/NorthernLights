class Lapintausta implements Sisalto{
  float py2,py, py3;
  float kulma,kulma2,kulma3;
   int ykorkeus = int(random(400,450));
  void setup(){
    background(5,5,50);
    smooth();
    noLoop();
  }
  void draw(){
    kuu();
    vuoret1();
    vuoret2();
  }
  void kuu(){
    ellipseMode(CENTER);
    fill(190,175,120);
    //fill(255,236,139);
    noStroke();
    float x  = random(50,750);
    float y = random(50,300);
    ellipse(x,y,50,50);
  }
  void vuoret1(){
    //taaemmaisen vuorijonon piirtäminen
    stroke(210,200,200);
    kulma = 0;
    float luku = random(1,3.2);
    for(int i = 0; i<width; i++){
    py = 400 + (sin(kulma) + sin(luku*kulma)) * 25;
    if(py<450){
      line(i,py,i,450);
    }
    kulma += PI/200;
    }
  }
  void vuoret2(){
        //etummainen vuorijono
    stroke(255);
    kulma3 = 0;
    kulma2 = 0;
    float luku2 = random(0.80,1.5);
    for(int j = 0; j<width; j++){
    py2 = 400 + (sin(luku2*kulma3)+sin(kulma3))*20;
    py3 = 400 + (sin(luku2*kulma2))*20;
    if(((py2+py3)/2)<450){
    line(j,(py2+py3)/2,j,450);
    }
    kulma3 += PI/200;
    kulma2 += PI/200;
    }
  }
}
