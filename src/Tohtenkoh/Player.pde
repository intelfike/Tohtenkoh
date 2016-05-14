  
  class Player{
    ArrayList<Hai> Tehai = new ArrayList<Hai>();
    ArrayList<Hai> Kawa = new ArrayList<Hai>();
    ArrayList<Hai> Naki = new ArrayList<Hai>();
        
    int point;
    String name;
    String state;
    //自動制御の有無
    boolean auto;
    
    Player(String name, boolean auto){
      this.name = name;
      this.auto = auto;
    }
    
      //ツモして表示
    void Tsumo(){
      clickHai = -1;
      
      //手牌分
      //TODO 回数
      Tehai.add(shuffled.get(nowHaiNum));
      drawTsumo(Tehai);
      System.out.printf("ツモ"+shuffled.get(nowHaiNum).id);
      System.out.printf("\n====TsumoFinish====\n");
    }
    //手配のソート
    void sortTehai(){
      ArrayList<Hai> target = new ArrayList<Hai>(Tehai);
      ArrayList<Hai> sorted = new ArrayList<Hai>();
      
      for(int i = 0; i < Tehai.size(); i++){
        float min = 999;
        int min_num = 0;
        
        for(int j = 0; j < Tehai.size() - i; j++){
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
      Tehai = sorted;
    }
  }