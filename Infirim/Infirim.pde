//Dan Fun Project infirim
player you;
skeleton skelly;
skeleton skell;
ArrayList<arrow> arrows;
ArrayList<being> beings;
boolean dead=false;
void setup(){
beings = new ArrayList<being>();
  shapeMode(CENTER);
you = new player();
skelly=new skeleton(2);
skell=new skeleton(1);
size(1000,1000);
arrows = new ArrayList<arrow>();
}
void draw(){
    
  if (dead == false){
  background(100,200,100);
  for (int i = beings.size() - 1; i >= 0; i--) {
    being b = beings.get(i);
    
    if (b != null) {
      b.run();

      // Set beings to null if they are dead
      if (b.udead==true) {
        if (b instanceof enemy){beings.set(i, null);}
      }
    }
  }
 
  if (you.drawn==true)
  {you.inv[1].move(you);
you.inv[1].display();}
  else{
  you.inv[0].move(you);
  you.inv[0].display();}
  if(skelly.udead == false){skelly.inv[0].move(skelly);
  skelly.inv[0].display();}
  if (skell.udead == false){
  skell.inv[0].move(skell);
  skell.inv[0].display();}
  for (int i = arrows.size() - 1; i >= 0; i--) {
    arrow a = arrows.get(i);
    a.move();
    a.display();

    // Remove arrow if it's off-screen
    if (!a.active) {arrows.remove(i);
      }}
}}
 void keyPressed() {
 if(key == 'w'){you.direction=90;}
 if(key == 'd'){you.direction=0;}
 if(key == 's'){you.direction=270;}
 if(key == 'a'){you.direction=180;}
 if(key == ' '){you.direction=1;}
 if(key =='r'){if (dead == true){beings = new ArrayList<being>();
  shapeMode(CENTER);
you = new player();
skelly=new skeleton(5);
skell=new skeleton(1);
size(1000,1000);
arrows = new ArrayList<arrow>();
dead = false;}}
if (key=='1'){you.drawn = false;}
if (key=='2'){you.drawn = true;}} 
 
 boolean circleCircleIntersect(being p, arrow a) {
  if (dist(p.x, p.y, a.x, a.y) < a.r+p.r) {
    return true;
  } else {
    return false;
  }}

void mouseClicked(){
you.hit();}
