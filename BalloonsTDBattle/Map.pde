public class Map {
 final int NORTH = 0;
 final int EAST = 1;
 final int SOUTH = 2;
 final int WEST = 3;
 
 final int INTERVAL = 40;
 final int[][] nesw = new int[][]{{0, INTERVAL*-1},{INTERVAL,0},{0,INTERVAL},{INTERVAL*-1,0}};
 PImage image;
 PImage path; 
 int[][] directions = new int[13][2];
 
 public Map() {
   image = loadImage("snow_map.jpg");  
   image.resize(800,600);
   path = loadImage("snow_map_path.jpg");
   path.resize(800,600);
   int[] start = new int[]{400,10};
   directions[0] = start;
 }
 
  void printDirections() {
   for (int i = 0; i < directions.length; i++) {
     print("current " + i + ":");
     for (int j = 0; j < directions[i].length; j++) {
       print(" " + directions[i][j]);   
     }
     println(" ");
   }
 }
    
 int compass(int currentX, int currentY, int prevX, int prevY) {
   if (prevX < currentX) {
     return EAST;
   } else if (prevX > currentX) {
     return WEST;
   } else if (prevY < currentY) {
     return SOUTH;
   } else {
     return NORTH;
   }
 }
    
 int[] getDirection(int index) {
   return directions[index];  
 }
 
 int getDirectionsSize() {
   return directions.length;  
 }
  
 PImage getImage() {
   return image;
 }
 
 PImage getPath() {
   return path;  
 }
 
  void display() {
   image(image, 0, 0);  
 }
 
 void displayPath() {
   image(path, 0, 0);  
 }
 
 void displayPath(int x, int y) {
   image(path, x, y);  
 }
 
 void showDirections() {
   stroke(#76FF00);
   for (int i = 0; i < directions.length-1; i++) {
     line(directions[i][0],directions[i][1],directions[i+1][0],directions[i+1][1]);  
   }
 }

 
}
