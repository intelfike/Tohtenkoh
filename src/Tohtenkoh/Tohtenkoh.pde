private static final int HAI_WIDTH = 48;
private static final int HAI_HEIGHT = 72;
private static final int HAI_NUM_MAX = 100;

ArrayList<Hai> Yama = new ArrayList<Hai>();
PImage imgHai;

void setup(){
  imgHai = loadImage("../img/hai.png");
  size(1280,960);
  initYama();
}

void draw(){
  //background(255); 
}

class Hai{
    int id;
    PVector pos;
    PVector group;
    PImage img;
    
    Hai(int id, int x, int y){
      this.id = id;
      this.img = imgHai.get(x * HAI_WIDTH, y * HAI_HEIGHT, HAI_WIDTH, HAI_HEIGHT);
      group = new PVector(x, y);
    }
}

void initYama(){
  
  createYama();
  
  debagImg();
  
  ArrayList<Hai> shuffledYama = new ArrayList<Hai>();
  
  for(int i=(Yama.size()-1); i>0; --i) {  
    int rnd = (int)random(i+1);
    shuffledYama.add(Yama.get(rnd));
  }
}

void createYama(){

  int id = 0;
  
  for(int y = 0; y < 4; y++){
    for(int x = 0; x < 9; x++){
      for(int k = 0; k < 4; k++){
        Yama.add(new Hai(id, x, y));
        id++;
        System.out.printf(x+","+y+"\n" );        
      }
      if(y == 2){
         x += 3;  //1m 5m 9m stepup
      }
      if(y == 3){
         if(x >= 6){
           break;
         }
      }
    }
  }
  System.out.printf("====createYamaFinish====\n");
}

void drawHai(float x, float y, Hai hai){
  image(hai.img, x * HAI_WIDTH, y * HAI_HEIGHT);
}

void debagImg(){
  for(int i = 0; i < 14; i++){
    for(int j = 0; j < 8; j++){
      drawHai(i, j, Yama.get(i+j*14));
    }
  }
}