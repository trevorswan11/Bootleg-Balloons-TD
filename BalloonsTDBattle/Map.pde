public class Map {
 final int NORTH = 0;
 final int EAST = 1;
 final int SOUTH = 2;
 final int WEST = 3;
 
 final int INTERVAL = 40;
 final int[][] nesw = new int[][]{{0, INTERVAL*-1},{INTERVAL,0},{0,INTERVAL},{INTERVAL*-1,0}};
 final int[][] directions = new int[][]{{410,0},{410, 60},{660,60},{660,225},{270,225},{270,95},{115,95},{115,350},{470,350},{470,440},{220,440},{220,570},{670,570},{670,595}};
 PImage image;
 PImage path; 
 //int[][] directions = new int[13][2];
 
 public Map() {
   image = loadImage("snow_map.jpg");  
   image.resize(800,600);
   path = loadImage("snow_map_path.jpg");
   path.resize(800,600);
   int[] start = new int[]{410,0};
   //directions[0] = start;
   
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
   
 void calculateDirections(int currentX, int currentY, int prevX, int prevY) {
   int currentCompass = compass(currentX, currentY, prevX, prevY);
   for (int index = 1; index < directions.length; index++) {
     int nextCompass = currentCompass;
     while (currentCompass == nextCompass) {       
       prevX = currentX;
       prevY = currentY;
       currentX = (int)(currentX+(nesw[currentCompass][0])*1.25);
       currentY = (int)(currentY+(nesw[currentCompass][1])*1.25);
     
       color c = path.get(currentX, currentY);
       println(red(c));
       if (red(c) == 255) {
         if (currentCompass % 2 == 0) {
           color east = path.get(prevX+nesw[EAST][0],prevY+nesw[EAST][1]);
           color west = path.get(prevX+nesw[WEST][0],prevY+nesw[WEST][1]);
           if (red(east) == 0) {
             currentX = prevX+nesw[EAST][0];
             currentY = prevY+nesw[EAST][1];
             nextCompass = EAST;
           } else {
             currentX = prevX+nesw[WEST][0];
             currentY = prevY+nesw[WEST][1];
             nextCompass = WEST;  
           }
         } else {
           color north = path.get(prevX+nesw[NORTH][0],prevY+nesw[NORTH][1]);
           color south = path.get(prevX+nesw[SOUTH][0],prevY+nesw[SOUTH][1]);
           if (red(north) == 0) {
             currentX = prevX+nesw[NORTH][0];
             currentY = prevY+nesw[NORTH][1];
             nextCompass = NORTH;
           } else {
             currentX = prevX+nesw[SOUTH][0];
             currentY = prevY+nesw[SOUTH][1];
             currentCompass = SOUTH;
           }
         }
         directions[index] = new int[]{prevX, prevY};
       }

     }
     println("currentCompass: " + currentCompass);
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
