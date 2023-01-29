int cols = 29;
int rows = 32;
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
  
  if(player.x < 0 || player.x > cols*100){
    player.x = cols*100 - player.x;
  }
  if(player.y < 0 || player.y > rows*100){
    player.y = rows*100 - player.y;
  }
  
  for(int i=0; i<map.length_; i++){
    int block_x = i % cols * 100;
    int block_y = int(i / cols) * 100;
    
    if(isHit(player.x, player.y, playerSize, playerSize, block_x, block_y, 100, 100) == 1){
        trap(i);
    }
    
    push();
    
    fill(80);
    if(mapTile[i].type == 99){
      fill(150);
    }
    if(mapTile[i].type == 2){
      fill(80, 255); 
    }
    if(mapTile[i].type == 4){
      fill(255, 255,0); 
    }
    
    rect(block_x - camera_x, block_y - camera_y, 100, 100);
    
    if(mapTile[i].type == 1){
      fill(0, 200, 255);
      rect(block_x + 10 - camera_x, block_y + 10 - camera_y, 100-20, 100-20, 5);
    }
    pop();
  }
  
  renderPlayer(player.x, player.y, dx, dy);

  for(int i=0; i<map.length_; i++){
    int block_x = i % cols * 100;
    int block_y = int(i / cols) * 100;
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
  initPlayerPos();
  clear_flag = 0;
}

void initPlayerPos(){
  int index = 0;
  for (int i = 0; i < map.length_; i ++){
    if (mapTile[i].type == 2){
      index = i;
      break;
    }
  }
  player.x = index%cols * 100;
  player.y = (int)(index/cols) * 100;

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
  if(mapTile[i].type == 99){
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
  if(mapTile[i].type == 4 && mapTile[i].activated == false){
    player.health = 0;
    mapTile[i].activated = true;
    print("Death");
  }
  //build wall
  if(mapTile[i].type == 69 && mapTile[i].activated == false){
    mapTile[i-29].type = 99;
    mapTile[i].activated = true;
  }
  //spike
  if(mapTile[i].type == 11 && mapTile[i].activated == false){
    player.health--;
    print(player.health);
    mapTile[i].activated = true;
  }
  //shuffle controls
  if(mapTile[i].type == 420){
    if(left == 'a'){
      left = 'd';
      right = 'a';
    }else{
      left = 'a';
      right = 'd';
    }
    if(up == 'w'){
      up = 's';
      down = 'w';
    }else{
      up = 'w';
      down = 's';
    }
  }//420
}//end trap
