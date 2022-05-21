public class Map {
 PImage image;
 PImage path; 
 int corners; 
 
 public Map() {
   image = loadImage("snow_map.jpg");  
   image.resize(800,600);
   corners = 12;
   path = loadImage("snow_map_path.jpg");
   path.resize(800,600);
 }
   
 int[][] calculateDirections(int prevX, int prevY) {
   int[][] directions = new int[corners][2];
   
   for (int corner = 0; corner < directions.length; corner++) {
     boolean change = false;
     int index = 0;
   }
     
   return directions;
 }
 
 int[] getOneDirection(int x, int y, int interval, int prevX, int prevY) {
   color north = path.get(x, y+interval);
   color east = path.get(x+interval, y);
   color south = path.get(x, y-interval);
   color west = path.get(x-interval, y);
   
   
   
   //println("" + north + " " + east + " " + south + " " + west);
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

  
  
}
