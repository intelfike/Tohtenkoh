  import java.util.Arrays; 
  import java.util.Comparator;
  import java.util.Collections;

  private PImage imgHai;
  
  //Layout
  private static final int HAI_WIDTH = 48;
  private static final int HAI_HEIGHT = 72;
  private static final int HAI_NUM_MAX = (9+9+3+7)*4;
  
  private static final int KAWA_X = 480;
  private static final int KAWA_Y = 576;
  private static final int TEHAI_X = 240;
  private static final int TEHAI_Y = 862;
    
  ArrayList<Hai> defaultYama = new ArrayList<Hai>();
  ArrayList<Hai> shuffled = new ArrayList<Hai>();
  
  //Player
  private Player Me = new Player("Me");
  private Player Com1 = new Player("Com1");
  private Player Com2 = new Player("Com2");
  
  Player Players[] = {Me, Com1, Com2};
  private int nowPlayer = 0;

  private int clickHai = -1;
  private int nowHaiNum = 0;
  

  //準備
  void setup(){
    //画像の準備
    imgHai = loadImage("../img/hai.png");
    //基本山作成 今後はコピーしてシャッフルして使用
    this.defaultYama = createYama();
    
    size(1280,960);
    background(255);
    game();
  }
  
  void draw(){
  }
  
  //ゲームの流れ
  void game(){
   
    shuffledYama();
    setTehai();
    Tsumo(Players[nowPlayer % 3]);
  }
  
  //山を混ぜる
   void shuffledYama(){
    shuffled = new ArrayList<Hai>(defaultYama); 
    Collections.shuffle(shuffled);
    nowHaiNum = 0;
    
    debagImg(this.defaultYama, 0, 0);
    debagImg(this.shuffled, 13 * HAI_WIDTH, 0);
    
    System.out.printf("====shuffledYamaFinish====\n");
  }
  
  //山生成
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
  
  //配牌
  void setTehai(){
    for(int i = 0; i < 13; i++){
      Me.Tehai.add(shuffled.get(i));
      Com1.Tehai.add(shuffled.get(i+13));
      Com2.Tehai.add(shuffled.get(i+26));
      nowHaiNum += 3;
    }
    sortTehai(Me);
    drawTehai(Me);
    System.out.printf("====HaipaiFinish====\n");
  }
  
  //TODO sortTehaiはPlayerの中に入れる
  //TODO Players[nowPlayer % 3].sortTehai(); こっち採用したい
  //手配のソート
  void sortTehai(Player player){
    ArrayList tehai = player.Tehai;
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
        }
      }
     sorted.add(target.get(min_num));
     target.remove(min_num);
    }
    System.out.println("====sortTehaiFinish====");
    
    for(Hai hai: sorted){
      System.out.printf("%d,",hai.id);
    }
    System.out.println();
    player.Tehai = sorted;
  }
  
  //ツモして表示
  void Tsumo(Player player){
    clickHai = -1;
    
    //手牌分
    //TODO 回数
    player.Tehai.add(shuffled.get(nowHaiNum)); //<>//
    drawTsumo(player);
    System.out.printf("ツモ"+shuffled.get(nowHaiNum).id);
    System.out.printf("\n====TsumoFinish====\n");
  }
  
  //クリックで牌を捨てる
  void mousePressed(){
    System.out.println("クリックされた");
    Sute();
  }

  void Sute(){
    int x = mouseX;
    int y = mouseY;
    
    if(TEHAI_X <= x && x <= TEHAI_X + Players[nowPlayer % 3].Tehai.size() * HAI_WIDTH){
      if(TEHAI_Y <= y && y <= TEHAI_Y + HAI_HEIGHT){
        clickHai = (x - TEHAI_X) / HAI_WIDTH;
        System.out.println(clickHai);
        
        
        
        Players[nowPlayer % 3].Tehai.remove(clickHai);
        sortTehai(Players[nowPlayer % 3]);
        drawTehai(Players[nowPlayer % 3]);
        nowHaiNum += 1;
        //TODO上がり処理
        
        //次の人
        //nowPlayer ++; 
        Tsumo(Players[nowPlayer % 3]);
      }
    }
  }

  

  
 
  