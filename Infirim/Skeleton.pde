class skeleton extends enemy{
skeleton(int l){
    super(l);
    level=l;
hp=level*3;
  maxhp= hp;

x = int(random(max(you.x-width/2,0),min(you.x+width/2,10000)));
y = int(random(max(you.y-height/2,0),min(you.y+height/2,10000)));

inv = new item[5];
inv[0]= new bow(int(10+l*.15*random(2,4)+random(0,3)),int(4+l+.1*l*random(0,2)),bowGenerator());
inv[1]= new arrow(10);
if (inv[0].name == "Crossbow"){speed=1;}
else if(inv[0].name == "Mongolian Bow"){speed=3;}
else{speed=2;}}

void display(){
fill(255);
super.display();}
void move(){
  super.move();
if (x <= 0){direction = 0;}else if(x >= width){direction=180;}else if (frameCount %20 == 0){direction=randomDirection();} 
if (inv[0].name=="Crossbow"){if (frameCount% 240 == 0){inv[0].attack();}}
else{
if (frameCount % 100 == 0){inv[0].attack();}}}
  float randomDirection() {
    if(random(1) < 0.5){return 0;}else{return 180;}   }
void die(){
  super.die();
  
if (hp <= 0){you.arrowCount+=10;
you.xp+=level*4+5;
udead=true;
inven.loot = new item [1];
inven.loot[0] = inv[0];}} 
void run(){display();
super.display();
move();
die();}
 }
