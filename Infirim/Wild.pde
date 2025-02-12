class wild extends place{
ArrayList<PVector> caves;
ArrayList<PVector> cities;
wild(int cave ,int city){
caves = new ArrayList<PVector>(cave);
PVector v= new PVector(0,0);
  for (int i=0;i<cave;i++){caves.add(v);}
cities = new ArrayList<PVector>(city);
  for (int i=0;i<city;i++){cities.add(v);}}
void generate(){
  for (int i=0;i<caves.size();i++){
  PVector randV = new PVector(random(-10000,10000),random(-1200,2100));
  caves.set(i, randV);}
  for (int i=0;i<cities.size();i++){
  PVector randV = new PVector(random(-10000,10000),random(-1200,2100));
  cities.set(i, randV);
print(randV.x);}
}
void display(){
      background(135, 206, 235); // Sky color

    // Camera translation
    translate(width / 2 - you.x, height / 2 - you.y);

    // Generate and display terrain
    for (int x = you.x / blockSize - 50; x <= you.x / blockSize + 50; x++) {
      for (int y = you.y / blockSize - 100; y <= you.y / blockSize + 50; y++) {
        float noiseValue = noise(x * noiseScale, y * noiseScale);
        float terrainHeight = noiseValue * height;

        // Choose a color based on terrain height
        if (terrainHeight > height/2) {
          fill(34, 139, 34); // Darker green for higher terrain
        } else {
          fill(50, 205, 50); // Lighter green for lower terrain
        }

        // Draw terrain block
        rect(x * blockSize, height - terrainHeight, blockSize, terrainHeight*3);
      }
    }
    for (int i=0;i<caves.size();i++){
  PVector V = caves.get(i);
  fill(0);
  circle(V.x,V.y,100);}
   for (int i=0;i<cities.size();i++){
  PVector V = cities.get(i);
  fill(100,200,0);
  circle(V.x,V.y,200);}
}

}
