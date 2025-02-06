class item{
int direction;
float y;
float x;
int kspeed;
item(){}
void move(player r){
kspeed=0;
direction = int(atan2((( mouseY - y)) , ((mouseX - x))));
        x =r.x+20*cos(direction);
        y =r.y+20*sin(direction);
      
        x+= kspeed*cos(direction);
      y+= kspeed*sin(direction);
    if (kspeed >= .4){kspeed -=.4;}
  else{kspeed=0;}

        
        
//at the end of move
}}
