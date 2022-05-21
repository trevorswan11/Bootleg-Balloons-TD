public class Map {
 PImage image;
 int turns; 
 
 public Map() {
   image = loadImage("snow_map.jpg");  
   image.resize(800,600);
 }
 
 void display() {
   image(image, 0, 0);  
 }
  
  
}
