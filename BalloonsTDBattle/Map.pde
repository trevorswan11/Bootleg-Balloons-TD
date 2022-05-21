public class Map {
 PImage image;
 PImage path; 
 ArrayList<int[]> directions;
 
 public Map() {
   image = loadImage("snow_map.jpg");  
   image.resize(800,600);
   path = loadImage("snow_map_path.jpg");
   path.resize(800,600);
   int[] start = new int[]{400, 0};
   directions.add(start);
   calculateDirections(400, 0, 400, 10);
 }
   
 void calculateDirections(int currentX, int currentY, int prevX, int prevY) {
   directions = new ArrayList<int[]>();
   int index = 1;
   while (currentX < width-10 && currentY < height-10) {
     directions.add(getOneDirection(currentX, currentY, prevX, prevY, 10));
     prevX = currentX;
     prevY = currentY;     
     currentX = directions.get(index)[0];
     currentY = directions.get(index)[1];
     index++;
   }
 }
 
 int[] getOneDirection(int x, int y, int prevX, int prevY, int interval) {
   color north = path.get(x, y+interval);
   color east = path.get(x+interval, y);
   color south = path.get(x, y-interval);
   color west = path.get(x-interval, y);
   
   if (prevX < x) {
     west = 255;
   } else if (prevX > x) {
     east = 255;
   } else if (prevY < y) {
     north = 255;
   } else if (prevY > y) {
     south = 255;
   }
   
   int[] cords = new int[2];
   
   if (north == 0) {
     cords = new int[]{x, y-interval};  
   } else if (east == 0) {
     cords = new int[]{x+interval, y};
   } else if (south == 0) {
     cords = new int[]{x, y+interval};
   } else if (west == 0) {
     cords = new int[]{x-interval, y};
   }
   
   return cords;
   
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
