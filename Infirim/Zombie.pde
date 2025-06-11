class zombie extends enemy{
zombie(int l){
    super(l);
    level=l;
hp=level*5;
  maxhp= hp;
x = int(random(max(you.x-width/2,0),min(you.x+width/2,10000)));
y = int(random(max(you.y-height/2,0),min(you.y+height/2,10000)));


inv = new item[5];
inv[0]= new sword(int(20+l*.15*random(2,4)+random(0,3)),int(30+l+.4*l*random(0,2)),swordGenerator());
speed=4;
movespeed=4;}

void display(){
fill(0,255,0);
super.display();}
void move(){
  super.move();
if (x-you.x>=inv[0].range){direction = 180;}else if(you.x-x >= inv[0].range){direction=0;}else if(you.y-y >= inv[0].range){direction=270;} 
else if (y-you.y >= inv[0].range) {direction=90;}
  if (frameCount % 100 == 0){
  inv[0].attack2();}}
  float randomDirection() {
    if(random(1) < 0.5){return 0;}else{return 180;}   }
void die(){
  super.die();
  
if (hp <= 0){
you.xp+=level*3.5+3;
udead=true;
inven.loot = new item [1];
inven.loot[0] = inv[0];}} 
void run(){display();
super.display();
move();
die();}
 }
