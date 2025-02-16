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
void run(){display();
super.display();
move();
die();}
}
