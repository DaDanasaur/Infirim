class cave extends place{
  int x;
  int y;
room[] rooms;
int roomon;
cave(int X, int Y){
rooms = new room[int(random(3,5))];
int roomon = 0;
x=X;
y=Y;
}
void newroom(){
roomon +=1;
if(roomon == rooms.length){
rooms[roomon-1].generateFinal();}
else{
rooms[roomon-1].generate();}
}

void display(){
//make walls of cave
//exit corridor
//make black
//show room amount at the top of the screen
}
void enterroom(){
//check if in exit corridor
//if so(for rest of function) remove all enemies
//check if last room
//if so, turn inplace to false, set it to true for inWilds, set X and Y to the X and Y of the cave and generate exit loot for player,
//else, call newroom and set the player x and y to the entrance of the cave room
}
void run(){
//call enterroom
//call display
}


}
