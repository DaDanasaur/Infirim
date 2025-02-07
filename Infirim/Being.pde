class being{
float speed;
int x;
int y;
int t;
int direction = 1;
int maxhp;
int hp;
int level = 1;
being(int sp){
  speed=sp;}

being(){}


void move(){
  float sped = speed;
  if(direction == 0){x += sped;}
    else if(direction == 90){y -= sped;}
      else if(direction == 180){x -= sped;}
        else if(direction == 270){y += sped;}
        
}


void sprint(){
}

void display(){
  if(t == 0){
    fill(0,0,255);}
    else{fill(255,0,0);}
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
