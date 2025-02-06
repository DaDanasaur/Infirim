//Dan Fun Project infirim
player you;
void setup(){
you = new player();
size(1000,1000);}
void draw(){you.move();
you.display();}
 void keyPressed() {
 if(key == 'w'){you.direction=90;}
 if(key == 'd'){you.direction=0;}
 if(key == 's'){you.direction=270;}
 if(key == 'a'){you.direction=180;}
 if(key == ' '){you.direction=1;}
 }
