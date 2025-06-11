class enemy extends being{
int level;
boolean dead;
enemy(int l){
  super();
level = l;}
enemy(){super(10);}
void move(){super.move();}
void die(){
if (hp <= 0){
udead=true;
inven.looting=true;
inven.inplace=true;}}
void display(){
  if (this instanceof skeleton){fill(255);}else if(this instanceof zombie){fill(0,0,200);}
    stroke(1);
  circle(x,y,40);
  fill(255);
  rectMode(CENTER);
  rect(x,y-25,20,10);
  fill(255,0,0);
  stroke(0);
  rect(x,y-25,20*hp/maxhp,8);
  stroke(1);
  textMode(CENTER);
  fill(255,255,0);
  text(level,x,y-40);

}
void run(){
  super.run();
  display();
super.display();
move();
die();}
}
