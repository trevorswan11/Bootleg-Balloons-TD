public class Map {
 final int NORTH = 0;
 final int EAST = 1;
 final int SOUTH = 2;
 final int WEST = 3;
 
 final int[][] directions = new int[][]{{410,0},{410, 60},{670,60},{670,225},{270,225},{270,95},{115,95},{115,350},{470,350},{470,440},{220,440},{220,570},{670,570},{670,600}};
 PImage image;
 PImage path; 
 
 public Map() {
   image = loadImage("snow_map.jpg");  
   image.resize(800,600);
   path = loadImage("snow_map_path.jpg");
   path.resize(800,600);   
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
   stroke(#FF0000);
   for (int i = 0; i < directions.length-1; i++) {
     line(directions[i][0],directions[i][1],directions[i+1][0],directions[i+1][1]);  
   }
 }

 
}
