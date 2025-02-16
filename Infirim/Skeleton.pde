class skeleton extends enemy{
skeleton(int l){
    super(l);
hp=level*3;
  maxhp= hp;
x = int(random(0,width));
y=int(random(0, height/2));
inv = new item[5];
inv[0]= new bow(int(10+l*.15),int(4+l));
inv[1]= new arrow(10);
speed=2;}

void display(){
fill(255);
super.display();}
void move(){
  super.move();
if (x <= 0){direction = 0;}else if(x >= width){direction=180;}else if (frameCount %20 == 0){direction=randomDirection();} 
  if (frameCount % 100 == 0){inv[0].attack();}}
  float randomDirection() {
    if(random(1) < 0.5){return 0;}else{return 180;}   }
void die(){
  super.die();
if (hp <= 0){you.arrowCount+=10;
udead=true;
inven.loot = new item [1];
inven.loot[0] = inv[0];}} 
void run(){display();
super.display();
move();
die();}
 }
