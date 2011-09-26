  class Lapintausta implements Sisalto{
  
  
    int ykorkeus = int(random(400,450));
    
    //Tiina
    ArrayList<Float> tahtienX = new ArrayList<Float>(); //tahtien x-koordinaatit
    ArrayList<Float> tahtienY = new ArrayList<Float>(); //tahtien y-koordinaatit
    
    //Tomi tästä eteenpäin
    float kuunX = 0, kuunY = 0; //Kuun sijaintikoordinaatit
    
    void setup(){
      
      background(3,3,30);
      int ykorkeus = int(random(400,450));
     
    }
    
    
    void draw(){
        background(5,5,50); //piirretään tausta uudestaan
        teeTahdet();
        teeKuu();
        //teeTakavuoret();
        //teeEtuvuoret();
    }
        /* Piirretään kuu */
    void teeKuu(){
      //Ensimmäisellä kerralla määritetään kuun sijainti
      if(kuunX == 0) {      
        kuunX  = random(50,750);
        kuunY = random(50,300);      
      }
      //Piirretään kuu
      ellipseMode(CENTER);
      fill(190,175,120);
      //fill(255,236,139);
      noStroke();
      ellipse(kuunX,kuunY,50,50);
    }
    
    void teeTahdet(){
     if(tahtienX.size() == 0){
      for(int i = 0; i<50; i++){
        float x = random(0,800);
        tahtienX.add(x);
      }
    }
    if(tahtienY.size()==0){
      for(int j = 0; j<50; j++){
    float y = random(0,400);
    tahtienY.add(y);
      }
    }

    for(int k = 0; k<tahtienX.size(); k++){
      float z = random(1.9, 2.6);
      fill(255);
      noStroke();
      rect(tahtienX.get(k),tahtienY.get(k),z,z);
    }
    }
    
  }
