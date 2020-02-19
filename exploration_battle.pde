Player player;

MapGenerator map;
PGraphics background;
PVector cameraOr;
PVector baseCoord;
boolean up, down, left, right;
int step=3, scl=15;

void setup() {
  fullScreen();
  //size(600, 400);
  cameraOr=new PVector(width/2, height/2);
  player=new Player(cameraOr);
  baseCoord=new PVector(0, 0);
  map=new MapGenerator();
}

void draw() {
  background(255);
  player.updatePrev();
  updateCamera();
  if(player.moved()){
    
  }
  push();
  translate(width/2, height/2);
  image(map.createMap(player.pos), baseCoord.x-player.pos.x, baseCoord.y-player.pos.y);
  //fill(0);
  //rect(baseCoord.x-player.pos.x, baseCoord.y-player.pos.y, width, height);
  player.show();
  pop();
  //println(cameraOr, player.pos);
}

void updateCamera() {
  if (up) {
    player.move(0, -step);
  }
  if (down) {
    player.move(0, step);
  }
  if (left) {
    player.move(-step, 0);
  }
  if (right) {
    player.move(step, 0);
  }
}

void keyPressed() {
  if (keyCode==UP) {
    up=true;
  }
  if (keyCode==DOWN) {
    down=true;
  }
  if (keyCode==LEFT) {
    left=true;
  }
  if (keyCode==RIGHT) {
    right=true;
  }
}

void keyReleased() {
  if (keyCode==UP) {
    up=false;
  }
  if (keyCode==DOWN) {
    down=false;
  }
  if (keyCode==LEFT) {
    left=false;
  }
  if (keyCode==RIGHT) {
    right=false;
  }
}
