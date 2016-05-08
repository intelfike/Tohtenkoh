  void debagImg(ArrayList<Hai> yama, int x, int y){
    for(int i = 0; i < 12; i++){
      for(int j = 0; j < 10; j++){
        if(i+j*12 >= HAI_NUM_MAX){
          break;
        }
        drawHai(yama.get(i+j*12), (i * HAI_WIDTH) + x, (j * HAI_HEIGHT) + y);    
      }
    }
  }