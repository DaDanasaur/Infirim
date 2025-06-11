
class bow extends weapon {
 
    bow(int spr, int str, String nm) {
      name = nm;
    power = str;
  shotspeed = spr;
  rarity=1;
   if(name == "Stone Bow"){power*=1.4;shotspeed*=.8;rarity=2;}
   if(name == "Good Bow"){power*=1.25;shotspeed*=1.25; rarity=2;}
   if(name == "Compound Bow"){power*=1.1;shotspeed*=1.4; rarity=2;}
  if(name == "Mongolian Bow"){power*=1.4;shotspeed*=1.25; rarity=3;Fast = true;}
   if(name == "Crossbow"){power*=3;shotspeed*=2; rarity=3; cooldown = 2; Slow= true;}
    if(name == "Silver Bow"){power*=1.5;shotspeed*=1.6; rarity=3;}
     if(name == "Poison Bow"){power*=1.3;shotspeed*=1.2; rarity=3; poison=true;}
 
 
 }
void display() {
    drawBow(); // Draw the bow
  }
  
  void drawBow() {  
    float aim=direction+PI/2;
    float bowRadius = 20;
    if (name == "Silver Bow"||name == "Crossbow"){bowRadius = 25;}
    if (name == "Mongolian Bow"){bowRadius = 16;}
    float bowX1 = x + bowRadius * cos(PI + aim);
    float bowY1 = y + bowRadius * sin(PI + aim);
    float bowX2 = x + bowRadius * cos(TWO_PI + aim);
    float bowY2 = y + bowRadius * sin(TWO_PI + aim);
    // Draw the bow
    if(name == "Crossbow"){stroke(139,69,19); strokeWeight(2);
     line(x,y,x+bowRadius*cos(aim),y+bowRadius*sin(aim));}
    noFill();
    stroke(0);
    if(name == "Stone Bow"){stroke(150);}
    if(name == "Silver Bow"){stroke(200);}
    if(name == "Poison Bow"){stroke(200,15,200);}
    if(name == "Good Bow" || name == "Crossbow"){stroke(139,69,19);}
    if(name == "Compound Bow"){stroke(196,164,132);}
    
    strokeWeight(2);
    if  (name == "Stone Bow" || name == "Mongolian bow" || name == "Crossbow")
   {strokeWeight(4);}
    arc(x, y, bowRadius*2, bowRadius*2, PI+aim, TWO_PI+aim);
    stroke(0);
    if(name == "Poison Bow"){stroke(64,253,20);}
    strokeWeight(2);
    // Draw the bowstring
    line(bowX1, bowY1, bowX2, bowY2);
    if(name == "Silver Bow"){line(bowX1+5*cos(PI+aim), bowY1+5*sin(PI+aim), bowX2+5*cos(TWO_PI+aim), bowY2+5*sin(TWO_PI+aim));}
}
  
  
  
  

void attack(){
arrow  a = new arrow();
a.fired(this);
arrows.add(a);
}
}
