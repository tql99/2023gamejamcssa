int dx = 0;
int dy = 0;
int camera_x = 0;
int camera_y = 0;
int clear_flag = 0;
int level = 0;
int playerSize = 75;
int windowBlocks = 7;
int blockSize = 0;
Player player = new Player();
int prev_x;
int prev_y;
char up = 'w';
char down = 's';
char left = 'a';
char right = 'd';
int anime_t = 0;

Map map = new Map(level);
Tile[] mapTile = map.createTile();

void setup() {
  size(600 , 600);
  initStage(level);
}

void draw(){
  background(30);
  if(abs(dx) > 0 || abs(dy) > 0){
    anime_t ++;
  }else{
    anime_t = 0; 
  }
  
  prev_x = player.x;
  prev_y = player.y;
  player.x += dx * 5;
  player.y += dy * 5;
  
  if(player.x < 0 || player.x > map.cols*100){
    player.x = map.cols*100 - player.x;
  }
  if(player.y < 0 || player.y > map.rows*100){
    player.y = map.rows*100 - player.y;
  }
  
  for(int i=0; i<map.length_; i++){
    int block_x = i % map.cols * 100;
    int block_y = int(i / map.cols) * 100;
    
    if(isHit(player.x, player.y, playerSize, playerSize, block_x, block_y, 100, 100) == 1){
        trap(i);
    }else{
      mapTile[i].deactivated = false;
    }
    
    
    push();
    
    //render color
    fill(80);
    if(mapTile[i].type == 99){ //wall
      fill(150);
    }
    if(mapTile[i].type == 2){ //start
      fill(80, 255); 
    }
    if(mapTile[i].type == 4){ //death
      fill(255, 255,0); 
    }
    if(mapTile[i].type == 990){ //path but looks like wall
      fill(140); 
    }
    if(mapTile[i].type == 11){  //spike
      if(frameCount % (4*frameRate) <= frameRate){
        fill(0);
        mapTile[i].deactivated = false;
      }
      else{
        fill(80);
        mapTile[i].deactivated = true;
      }
    }
    if(mapTile[i].type == 3 && mapTile[i].showKey ==  true){
      fill(90);
    }
    
    rect(block_x - camera_x, block_y - camera_y, 100, 100);
    
    if(mapTile[i].type == 1){
      fill(0, 200, 255);
      rect(block_x + 10 - camera_x, block_y + 10 - camera_y, 100-20, 100-20, 5);
    }
    pop();
    
  }//end for loop 
  
  renderPlayer(player.x, player.y, dx, dy);

  for(int i=0; i<map.length_; i++){
    int block_x = i % map.cols * 100;
    int block_y = int(i / map.cols) * 100;
    if(mapTile[i].type == 2){
      fill(0, 0,20,50); 
      rect(block_x - camera_x, block_y - camera_y, 100, 100);
    }
    
  }
  
  if(clear_flag == 1){
    fill(0, 100);
    rect(0, 0, width, height);
    textAlign(CENTER, CENTER);
    
    textSize(32);
    fill(255);
    text("STAGE " + (level + 1) + "/" + map.num_map, width/2, height/2 - 100);
    
    textSize(64);
    fill(255);
    text("CLEAR", width/2, height/2);
    
    textSize(32);
    fill(255);
    text("Press Enter to Next", width/2, height/2 + 100);
  }
  
  if(clear_flag == -1){
    fill(0, 100);
    rect(0, 0, width, height);
    textAlign(CENTER, CENTER);
    
    textSize(32);
    fill(255);
    text("STAGE " + (level + 1) + "/" + map.num_map, width/2, height/2 - 100);
    
    textSize(64);
    fill(255);
    text("You Lost", width/2, height/2);
    
    textSize(32);
    fill(255);
    text("Press Enter to Play Again", width/2, height/2 + 100);
  }
  
  //int x_index = int(x / width);
  //int y_index = int(y / height);
  //camera_x += (x_index * width - camera_x) * 0.1;
  //camera_y += (y_index * width - camera_y) * 0.1;
  camera_x = player.x - width/2 + playerSize/2;
  camera_y = player.y - height/2 + playerSize/2;
   //camera_x = x_index * width;
   //camera_y = y_index * width;
  //printArray(new int[] {x,y,x_index,y_index,camera_x,camera_y});
 
}

void printArray(int [] array){
  for (int a : array){
    print(a+" ");
  }
  println();
}

void keyPressed(){
  //if(bgm.isPlaying() == false){
  //  bgm.loop();
  //}
  if(keyCode == left || key == left){
    dx = -1;
  }
  if(keyCode == right  || key == right){
    dx = 1;
  }
  if(keyCode == up  || key == up){
    dy = -1;
  }
  if(keyCode == down  || key == down){
    dy = 1;
  }
  if(keyCode == ENTER){
    if(clear_flag == 1){
      level ++;
      level = level % map.num_map;
      initStage(level); 
    }
    if(clear_flag == -1){
      initStage(level);
    }
  }
}


void keyReleased(){
  if(keyCode == left || key == left ){
    if(dx < 0)  dx = 0;
  }
  if(keyCode == right || key == right){
    if(dx > 0)  dx = 0;
  }
  if(keyCode == up || key == up){
    if(dy < 0)  dy = 0;
  }
  if(keyCode == down || key == down){
    if(dy > 0)  dy = 0;
  }
}

void renderPlayer(int x, int y, int dx, int dy){
  float attach_x = 0;
  float attach_y = sin(radians(anime_t*15)) * 1;
  if(dx < 0){
    attach_x = -3;
  }
  if(dx > 0){
    attach_x = 3;
  }
  fill(255);
  rect(x - camera_x, y + attach_y - camera_y, playerSize, playerSize - attach_y, playerSize/4);
  fill(80);
  ellipse(x + playerSize/2 - 10 + attach_x - camera_x, y + 20 + attach_y - camera_y, 5, 5);
  ellipse(x + playerSize/2 + 10 + attach_x - camera_x, y + 20 + attach_y - camera_y, 5, 5);
}

void initStage(int level){
  level = level % map.num_map;
  map = new Map(level);
  mapTile = map.createTile();
  initPlayerPos(2);
  reverseKey('a','d','w','s');
  frameRate(60);
  clear_flag = 0;
}

void initPlayerPos(int position){
  int index = 0;
  for (int i = 0; i < map.length_; i ++){
    if (mapTile[i].type == position){
      index = i;
      break;
    }
  }
  player.x = index%map.cols * 100;
  player.y = (int)(index/map.cols) * 100;

}

int isHit(int px, int py, int pw, int ph, int ex, int ey, int ew, int eh){
  if(px < ex + ew && px + pw > ex){
    if(py < ey + eh && py + ph > ey){
      return 1;
    }
  }
  return 0;
}
void trap(int i){
  
  //Wall
  if(mapTile[i].type == 99 || mapTile[i].type == 909){
    player.x = prev_x;
    player.y = prev_y;
        //soundManager.attack();
  }
  
  
  //finish tile
  if(mapTile[i].type == 1){
    if(clear_flag == 0){
      clear_flag = 1;
      //soundManager.bass();
    }
  }
  
  
  //loop back to start
  if(mapTile[i].type == 82){
    initStage(0);
  }
  
  
  //death
  if(mapTile[i].type == 4 && mapTile[i].deactivated == false){
    player.health = 0;
    mapTile[i].deactivated = true;
    clear_flag = -1;
    print("Death");
  }
  
  
  //build wall
  if(mapTile[i].type == 69 && mapTile[i].deactivated == false){
    map.randomWall(i);
    mapTile[i].deactivated = true;
  }
  
  //build path
  if(mapTile[i].type == 96 && mapTile[i].deactivated == false){
    map.randomPath(i);
    mapTile[i].deactivated = true;
  }
  
  //spike
  if(mapTile[i].type == 11 && mapTile[i].deactivated == false){
    player.health--;
    if(dx < 0){
      dx += 4;
    }else{
      dx -= 4;
    }
    if(dy < 0){
      dy += 4;
    }else{
      dy -= 4;
    }
    if(dx == 0 && dy == 0){
      dx +=4;
    }
    print(player.health);
    mapTile[i].deactivated = true;
  }
  
  //add health
  if(mapTile[i].type == 6 && mapTile[i].deactivated == false){
    player.health++;
    print(player.health);
    mapTile[i].deactivated = true;
  }
  
  //x2 speed
  if(mapTile[i].type == 5 && mapTile[i].deactivated == false){
    frameRate(120);
    mapTile[i].deactivated = true;
  }
  
  //first time step on 333
  if(mapTile[i].type == 333 && mapTile[i].deactivated == false && mapTile[i].first == false){
    for(int j=0; j<map.length_;j++){
      if(mapTile[j].type == 3){
        mapTile[j].showKey = true;
      }      
    }
    mapTile[i].first = true;
  }else if(mapTile[i].type == 333 && mapTile[i].deactivated == false && mapTile[i].first == true){ //bomb
    if(player.numKey >= 3){
      map.bomb(i);
      mapTile[i].deactivated = true;
    }
  }
  
  //key 
  if(mapTile[i].type == 3 && mapTile[i].deactivated == false && mapTile[i].showKey == true){
    player.numKey++;
    mapTile[i].showKey = false;
    mapTile[i].deactivated = true;
  }
  
  //teleport
  if(mapTile[i].type == 86 && mapTile[i].deactivated == false){
    initPlayerPos(68);
    mapTile[i].deactivated = true;
  }
  
  //shuffle controls
  if(mapTile[i].type == 420 && mapTile[i].deactivated == false){
    if(left == 'a'){
      reverseKey('d','a','s','w');
    }else{
      reverseKey('a','d','w','s');
    }
    mapTile[i].deactivated = true;
  }//420
}//end trap

void reverseKey(char left_, char right_, char up_, char down_){
  left = left_;
  right = right_;
  up = up_;
  down = down_;
}
