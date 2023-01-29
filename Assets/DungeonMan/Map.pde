class Map
{
  int[] mapList;
  int[][] stageList = {
  //{
  //99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,
  //99,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,99,
  //99,0,99,99,99,0,99,99,99,0,99,0,99,0,99,99,99,0,99,99,99,0,99,
  //99,0,99,0,99,0,99,0,0,0,99,0,99,0,99,0,0,0,99,0,99,0,99,
  //99,0,99,0,99,0,99,99,99,0,99,0,99,0,99,99,99,0,99,99,99,0,99,
  //99,0,99,0,99,0,99,0,0,0,99,0,99,0,99,0,0,0,99,99,0,0,99,
  //99,0,99,0,99,0,99,99,99,0,0,99,0,0,99,99,99,0,99,0,99,0,99,
  //99,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,99,
  //99,0,99,99,99,0,99,99,99,0,99,99,99,0,99,99,99,0,0,99,0,0,99,
  //99,0,99,0,0,0,99,0,99,0,99,0,99,0,99,0,99,0,99,0,99,0,99,
  //99,0,99,0,99,0,99,0,99,0,99,0,99,2,99,0,99,0,99,99,99,0,99,
  //99,0,99,0,99,0,99,0,99,0,99,0,99,0,99,0,99,0,99,0,99,0,99,
  //99,0,99,99,99,0,99,99,99,0,99,0,99,0,99,0,99,0,99,0,99,0,99,
  //99,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,99,
  //99,0,99,99,99,0,99,99,99,0,99,0,99,0,99,99,99,0,99,99,99,99,99,
  //99,0,99,0,0,0,0,99,0,0,99,0,99,0,99,0,0,0,99,99,99,99,99,
  //99,0,99,0,99,0,0,99,0,0,99,0,99,0,99,99,99,0,99,99,1,0,99,
  //99,0,99,0,99,0,0,99,0,0,99,0,99,0,99,0,0,0,99,99,99,0,99,
  //99,0,99,99,99,0,99,99,99,0,0,99,0,0,99,99,99,0,99,99,99,0,99,
  //99,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,99,
  //99,0,99,0,99,0,99,99,99,0,99,0,99,0,99,0,99,0,99,99,99,0,99,
  //99,0,99,0,99,0,99,0,99,0,99,0,99,0,99,0,99,0,99,0,99,0,99,
  //99,0,99,0,99,0,99,0,99,0,99,0,99,0,99,0,99,0,99,99,99,0,99,
  //99,0,0,99,0,0,99,0,99,0,99,0,99,0,99,0,99,0,99,0,0,0,99,
  //99,99,0,99,0,0,99,99,99,0,99,99,99,0,99,99,99,0,99,0,99,99,99,
  //99,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,99,
  //99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99
  
  //},
  {
  99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,
  99,0,0,0,0,0,0,0,0,0,0,0,0,99,0,0,0,0,0,0,0,0,0,0,0,0,0,0,99,
  99,0,0,0,0,0,0,0,4,0,0,0,4,99,0,0,4,0,0,0,0,0,4,0,0,0,0,0,99,
  99,0,0,99,99,99,99,0,99,99,99,0,0,99,0,99,0,0,99,99,99,0,0,99,99,99,0,0,99,
  99,0,0,99,2,99,0,0,99,8,0,0,0,99,0,99,0,0,99,8,0,0,0,99,0,99,0,0,99,
  99,0,0,99,0,99,0,0,99,99,99,0,0,99,0,99,0,0,99,99,99,0,0,99,99,99,0,0,99,
  99,0,0,99,5,11,0,4,99,0,0,0,0,99,0,99,0,0,99,0,0,0,0,99,99,0,0,0,99,
  99,0,0,99,0,99,0,0,99,99,99,0,0,0,99,0,0,0,99,99,99,0,0,99,0,99,0,0,99,
  99,0,0,909,0,99,0,0,99,0,0,0,0,0,0,0,0,99,0,0,0,0,0,0,0,0,99,0,99,
  99,0,3,3,3,86,0,0,99,0,0,0,4,0,0,0,99,0,0,4,0,0,0,0,0,0,0,0,99,
  99,0,0,99,99,99,0,0,99,99,99,0,0,99,99,99,0,0,99,99,99,0,0,4,99,0,0,4,99,
  99,0,4,99,0,0,0,0,99,0,99,0,0,99,0,99,0,0,99,10,99,0,0,99,0,99,0,0,99,
  99,0,0,99,0,99,0,0,99,0,99,0,0,99,0,99,0,0,99,0,99,0,0,99,99,99,0,0,99,
  99,0,0,99,10,99,0,0,99,0,99,0,0,99,4,99,0,0,99,4,99,0,0,99,0,99,0,0,99,
  99,0,0,99,99,99,99,99,99,99,99,0,0,99,0,99,0,0,99,0,99,0,0,99,0,99,0,0,99,
  99,0,0,0,0,0,0,0,0,0,0,0,99,0,0,0,0,0,0,0,0,0,99,0,0,0,0,0,99,
  99,0,4,0,0,0,0,0,0,4,0,99,0,0,0,0,4,0,0,0,0,99,0,0,0,0,0,10,99,
  99,0,0,99,99,99,0,0,99,99,99,0,0,99,0,99,99,99,99,99,99,0,0,99,99,99,99,99,99,
  99,0,0,99,0,0,0,0,0,99,0,0,0,99,0,99,0,0,99,0,4,0,4,99,99,99,0,99,99,
  99,0,0,99,0,99,4,0,0,99,0,0,0,99,0,99,0,0,99,99,99,0,0,99,1,0,0,0,99,
  99,0,0,99,0,99,0,0,0,99,0,0,0,99,10,99,0,0,99,0,0,0,0,99,99,99,0,0,99,
  99,0,0,99,99,99,0,4,99,99,99,0,0,0,99,0,0,4,99,99,99,0,0,99,99,99,4,0,99,
  99,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,99,0,0,0,0,0,99,
  99,0,0,0,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0,0,99,0,0,0,4,0,0,99,
  99,0,0,99,0,99,0,0,99,99,99,0,0,99,0,99,4,0,99,0,99,0,0,99,99,99,0,0,99,
  99,0,0,99,0,99,0,0,99,0,99,0,0,99,0,99,0,0,99,0,99,0,0,99,0,99,0,0,99,
  99,0,0,99,0,99,0,0,99,0,99,0,0,99,0,99,0,0,99,0,99,0,0,99,99,99,4,0,99,
  99,0,0,0,99,0,0,0,99,0,99,0,10,99,0,99,0,0,99,0,99,0,0,99,0,0,0,0,99,
  99,99,99,0,99,4,0,99,99,99,99,99,99,99,99,99,0,0,99,99,99,0,0,99,0,99,99,99,99,
  99,0,0,0,99,0,0,0,4,0,0,0,4,0,4,4,0,4,0,0,0,0,0,0,0,4,0,0,99,
  99,0,4,0,99,0,0,0,0,0,4,0,0,0,0,0,0,0,0,4,0,0,0,4,0,0,0,68,99,
  99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99,99
  }
  };

  Tile[] mapTile;
  int length_;
  int num_map;
  int cols;
  int rows;
  
  Map(int level){
    num_map = stageList.length;
    length_ = stageList[level].length;
    mapList = stageList[level];
    cols = 29; 
    rows = 32;
  }
  
  Tile[] createTile(){
    mapTile = new Tile[length_];
    for(int i=0; i< length_; i++){
      mapTile[i] = new Tile(mapList[i]);
    }
    return mapTile;
  }
  
  void randomWall(int i){
    Tile[] neighbor = getNbr(i);
    int count=0;
    for(int j=0; j< 8;j++){
      if(neighbor[j].type == 0) count++;
    }
    
    if(count >= 3){
      for(int j=0; j< 8;j++){
        if(neighbor[j].type == 0){
          neighbor[j].type = 99;
          break;
        }
      }
    }
  }//end randomWall
  
  void randomPath(int i){
    Tile[] neighbor = getNbr(i);
    int count=0;
    for(int j=0; j< 8;j++){
      if(neighbor[j].type == 99) count++;
    }
    
    if(count >= 3){
      for(int j=0; j< 8;j++){
        if(neighbor[j].type == 99){
          neighbor[j].type = 0 ;
          break;
        }
      }
    }
  }//end randomWall
  
  void bomb(int i){
    Tile[] neighbor = getNbr(i); 
    for(int j=0; j< 8;j++){
      neighbor[j].type = 0;
     }
  }
  
  Tile[] getNbr(int i){
    Tile[] neighbor = new Tile[8];
    
    neighbor[0] = mapTile[i-cols-1];
    neighbor[1] = mapTile[i-cols];
    neighbor[2] = mapTile[i-cols+1];
    
    neighbor[3] = mapTile[i-1];
    neighbor[4] = mapTile[i+1];
    
    neighbor[5] = mapTile[i+cols-1];
    neighbor[6] = mapTile[i+cols];
    neighbor[7] = mapTile[i-cols+1];
    
    return neighbor;
  }
  
}
