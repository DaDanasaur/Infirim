//Dan Fun Project infirim
float adjustedMouseX;
float adjustedMouseY;
int blockSize = 400;
float noiseScale = 10;
player you;
skeleton skelly;
skeleton skell;
ArrayList<arrow> arrows;
ArrayList<being> beings;
boolean dead=false;
wild wilds;
void setup(){
beings = new ArrayList<being>();
  shapeMode(CENTER);
you = new player();
skelly=new skeleton(2);
skell=new skeleton(1);
size(1600,1600);
arrows = new ArrayList<arrow>();
wilds = new wild(40,15);
wilds.generate();
}
void draw() {
  if (!dead) { 
    wilds.display();
fill(255);
    textSize(20);
    text("Arrows: " + you.arrowCount, you.x-width/2+10,you.y-height/2+ 30); // Display arrow count
    text("X: " + nf(you.x, 1, 2) + ", Y: " + nf(you.y, 1, 2),  you.x-width/2+10,you.y-height/2+ 60); 
  adjustedMouseX = mouseX + you.x - width / 2;
  adjustedMouseY = mouseY + you.y - height / 2;

    for (int i = beings.size() - 1; i >= 0; i--) {
      being b = beings.get(i);

      if (b != null) {
        
        b.run();
      if (b instanceof enemy){
      b.inv[0].move(b);
      b.inv[0].display();}
    
        // Set beings to null if they are dead
        if (b.udead == true) {
          if (b instanceof enemy) {
            beings.set(i, null);
          }
        }
      }
    }

    if (you.drawn == true) {
      you.inv[1].move(you);
      you.inv[1].display();
    } else {
      you.inv[0].move(you);
      you.inv[0].display();
    }

  

    for (int i = arrows.size() - 1; i >= 0; i--) {
      arrow a = arrows.get(i);
      a.move();
      a.display();

      // Remove arrow if it's off-screen
      if (!a.active) {
        arrows.remove(i);
      }

    }
  }
}
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
arrows = new ArrayList<arrow>();
dead = false;}}
if (key=='1'){you.drawn = false;}
if (key=='2'){you.drawn = true;}
if (key=='p'){print(you.x);}} 
 
 boolean circleCircleIntersect(being p, arrow a) {
  if (dist(p.x, p.y, a.x, a.y) < a.r+p.r) {
    return true;
  } else {
    return false;
  }}

void mouseClicked(){
you.hit();}
 boolean circleCircleIntersect2(float cx1, float cy1, float cr1, float cx2, float cy2, float cr2) {
  if (dist(cx1, cy1, cx2, cy2) < cr1 + cr2) {
    return true;
  } else {
    return false;
  }
}
void swapItems(item[] array1,int index1,item[] array2, int index2) {
    item temp = array1[index1];
    array1[index1] = array2[index2];
    array2[index2] = temp;
}
