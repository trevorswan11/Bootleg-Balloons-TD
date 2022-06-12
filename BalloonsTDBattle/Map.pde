public class Map { 
  //starting, corner, and ending coordinates in directions 
 final int[][] directions = new int[][]{{410,0},{410, 60},{670,60},{670,225},{270,225},{270,95},{115,95},{115,350},{470,350},{470,440},{220,440},{220,570},{670,570},{670,600}};
 PImage image;
 PImage path; //replica of map with only 3 solid colors so program can read it to determine where to place monekys rather than the map displayed with ranging colors 
 
 public Map() { //only load in map once
   image = loadImage("snow_map.jpg");  
   image.resize(800,600);
   path = loadImage("snow_map_path.jpg");
   path.resize(800,600);
 }
 
 int[] getDirection(int index) {
   return directions[index];  
 }
 
 int getDirectionsSize() {
   return directions.length;  
 }
  
  void display() {
   image(image, 0, 0);  
  }

 void displayPath() {
   image(path, 0, 0);  
 }
 
 PImage getPath() {
   return path;  
 }


 
}
