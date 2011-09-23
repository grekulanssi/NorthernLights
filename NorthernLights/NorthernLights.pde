
ArrayList<Sisalto> sisallot = new ArrayList<Sisalto>();

void setup() {
  
  size(800, 450, P2D); //P2D nopeuttaa -Tomi
  frameRate(30);
  background(color(0,0,0)); 
  smooth();
  
  sisallot.add(new Lapintausta());  
  sisallot.add(new KuusiLuokka());  
  sisallot.add(new Revontulet());
  
  int poroja = int(random(5))+1;
  for(int i = 0; i < poroja; i++) {
  	sisallot.add(new Poro(400,800));
  }
  
  
  for (int i=0; i<sisallot.size(); i++) {
     sisallot.get(i).setup(); 
  }  
}

void draw() {  
  for (int i=0; i<sisallot.size(); i++) {
     sisallot.get(i).draw(); 
  }
  
  
}

interface Sisalto {
 
  void setup();
  
  void draw();
  
}
