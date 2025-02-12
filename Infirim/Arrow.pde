class arrow extends item{
  int count;
  int r=3;
  int speed;
  int power;
  boolean active = true;
  arrow(int c){
  count = c;}
  arrow(){}
  void fired(bow b){
    direction = b.direction;
    speed = b.shotspeed;
    x=b.x;
    y=b.y;
    power = b.power;
  }
  void move()  {  
    if (active== true)
     {x += speed * cos(direction);
        y += speed * sin(direction);
     for(being b: beings){if (b !=null){ if(circleCircleIntersect(b,this)== true){active = false;
     b.hp-=power; power=0;
   }}}}
   if(x>-10000 && x< 10000 && y >-10000 && y < 10000 ){
active = true;}else{active = false;}
    }
  void display(){
    fill (100);
    circle(x,y,6);}}
  
