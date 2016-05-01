  import java.util.Arrays; 
  import java.util.Comparator;
  import java.util.Collections;
    
  private static final int HAI_WIDTH = 48;
  private static final int HAI_HEIGHT = 72;
  private static final int HAI_NUM_MAX = (9+9+3+7)*4;
  
  ArrayList<Hai> defaultYama = new ArrayList<Hai>();
  ArrayList<Hai> shuffled = new ArrayList<Hai>();
  
  //Hai image
  PImage imgHai;
  
  //Layout
  int Kawa_x = 480;
  int Kawa_y = 576;
  int Tehai_x = 240;
  int Tehai_y = 862; 
  
  void setup(){
    imgHai = loadImage("../img/hai.png");
    
    size(1280,960);
    background(255);
    createYama();
    initYama();
    /*
    rect(Kawa_x, Kawa_y,
        HAI_WIDTH * 6, HAI_HEIGHT * 3);
    rect(Tehai_x, Tehai_y,
        HAI_WIDTH * 15, HAI_HEIGHT * 1);
    */
    game();
  }
  
  void game(){
    Player Me = new Player();
    Player You = new Player();
    
    for(int i = 0; i < 13; i++){
      Me.Tehai.add(shuffled.get(i));
    }
    Me.Tehai = sortTehai(Me.Tehai);
    drawTehai(Me);
  }
  
  ArrayList sortTehai(ArrayList tehai){
    ArrayList<Hai> target = new ArrayList<Hai>(tehai);
    ArrayList<Hai> sorted = new ArrayList<Hai>();
    
    for(int i = 0; i < tehai.size(); i++){
      float min = 999;
      int min_num = 0;
      
      for(int j = 0; j < tehai.size() - i; j++){
        Hai hai = target.get(j);
        int id = hai.getId();

        if(id < min){
          min = id;
          min_num = j;
          System.out.println(id);
        }
      }
     
     System.out.println("---" + i + "---");
     sorted.add(target.get(min_num));
     target.remove(min_num);
    }
    System.out.println("====sortTehaiFinish====");
    
    for(Hai hai: sorted){
      System.out.printf("%d,",hai.id);
    }
    
    return sorted;
  }
  
  void drawTehai(Player player){
    //player = Me;
    for(int i = 0;  i < player.Tehai.size(); i++){
      drawHai(player.Tehai.get(i), (i * HAI_WIDTH) + Tehai_x, Tehai_y);
    } 
  }
  
  void drawHai(Hai hai, float x, float y){
    image(hai.img, x, y );
  } 
  
  void draw(){
    
  }
  
  class Player{
    ArrayList<Hai> Tehai = new ArrayList<Hai>();
    ArrayList<Hai> Kawa = new ArrayList<Hai>();
    ArrayList<Hai> Naki = new ArrayList<Hai>();
    
    int point;
    String name;
    String state;
    
    Player(){
    }
  }
  
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
  
  void initYama(){
    this.defaultYama = createYama();
    //debagImg(this.defaultYama, 0, 0);
    
    shuffled = new ArrayList<Hai>(defaultYama); 
    Collections.shuffle(shuffled);
    //this.shuffled = shuffleYama(this.defaultYama);
    
    //debagImg(this.shuffled, 13 * HAI_WIDTH, 0);
  }
  
  ArrayList<Hai> createYama(){
    int id = 0;
    ArrayList<Hai> Yama = new ArrayList<Hai>();
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
    
    return Yama;
  }
  /*
  ArrayList<Hai> shuffleYama(ArrayList<Hai> Yama){
    ArrayList<Hai> targetYama = new ArrayList(Yama);
    Collections.shuffle(targetYama);
    
    /*
    for(int i = HAI_NUM_MAX; i > 0; --i) {  
      int rnd = (int)random(i);
      shuffledYama.add(targetYama.get(rnd));
      targetYama.remove(rnd);
    }
    
    System.out.printf("====shuffleYamaFinish====\n");
    return targetYama;
  }
  */
  
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
  