
  //TODO Players[nowPlayer % 3].drawTehai(); こっち採用したい
  void drawTehai(ArrayList<Hai> Tehai){
    for(int i = 0;  i < Tehai.size(); i++){
      //drawHai(player.TehaTEHAI_X), (i * HAI_WIDTH) + Tehai_x, Tehai_y);
      drawHai(Tehai.get(i), (i * HAI_WIDTH) + TEHAI_X, TEHAI_Y);
    } 
  }
  
  //TODO getter絶対書く
  void drawTsumo(ArrayList<Hai> Tehai){
    drawHai(Tehai.get(Tehai.size()-1), ((Tehai.size() - 1) * HAI_WIDTH) + TEHAI_X, TEHAI_Y);
  }
  
  
  void drawHai(Hai hai, float x, float y){
    image(hai.img, x, y );
  } 
  
  
   void drawKawa(ArrayList<Hai> Kawa){
    int j = 0;
    for(int i = 0;  i < Kawa.size(); i++){
      drawHai(Kawa.get(i), ((i % 6) * HAI_WIDTH) + KAWA_X, KAWA_Y + HAI_HEIGHT * j);
      if((i + 1) % 6 == 0){
        j++;
      }
      
    } 
  }