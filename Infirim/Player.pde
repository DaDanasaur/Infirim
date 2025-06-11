class player extends being{
int gold = 0;
int xp = 0;
int drawn = 0;
int arrowCount;
int movespeed;
int cooldown=0;
player(){

  super();
  level=1;
speed= 6;
movespeed=6;
x=width/2;
y=height/2;
maxhp=level*10+100;
hp=maxhp;
inv = new item[10];
inv[0]=new bow(10,8, "bow");
inv[1]=new sword(40,30, "Sword");
arrowCount=10;}

void run(){ super.run();
if (inv[drawn] != null){ if (inv[drawn].Fast ==true){speed=movespeed+2;}else if(inv[drawn].Slow==true){speed=movespeed-2;}
else{speed=movespeed;}}
fill(250,200,200);
super.display();
move();
die();
if (8*level+25<=xp){level+=1; maxhp+=10; hp=maxhp; xp -= ((8*level-1)+25); }}
void die(){
if(hp<=0){
  background(0);
  fill(255);
  textSize(100);
  textAlign(CENTER);
  text("You died", x,y);
  dead=true;
}else if(hp < maxhp){if (frameCount % 60 == 0){hp+=maxhp*.02;if(cooldown>0){cooldown-=1;}}}
}
//void hit(){
//if (drawn == true){inv[1].attack();}
//else if (arrowCount >= 1) {
 //       inv[0].attack(); // Using the Bow when not drawn
   //     arrowCount -= 1;
    //  }
    //}
void hit(){
  if(cooldown ==0){
  if (inv[drawn] instanceof weapon){
  if (inv[drawn] instanceof bow){
  if (arrowCount >= 1){
  arrowCount-=1; 
  inv[drawn].attack();}}
  else{inv[drawn].attack();}
cooldown+=inv[drawn].cooldown;}}}

}
