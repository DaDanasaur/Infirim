class player extends being{
int gold = 0;
int xp = 0;
boolean drawn = true;
int arrowCount;
player(){
  super();
speed= 6;
x=width/2;
y=height/2;
maxhp=level*10+40;
hp=level*10+40;
inv = new item[10];
inv[0]=new bow(int(10+level*.15),7+level);
inv[1]=new sword();
arrowCount=10;}

void run(){
fill(250,200,200);
super.display();
move();
die();}
void die(){
if(hp<=0){
  background(0);
  fill(255);
  textSize(100);
  textAlign(CENTER);
  text("You died", height/2, width/2 );
  dead=true;
}else if(hp < maxhp){if (frameCount % 60 == 0){hp+=maxhp*.02;}}
}
void hit(){
if (drawn == true){inv[1].attack();}
else if (arrowCount >= 1) {
        inv[0].attack(); // Using the Bow when not drawn
        arrowCount -= 1;
      }
    }
  }
