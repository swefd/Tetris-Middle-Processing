GameBoy gb = new GameBoy();

int x = 2;
int y = -2;
int rot = 0;
int speed=200;
int acc=1;

void setup() {
  
  size(285, 565);
  gb.begin(0);
  createBlock((int) random(0, 7));
}



void draw() {
  
  if(keyPressed){
    println(keyCode);
  }
   
   if (gb.checkBlockCollision(gb.block[rot], x, y + 1)){
     gb.memBlock(gb.block[rot], x, y);
     createBlock((int) random(0, 7));
   } else {
     print("y++");
    y++; 
   }
   
   gb.drawDisplay();
   drawBlock(gb.block[rot], x, y);
   
   
   delay(400);
   
}

void keyPressed(){
  if(gb.getKey() == 4){
    if(!gb.checkBlockCollision(gb.block[rot], x - 1, y )){
      x--;
    }
  }else if(gb.getKey() == 5){
    if(!gb.checkBlockCollision(gb.block[rot], x + 1, y )){
      x++;
      println("asdasd");
    }
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


void createBlock(int num){
  println("Create");
  x = 2;
  y = 0;
  rot = (int) random(4);
  
  println("Num" + num);
  println("Rot" + rot);
  
  if (num == 0) gb.generateBlock(gb.block, I_Block_1, I_Block_2, I_Block_3, I_Block_4);
  if (num == 1) gb.generateBlock(gb.block, Z_Block_1, Z_Block_2, Z_Block_3, Z_Block_4);
  if (num == 2) gb.generateBlock(gb.block, S_Block_1, S_Block_2, S_Block_3, S_Block_4);
  if (num == 3) gb.generateBlock(gb.block, L_Block_1, L_Block_2, L_Block_3, L_Block_4);
  if (num == 4) gb.generateBlock(gb.block, J_Block_1, J_Block_2, J_Block_3, J_Block_4);
  if (num == 5) gb.generateBlock(gb.block, T_Block_1, T_Block_2, T_Block_3, T_Block_4);
  if (num == 6) gb.generateBlock(gb.block, O_Block_1, O_Block_2, O_Block_3, O_Block_4);
  
}
