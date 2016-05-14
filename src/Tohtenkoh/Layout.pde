
  class Layout{
    //changeHaiの引数
    final int SHIMO = 3;
    final int TOI = 2;
    final int KAMI = 1;
    
    void changeHai(int muki){
      pushMatrix();
      translate(width/2, height/2);
      rotate((PI / 2) * muki);
    }
    
    void Reset(){
      popMatrix();
    }
  }