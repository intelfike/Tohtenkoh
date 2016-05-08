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
  
  //ゲームの流れ
  void game(){
    shuffledYama();
    setTehai();
    Tsumo(Me);
  }
  
  //山を混ぜる
   void shuffledYama(){
    shuffled = new ArrayList<Hai>(defaultYama); 
    Collections.shuffle(shuffled);
    nowHaiNum = 0;
    //debagImg(this.shuffled, 13 * HAI_WIDTH, 0);
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
    Me.Tehai = sortTehai(Me.Tehai);
    drawTehai(Me);
    System.out.printf("====HaipaiFinish====\n");
  }
  
  //手配のソート
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
    return sorted;
  }
  
  //ツモして表示
  void Tsumo(Player player){
    clickHai = -1;
    
    //手牌分
    //TODO 回数

    player.Tehai.add(shuffled.get(nowHaiNum));
    drawTsumo(player);
    System.out.printf("====TsumoFinish====\n");
  }
  
  //クリックで牌を捨てる
  void mousePressed(){
    System.out.println("クリックされた");
    Sute();
  }

  void Sute(){
    int x = mouseX;
    int y = mouseY;
    
    if(TEHAI_X <= x && x <= TEHAI_X + Me.Tehai.size() * HAI_WIDTH){
      if(TEHAI_Y <= y && y <= TEHAI_Y + HAI_HEIGHT){
        clickHai = (x - TEHAI_X) / HAI_WIDTH;
        System.out.println(clickHai);
        
        //上がり処理
        
        
        //捨て処理
        //Sute(clickHai);
        
        //次の人
        //Tsumo(Me);
      }
    }
  }

  

  
 
  