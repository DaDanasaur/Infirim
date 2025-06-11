class inventory extends place {
  boolean looting = false;
  item[] loot;
  int boxSize = 200;

  inventory() {
    inplace = false;
    loot = new item[10]; // Assuming 10 loot items, adjust as needed
    for (int i = 0; i < loot.length; i++) {
      loot[i] = null; // Initialize loot array with null items
      selected = new ArrayList<Integer>(2);
    }
  }

  void display() {
    background(0);
    boxSize = 200;
    float xOffsetLeft = width / 4; // Left side for inventory
    float yOffset = height / 4 ; // Start position for the first row

    // Display player's inventory in two columns on the left side
    for (int i = 0; i < 8; i++) {
      float xLeft = xOffsetLeft + (i % 2) * (boxSize + 20); // 2 columns on the left
      float yLeft = yOffset + (i / 2) * (boxSize + 20); // Increase y for new rows
      fill(100);
      rectMode(CENTER);
      rect(xLeft, yLeft, boxSize, boxSize);
      textAlign(CENTER, CENTER);
      if (you.inv[i] != null) {
        fill(0);
        yLeft-=50;
        text(you.inv[i].name, xLeft, yLeft);
        if (you.inv[i] instanceof weapon) {
          text(((weapon) you.inv[i]).power, xLeft - 80, yLeft + 80);
          text(((weapon) you.inv[i]).level, xLeft, yLeft + 100);
          if (you.inv[i] instanceof bow) {
            text(((bow) you.inv[i]).shotspeed, xLeft + 80, yLeft + 80);
          } else {
            text(((weapon) you.inv[i]).range, xLeft + 80, yLeft + 80);
          }
        }
        you.inv[i].x = xLeft;
        you.inv[i].y = yLeft + 50;
        you.inv[i].direction = 135;
        you.inv[i].display();
      }
    }
  }

  void display(item[] nuloot) {
    display();
    loot = nuloot;
    boxSize = 200;
    float xOffsetRight = 3 * width / 4; // Right side for loot
    float yOffset = height / 4; // Start position for the first row

    // Display loot on the right side
    for (int i = 0; i < loot.length; i++) {
      float xRight = xOffsetRight + (i % 2) * (boxSize + 20); // 2 columns on the right
      float yRight = yOffset + (i / 2) * (boxSize + 20); // Increase y for new rows
      rectMode(CENTER);
        fill(100);
      rect(xRight, yRight, boxSize, boxSize);
      textAlign(CENTER, CENTER);
      if (loot[i] != null) {
     fill(0);
     yRight -= 50;
        text(loot[i].name, xRight, yRight);
        if (loot[i] instanceof weapon) {
          text(((weapon) loot[i]).power, xRight - 80, yRight + 80);
          text(((weapon) loot[i]).level, xRight, yRight + 100);
          if (loot[i] instanceof bow) {
            text(((bow) loot[i]).shotspeed, xRight + 80, yRight + 80);
          } else {
            text(((weapon) loot[i]).range, xRight + 80, yRight + 80);
          }
        }
        loot[i].x = xRight;
        loot[i].y = yRight + 50;
        loot[i].direction = 135;
        loot[i].display();
      }
    }
  }

  void run() {
    if (looting == true) {
      display(loot);
    } else {
      display();
    }
    if (selected.size() == 2){
      if (selected.get(0)>7){
        if (selected.get(1)>7){
          swapItems(loot, selected.get(0)%8,loot,selected.get(1)%8);
        }else {swapItems(loot, selected.get(0)%8, you.inv, selected.get(1));}}
        else if (selected.get(1)>7){ swapItems(you.inv,selected.get(0), loot, selected.get(1)%8);}
        else{swapItems(you.inv,selected.get(0)%10, you.inv, selected.get(1)%10);}
        selected = new ArrayList<Integer>(2);
    }
  }

  void selectItem(float mouseX, float mouseY) {
    float xOffsetLeft = width / 4; // Left side for inventory
    float xOffsetRight = 3 * width / 4; // Right side for loot
    float yOffset = height / 4; // Start position for the first row

    // Check selection in player's inventory
    for (int i = 0; i < 8; i++) {
      float xLeft = xOffsetLeft + (i % 2) * (boxSize + 20); // 2 columns on the left
      float yLeft = yOffset + (i / 2) * (boxSize + 20); // Increase y for new rows
      if (dist(mouseX, mouseY, xLeft, yLeft) < boxSize / 2) {
        selected.add(i);
      }
    } 

    // Check selection in loot
    for (int i = 0; i < loot.length; i++) {
      float xRight = xOffsetRight; // 2 columns on the right
      float yRight = yOffset + (i / 2) * (boxSize + 20); // Increase y for new rows
      if (dist(mouseX, mouseY,xRight, yRight) < boxSize / 2) {
        selected.add(i+8);
        
      }
    }
  }
}
