
class bow extends weapon {
  int shotspeed;
 
    bow(int spr, int str) {
    power = str;
  shotspeed = spr;}
void display() {
    drawBow(); // Draw the bow
  }
  
  void drawBow() {  
    float aim=direction+PI/2;
    float bowRadius = 20;
    float bowX1 = x + bowRadius * cos(PI + aim);
    float bowY1 = y + bowRadius * sin(PI + aim);
    float bowX2 = x + bowRadius * cos(TWO_PI + aim);
    float bowY2 = y + bowRadius * sin(TWO_PI + aim);
    // Draw the bow
    noFill();
    stroke(0);
    strokeWeight(2);
    arc(x, y, 40, 40, PI+aim, TWO_PI+aim);
    
    // Draw the bowstring
    line(bowX1, bowY1, bowX2, bowY2);
  }
void attack(){
arrow  a = new arrow();
a.fired(this);
arrows.add(a);
}
}
