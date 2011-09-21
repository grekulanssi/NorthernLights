
ArrayList<Sisalto> sisallot = new ArrayList<Sisalto>();

void setup() {
  
  size(800, 450);
  background(color(0,0,0)); 
  smooth();
  
  sisallot.add(new Lapintausta());
  
  sisallot.add(new Revontulet());
  for(int i = 0; i < 10; i++) {
  	sisallot.add(new Poro(250,800));
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
