
class Hai{
    int id;
    PImage img;
    
    Hai(int id, int x, int y){
      this.id = id;
      this.img = imgHai.get(x * HAI_WIDTH, y * HAI_HEIGHT, HAI_WIDTH, HAI_HEIGHT);
    }
    
    int getId(){
      return id;
    }
  }