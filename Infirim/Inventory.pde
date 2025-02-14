class inventory extends place{
boolean looting = false;
inventory(){
inplace = false;}

void display(){
//make 8 boxes
//display contents of the boxes(create sprites)
//display stats of items
}//inventory

void display(item[] loot){
looting = true;
//make 8 boxes to the left and 2 two the right(new things)
//display contents of boxes
//display stats of items
}//looting

void run(){
//see if two items are selected(add code to mouseclicked for selected to be a new array containing the indexes and arrays of the selected values)
//see if you can swap the two items
//if you can swap the items, swap them
if (looting==true){
//display the looting inventory
}
else{
//display the normal inventory
}
}
}
//Alter enemy code to go into inventory, generate loot, display with the loot on death
//Change draw and mouseclicked to have a massive if inventory.inplace == true loop around them(after death loop for draw)
