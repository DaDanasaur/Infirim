//Dan Fun Project infirim
float adjustedMouseX;
float adjustedMouseY;
int blockSize = 200;
float noiseScale = 3;
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
size(1500,1500);
arrows = new ArrayList<arrow>();
}
void draw() {
  if (!dead) {
    background(135, 206, 235); // Sky color

    // Camera translation
    translate(width / 2 - you.x, height / 2 - you.y);

    // Generate and display terrain
    for (int x = you.x / blockSize - 50; x <= you.x / blockSize + 50; x++) {
      for (int y = you.y / blockSize - 50; y <= you.y / blockSize + 50; y++) {
        float noiseValue = noise(x * noiseScale, y * noiseScale);
        float terrainHeight = noiseValue * height;

        // Choose a color based on terrain height
        if (terrainHeight > height) {
          fill(34, 139, 34); // Darker green for higher terrain
        } else {
          fill(50, 205, 50); // Lighter green for lower terrain
        }

        // Draw terrain block
        rect(x * blockSize, height - terrainHeight, blockSize, terrainHeight);
      }
    }
    
  adjustedMouseX = mouseX + you.x - width / 2;
  adjustedMouseY = mouseY + you.y - height / 2;

    for (int i = beings.size() - 1; i >= 0; i--) {
      being b = beings.get(i);

      if (b != null) {
        b.run();

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

    if (!skelly.udead) {
      skelly.inv[0].move(skelly);
      skelly.inv[0].display();
    }

    if (!skell.udead) {
      skell.inv[0].move(skell);
      skell.inv[0].display();
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
 boolean circleCircleIntersect2(float cx1, float cy1, float cr1, float cx2, float cy2, float cr2) {
  if (dist(cx1, cy1, cx2, cy2) < cr1 + cr2) {
    return true;
  } else {
    return false;
  }
}
