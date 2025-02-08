class being{
float speed;
int x;
int y;
int t;
float direction = 1;
int maxhp;
int hp;
int level = 1;
int r = 20;
boolean udead;
item[] inv;
being(int sp){
  inv=new item[20];
  speed=sp;}

being(){
beings.add(this);}
void run(){}

  void move() {
    // Move based on direction
    if (direction == 90 && y > 0) { // Move up
      y -= speed;
    } else if (direction == 0 && x < 10000 * blockSize) { // Move right
      x += speed;
    } else if (direction == 270 && y < 10000 * blockSize) { // Move down
      y += speed;
    } else if (direction == 180 && x > 0) { // Move left
      x -= speed;
    }
  }



void sprint(){
}

void display(){
    stroke(1);
  circle(x,y,40);
  fill(255);
  rectMode(CENTER);
  rect(x,y-25,20,10);
  fill(255,0,0);
  stroke(0);
  rect(x,y-25,20*hp/maxhp,8);
  stroke(1);

}


}
