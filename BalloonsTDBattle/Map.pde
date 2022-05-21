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
 
 void display() {
   image(image, 0, 0);  
 }
 
 void displayKey() {
     
 }
 
 int[][] calculateDirections(int startX, int startY) {
   int[][] directions = new int[corners][2];
   
   for (int corner = 0; corner < directions.length; corner++) {
     boolean change = false;
     int index = 0;
   }
     
   return directions;
 }
  
 PImage getImage() {
   return image;
 }
 
 PImage getPath() {
   return path;  
 }
  
  
}
