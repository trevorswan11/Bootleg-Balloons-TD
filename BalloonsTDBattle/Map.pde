public class Map { 
 final int[][] directions = new int[][]{{410,0},{410, 60},{670,60},{670,225},{270,225},{270,95},{115,95},{115,350},{470,350},{470,440},{220,440},{220,570},{670,570},{670,600}};
 PImage image;
 
 public Map() {
   image = loadImage("snow_map.jpg");  
   image.resize(800,600);
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
  
 void showDirections() {
   stroke(#FF0000);
   for (int i = 0; i < directions.length-1; i++) {
     line(directions[i][0],directions[i][1],directions[i+1][0],directions[i+1][1]);  
   }
 }

 
}
