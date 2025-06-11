class sword extends weapon{
int speed;
  int attackDuration = 1;
  int attackCounter = 0;
  float attackAngle = 0;
    sword(int ran, int str, String nm) {
    name = nm;
      power = str;
  range = ran;
  rarity = 1;
 if(name == "Quarterstaff"){power*=1;range*=2;rarity=2;}
   if(name == "Sharp Sword"){power*=1.25; rarity=2;}
   if(name == "Golden Dagger"){power*=2;range=40; rarity=2;}
  if(name == "Obsidian Dagger"){power*=3.5;range=40; rarity=3;}
   if(name == "Smasher"){power*=2;range*=2; rarity=3; cooldown = 1; Slow= true;}
    if(name == "Stunning Axe"){power*=1.5; stun=1; rarity = 3;}
     if(name == "Flame Sword"){power*=1.5; rarity=3; poison=true;}
     if (name == "Rush Axe"){power*=1.5;range*=.5;Fast=true; rarity=3;}
 }
 
 
void display() {
    pushMatrix();
    translate(x, y);
    if (isAttacking) {
      rotate(direction+attackAngle);
    } else {
      rotate(direction+3*PI/4);
    }
    // Draw sword at the current position
    if(name != "Rush Axe" && name != "Stunning Axe" && name != "Smasher" && name != "Quarterstaff"){
    fill(139, 69, 19); // Brown color for the handle
    if (name == "Golden Dagger"){fill(255,255,0);}
    if (name == "Obsidian Dagger" || name == "Flame Sword"){fill(0);}
    rect(-5, 10, 10, 25);

    fill(192, 192, 192); // Silver color for the guard
    if (name == "Golden Dagger" || name == "Flame Sword"){fill(255,215,0);}
    if (name == "Obsidian Dagger"){fill(0);}
    rect(-10, -5, 20, 5);

    fill(192, 192, 192); // Silver color for the blade
    if (name == "Sharp Sword"){fill(220,220,200);}
    if (name == "Golden Dagger"){fill(255,215,0);}
    if (name == "Obsidian Dagger"){fill(46,25,52);}
    if (name == "Flame Sword"){fill(255,0,0);}
    rect(-2, -23, 4, range);

    fill(139, 69, 19); // Brown color for handle details
    rect(-2, 12, 4, 2);
    rect(-5, 12, 4, 2);
    rect(-2, 20, 4, 2);
    rect(-5, 20, 4, 2);}
    else if (name == "Quarterstaff"){
       fill(101, 67, 33); // Darker brown
        rect(-3, -range/2, 6, range);
        
        // Decorative bands
        fill(192, 192, 192); // Silver
        rect(-4, -range/3, 8, 3);
        rect(-4, range/3, 8, 3);
    }
    else{
       fill(139, 69, 19); // Brown
        rect(-5, 10, 10, range * 0.6);

        // Axe Head dynamically sized by range
        fill(150); // Metallic silver
        beginShape();
        vertex(-10 * (range * 0.03), -5);
        vertex(10 * (range * 0.03), -5);
        vertex(20 * (range * 0.03), -range * 0.25);
        vertex(-20 * (range * 0.03), -range * 0.25);
        endShape(CLOSE);
    }
    
    popMatrix();
    update();
  }


  void attack() {
    isAttacking = true;
    attackCounter = 0;
      for (int i = beings.size() - 1; i >= 0; i--) {
      being b = beings.get(i);
      if (b instanceof enemy){
        if(circleCircleIntersect2(x,y,range+20.0,float(b.x),float(b.y),float(20)) == true && direction >= atan2(((b.x - y)) , ((b.y - x)))-45 && direction <= atan2(((b.x - y)) , ((b.y - x)))+45){
      b.hp-=power; if (stun >0){b.stunned+=stun;}}}
  }}
  void attack2() {
    isAttacking = true;
    attackCounter = 0;
      for (int i = beings.size() - 1; i >= 0; i--) {
      being b = beings.get(i);
      if (b instanceof player){
        if(circleCircleIntersect2(x,y,range+20.0,float(b.x),float(b.y),float(20)) == true && direction >= atan2(((b.x - y)) , ((b.y - x)))-45 && direction <= atan2(((b.x - y)) , ((b.y - x)))+45){
      b.hp-=power;if (stun >0){b.stunned+=stun;}}}
  }}  
  void update() {
    if (isAttacking) {
      attackCounter++;
      attackAngle = map(attackCounter, 0, attackDuration, -PI/4, PI/4);
      if (attackCounter >= attackDuration) {
        isAttacking = false;
      }
    }
  }}
