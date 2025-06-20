inventory inven;
ArrayList<Integer> selected;
float adjustedMouseX;
float adjustedMouseY;
int blockSize = 400;
float noiseScale = 10;
player you;
skeleton skelly;
skeleton skell;
ArrayList<arrow> arrows;
ArrayList<being> beings;
boolean dead = false;
wild wilds;

void setup() {
  size(1600, 1600);
  inven = new inventory();
  beings = new ArrayList<being>();
  shapeMode(CENTER);
  you = new player();
  skelly = new skeleton(2);
  skell = new skeleton(1);
  arrows = new ArrayList<arrow>();
  wilds = new wild(40, 15);
  wilds.generate();
  wilds.inplace=true;
}

void draw() {
  if (!dead) {
    if (!inven.inplace) {
      if (wilds.inplace == true){
      wilds.display();
     if (frameCount % 900 == 0){genNewSkelly();genNewZombie();}}
      fill(255);
      textSize(20);
      textAlign(LEFT);
      text("Arrows: " + you.arrowCount, you.x - width / 2 + 10, you.y - height / 2 + 30); // Display arrow count
      text("X: " + nf(you.x, 1, 2) + ", Y: " + nf(you.y, 1, 2), you.x - width / 2 + 10, you.y - height / 2 + 60);
      text("xp: " + you.xp + "/" + (you.level*5+25),you.x-width/2+10, you.y - height / 2 + 90);
      text("HP: " + you.hp + "/" + you.maxhp,you.x-width/2+10, you.y - height / 2 + 120);

      adjustedMouseX = mouseX + you.x - width / 2;
      adjustedMouseY = mouseY + you.y - height / 2;

      for (int i = beings.size() - 1; i >= 0; i--) {
        being b = beings.get(i);

        if (b != null) {
          b.run();
          if (b instanceof enemy) {
            b.inv[0].move(b);
            b.inv[0].display();
          }

          // Set beings to null if they are dead
          if (b.udead == true) {
            if (b instanceof enemy) {
              beings.set(i, null);
            }
          }
        }
      }


if (you.inv[you.drawn] != null){
you.inv[you.drawn].move(you); you.inv[you.drawn].display();}
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
    else{
    inven.run();
  }}
}

void keyPressed() {
  if (key == 'w') {
    you.direction = 90;
  }
  if (key == 'd') {
    you.direction = 0;
  }
  if (key == 's') {
    you.direction = 270;
  }
  if (key == 'a') {
    you.direction = 180;
  }
  if (key == ' ') {
    you.direction = 1;
  }
  if (key == 'r') {
    if (dead == true) {
      beings = new ArrayList<being>();
      shapeMode(CENTER);
      you = new player();
      skelly = new skeleton(5);
      skell = new skeleton(1);
      arrows = new ArrayList<arrow>();
      dead = false;
    }  
  }
  if (key == '1') {
   you.drawn=0;
  }
  if (key == '2') {
  you.drawn=1;
  }
    if (key == '3') {
  you.drawn=2;
  }
    if (key == '4') {
  you.drawn=3;
  }
    if (key == '5') {
  you.drawn=4;
  }
    if (key == '6') {
  you.drawn=5;
  }
    if (key == '7') {
  you.drawn=6;
  }
    if (key == '8') {
  you.drawn=7;
  }
  if (key == 'p') {
    print(you.x);
  }
  if (key == 'g'){
  genNewSkelly();
genNewZombie();}
  if (key == 'e') {
    if (inven.inplace == true) {
      inven.inplace = false;
    } else {
      inven.looting = false;
      inven.inplace = true;
    }
  }
}

boolean circleCircleIntersect(being p, arrow a) {
  if (dist(p.x, p.y, a.x, a.y) < a.r + p.r) {
    return true;
  } else {
    return false;
  }
}

void mouseClicked() {
  if (inven.inplace == false) {
    you.hit();
  } else {
    inven.selectItem(mouseX, mouseY);
  }
}

boolean circleCircleIntersect2(float cx1, float cy1, float cr1, float cx2, float cy2, float cr2) {
  if (dist(cx1, cy1, cx2, cy2) < cr1 + cr2) {
    return true;
  } else {
    return false;
  }
}

void swapItems(item[] array1, int index1, item[] array2, int index2) {
  item temp = array1[index1];
  array1[index1] = array2[index2];
  array2[index2] = temp;
}
void genNewSkelly(){
beings.add(new skeleton(int(random(you.level, you.level +2))));}
void genNewZombie(){
beings.add(new zombie(int(random(you.level, you.level +2))));}
String bowGenerator(){
 int i=int(random(0,600));
  if (i < 567){return "Bow";}
  else if (i < 575){return "Good Bow";}
  else if (i < 583){return "Stone Bow";}
  else if (i < 591){return "Compound Bow";}
  else if (i < 593){return "Silver Bow";}
  else if (i < 595){return "Crossbow";}
  else if (i < 597){return "Mongolian Bow";}
  else {return "Poison Bow";}

}
String swordGenerator(){
 int i=int(random(0,600));
  if (i < 500){return "Sword";}
  else if (i < 530){return "Quarterstaff";}
  else if (i < 550){return "Sharp Sword";}
  else if (i < 570){return "Golden Dagger";}
  else if (i < 575){return "Smasher";}
  else if (i < 580){return "Obsidian Dagger";}
  else if (i < 585){return "Stunning Axe";}
  else if (i < 590){return "Rush Axe";}
  else {return "Flame Sword";}

}
