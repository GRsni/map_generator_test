class Player {
  PVector pos;
  PVector prev=new PVector(0, 0);

  Player(PVector pos) {
    this.pos=pos;
  }  

  void show() {
    push();
    fill(255, 0, 0);
    noStroke();
    rectMode(CENTER);
    rect(0, 0, 20, 20);
    pop();
  }

  void move(int x, int y) {
    pos.x+=x;
    pos.y+=y;
  }

  void updatePrev() {
    prev.x=pos.x;
    prev.y=pos.y;
  }

  boolean moved() {
    return pos.x==prev.y&&pos.y==prev.y;
  }
}
