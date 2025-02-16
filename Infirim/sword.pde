class sword extends weapon{
int speed;
  int attackDuration = 1;
  int attackCounter = 0;
  float attackAngle = 0;
    sword(int ran, int str) {
    power = str;
  range = ran;
  name = "Sword";}
void display() {
    pushMatrix();
    translate(x, y);
    if (isAttacking) {
      rotate(direction+attackAngle);
    } else {
      rotate(direction+3*PI/4);
    }
    // Draw sword at the current position
    fill(139, 69, 19); // Brown color for the handle
    rect(-5, 10, 10, 25);

    fill(192, 192, 192); // Silver color for the guard
    rect(-10, -5, 20, 5);

    fill(192, 192, 192); // Silver color for the blade
    rect(-2, -23, 4, range);

    fill(139, 69, 19); // Brown color for handle details
    rect(-2, 12, 4, 2);
    rect(-5, 12, 4, 2);
    rect(-2, 20, 4, 2);
    rect(-5, 20, 4, 2);
    popMatrix();
    update();
  }

  @Override
  void attack() {
    isAttacking = true;
    attackCounter = 0;
      for (int i = beings.size() - 1; i >= 0; i--) {
      being b = beings.get(i);
      if (b instanceof enemy){
        if(circleCircleIntersect2(x,y,range+20.0,float(b.x),float(b.y),float(20)) == true && direction >= atan2(((b.x - y)) , ((b.y - x)))-45 && direction <= atan2(((b.x - y)) , ((b.y - x)))+45){
      b.hp-=power;}}
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
