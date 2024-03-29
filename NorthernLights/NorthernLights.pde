
//Lista joka sisältää sisältöelementit
ArrayList<Sisalto> sisallot = new ArrayList<Sisalto>();
boolean revontulenpiirtoMenossa = false;

void setup() {
  
  size(800, 450, P2D); //P2D nopeuttaa -Tomi
  frameRate(30);
  background(color(0,0,0)); 
  smooth();
  
  VuoriLuokka vuoristo;
  
  //Lisätään sisällöt
  sisallot.add(new Lapintausta());  
  //sisallot.add(new KuusiLuokka());  
  sisallot.add(new Revontulet());
  sisallot.add(new VuoriLuokka());
  
  //Suoritetaan sisältöjen setupit
  for (int i=0; i<sisallot.size(); i++) {
     sisallot.get(i).setup(); 
  }  
}

//Suoritetaan sisältöjen draw()-metodit
void draw() {  
  for (int i=0; i<sisallot.size(); i++) {
    //jostain syystä piirtää kuuset ennen poroja vaikka porot lisätään sisältöihin ennen kuusia. (vuoriluokassa)
     sisallot.get(i).draw(); 
  }
  
  
}

//Rajapinta sisällölle
interface Sisalto {
 
  void setup();
  
  void draw();
  
}
