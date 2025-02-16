class inventory extends place {
  boolean looting = false;
  item[] loot;
  int boxSize = 200;

  inventory() {
    inplace = false;
    loot = new item[10]; // Assuming 10 loot items, adjust as needed
    for (int i = 0; i < loot.length; i++) {
      loot[i] = null; // Initialize loot array with null items
    }
  }

  void display() {
    background(0);
    boxSize = 200;
    float angleStep = 360.0 / 8;
    for (int i = 0; i < 8; i++) {
      float currentAngle = i * angleStep;
      float x = width / 2 + cos(radians(currentAngle)) * 300;
      float y = height / 2 + sin(radians(currentAngle)) * 300;
      rectMode(CENTER);
      rect(x, y, boxSize, boxSize);
      textAlign(CENTER, CENTER);
      if (you.inv[i] != null) {
        fill(0);
        text(you.inv[i].name, x, y);
        if (you.inv[i] instanceof weapon) {
          text(((weapon) you.inv[i]).power, x - 80, y + 80);
          text(((weapon) you.inv[i]).level, x, y + 100);
          if (you.inv[i] instanceof bow) {
            text(((bow) you.inv[i]).shotspeed, x - 80, y + 80);
          } else {
            text(((weapon) you.inv[i]).range, x - 80, y + 80);
          }
        }
        you.inv[i].x = x;
        you.inv[i].y = y + 50;
        you.inv[i].direction = 135;
        you.inv[i].display();
      }
    }
  }

  void display(item[] nuloot) {
    background(0);
    loot = nuloot;
    boxSize = 200;
    float xOffsetLeft = width / 4; // Left side for loot
    float yOffset = height / 4; // Start position for the first row

    for (int i = 0; i < loot.length; i++) {
      float xLeft = xOffsetLeft + (i % 2) * (boxSize + 20); // 2 columns on the left
      float yLeft = yOffset + (i / 2) * (boxSize + 20); // Increase y for new rows
      rectMode(CENTER);
      rect(xLeft, yLeft, boxSize, boxSize);
      textAlign(CENTER, CENTER);
      if (loot[i] != null) {
        fill(0);
        text(loot[i].name, xLeft, yLeft);
        if (loot[i] instanceof weapon) {
          text(((weapon) loot[i]).power, xLeft - 80, yLeft + 80);
          text(((weapon) loot[i]).level, xLeft, yLeft + 100);
          if (loot[i] instanceof bow) {
            text(((bow) loot[i]).shotspeed, xLeft - 80, yLeft + 80);
          } else {
            text(((weapon) loot[i]).range, xLeft - 80, yLeft + 80);
          }
        }
        loot[i].x = xLeft;
        loot[i].y = yLeft + 50;
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
  }

  void selectItem(float mouseX, float mouseY) {
    float centerX = width / 2;
    float centerY = height / 2;
    float angleStep = 360.0 / 8;

    for (int i = 0; i < 8; i++) {
      float currentAngle = i * angleStep;
      float x = centerX + cos(radians(currentAngle)) * 300;
      float y = centerY + sin(radians(currentAngle)) * 300;
      if (dist(mouseX, mouseY, x, y) < boxSize / 2) {
        println("Selected: " + you.inv[i].name);
        break;
      }
    }
  }
}
