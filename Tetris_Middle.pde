GameBoy gb = new GameBoy();

int x = 2;
int y = -1;
int rot = 0;
int speed=200;
int acc=1;

void setup() {
  
  size(285, 565);
  gb.begin(0);
}



void draw() {
   gb.drawDisplay();
   drawBlock(I_Block_1, x, y);
   delay(200);
     if (y < 15){
       y++;
     }else{
       y = -1;
     }
}

void keyPressed(){
  if(gb.getKey() == 4){
    x--;
  }else if(gb.getKey() == 5){
    x++;
  }
}

void drawBlock(byte[][] arr, int x, int y) {
  for (int i = 0; i < 4; i++) {
    for (int j = 0; j < 4; j++) {
      if (arr[j][i] == 1) {
        gb.drawPoint(x + i, y + j);
      }
    }
  }
}
