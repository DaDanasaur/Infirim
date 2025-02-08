class item{
float direction;
float y;
float x;
int kspeed;
item(){}
void move(being r){
kspeed=0;
if(r instanceof player){ 
direction = atan2((( mouseY - y)) , ((mouseX - x)));}
else{direction = (atan2((( you.y - y)) , ((you.x - x))));}
        x =r.x+20*cos(direction);
        y =r.y+20*sin(direction);
      
        x+= kspeed*cos(direction);
      y+= kspeed*sin(direction);
    if (kspeed >= .4){kspeed -=.4;}
  else{kspeed=0;}

        
        
//at the end of move
}
void display(){}
void attack(){}}
