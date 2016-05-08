
  class Layout{
    void changeShimoHai(){
      pushMatrix();
        translate(width/2, height/2);
        rotate((PI / 2) * 3);
    }
    
  
    void chageToiHai(float x, float y){
      pushMatrix();
        translate(width/2, height/2);
        rotate((PI / 2) * 2);    
    }
  
    void chageKamiHai(float x, float y){
      pushMatrix();
        translate(width/2, height/2);
        rotate((PI / 2) * 1);
     }
    
    void Reset(){
      popMatrix();
    }
  }