class wild extends place {
  ArrayList<PVector> caves;
  ArrayList<PVector> cities;
  boolean inwilds = true;
  float[][] terrain;
  int terrainWidth = 10000; // Width of the terrain in blocks
  int terrainHeight = 10000; // Height of the terrain in blocks
  int blockSize = 20; // Size of each block
  float noiseScale = 0.05f; // Noise scale for terrain generation
  PGraphics terrainCache; // To cache the rendered terrain

  wild(int cave, int city) {
    caves = new ArrayList<>(cave);
    for (int i = 0; i < cave; i++) {
      caves.add(new PVector(0, 0));
    }
    cities = new ArrayList<>(city);
    for (int i = 0; i < city; i++) {
      cities.add(new PVector(0, 0));
    }

    terrain = new float[terrainWidth][terrainHeight];
    terrainCache = createGraphics(terrainWidth, terrainHeight);
  }

  void generate() {
    for (int i = 0; i < caves.size(); i++) {
      PVector randV = new PVector(random(0, 10000), random(0, 2100));
      caves.set(i, randV);
    }
    for (int i = 0; i < cities.size(); i++) {
      PVector randV = new PVector(random(0, 10000), random(-1200, 2100));
      cities.set(i, randV);
    }

    // Generate terrain heights and cache the rendered terrain
    terrainCache.beginDraw();
    terrainCache.background(135, 206, 235); // Sky color
    for (int x = 0; x < terrainWidth; x++) {
      for (int y = 0; y < terrainHeight; y++) {
        float noiseValue = noise(x * noiseScale, y * noiseScale);
        terrain[x][y] = noiseValue * height;

        // Choose a color based on terrain height
        if (terrain[x][y] > height / 3) {
          terrainCache.fill(34, 139, 34); // Darker green for higher terrain
        } else {
          terrainCache.fill(50, 205, 50); // Lighter green for lower terrain
        }

        // Draw terrain block
        terrainCache.rect(x * blockSize, y * blockSize, blockSize, blockSize * 2);
      }
    }
    terrainCache.endDraw();
  }

  void display() {
    if (inwilds) {
         background(0);
      // Camera translation
      translate(width / 2 - you.x, height / 2 - you.y);

      // Display cached terrain
      image(terrainCache, 0, 0);

      // Display caves
      for (PVector cave : caves) {
        fill(0);
        ellipse(cave.x, cave.y, 100, 100);
      }

      // Display cities
      for (PVector city : cities) {
        fill(255, 220, 0);
        ellipse(city.x, city.y, 200, 200);
      }
    }
  }
}
