  
  void drawTehai(Player player){
    //player = Me;
    for(int i = 0;  i < player.Tehai.size(); i++){
      //drawHai(player.TehaTEHAI_X), (i * HAI_WIDTH) + Tehai_x, Tehai_y);
      drawHai(player.Tehai.get(i), (i * HAI_WIDTH) + TEHAI_X, TEHAI_Y);
    } 
  }
  
  //TODO getter絶対書く
  void drawTsumo(Player player){
    drawHai(player.Tehai.get(player.Tehai.size()-1), ((player.Tehai.size() + 1) * HAI_WIDTH) + TEHAI_X, TEHAI_Y);
  }
  
  
  void drawHai(Hai hai, float x, float y){
    image(hai.img, x, y );
  } 