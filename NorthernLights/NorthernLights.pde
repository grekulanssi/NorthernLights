
ArrayList<Sisalto> sisallot = new ArrayList<Sisalto>();

void setup() {
  sisallot.add(new Revontulet());
  
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
