public class Map {
 final int NORTH = 0;
 final int EAST = 1;
 final int SOUTH = 2;
 final int WEST = 3;
 
 final int INTERVAL = 10;
 final int[][] nesw = new int[][]{{0, INTERVAL*-1},{INTERVAL,0},{0,INTERVAL},{INTERVAL*-1,0}};
 PImage image;
 PImage path; 
 int[][] directions = new int[13][2];
 //ArrayList<int[]> directions = new ArrayList<int[]>();
 
 public Map() {
   image = loadImage("snow_map.jpg");  
   image.resize(800,600);
   path = loadImage("snow_map_path.jpg");
   path.resize(800,600);
   int[] start = new int[]{400, 0};
   //directions.add(start);
   directions = new int[13][2];
   directions[0] = start;
   calculateDirections(400, 0, 400, 10);
 }
   
 void calculateDirections(int currentX, int currentY, int prevX, int prevY) {
   int currentCompass = compass(currentX, currentY, prevX, prevY);
   int newCompass = currentCompass;
   for (int index = 0; index < directions.length; index++) {
     while (currentCompass != newCompass) {
       //if (currentCompass == NORTH) {
       //  prevY = currentY;
       //  currentY = currentY-INTERVAL;
       //} else if (currentCompass == EAST) {
       //  prevX = currentX;
       //  currentX = currentX+INTERVAL;
       //} else if (currentCompass == SOUTH) {
       //  prevY = currentY;
       //  currentY = currentY+INTERVAL;
       //} else {
       //  prevX = currentX;
       //  prevX = currentX-INTERVAL;
       //}
       
       prevX = currentX;
       prevY = currentY;
       currentX = currentX+nesw[currentCompass][0];
       currentY = currentY+nesw[currentCompass][1];
     
       color c = path.get(currentX, currentY);
       if (red(c) == 255) {
         if (currentCompass % 2 == 0) {
           color east = path.get(prevX+nesw[EAST][0],prevY+nesw[EAST][1]);
           color west = path.get(prevX+nesw[WEST][0],prevY+nesw[WEST][1]);
           if (red(east) == 0) {
             currentX = prevX+nesw[EAST][0];
             currentY = prevY+nesw[EAST][1];
             directions[index] = new int[]{currentX, currentY};
             newCompass = EAST;
           } else {
             currentX = prevX+nesw[WEST][0];
             currentY = prevY+nesw[WEST][1];
             directions[index] = new int[]{currentX, currentY};
             newCompass = WEST;  
           }
         } else {
           color north = path.get(prevX+nesw[SOUTH][0],prevY+nesw[EAST][1]);
           color south = path.get(prevX+nesw[SOUTH][0],prevY+nesw[WEST][1]);
           if (red(north) == 0) {
             currentX = prevX+nesw[NORTH][0];
             currentY = prevY+nesw[NORTH][1];
             directions[index] = new int[]{currentX, currentY};
             newCompass = NORTH;
           } else {
             currentX = prevX+nesw[SOUTH][0];
             currentY = prevY+nesw[SOUTH][1];
             directions[index] = new int[]{currentX, currentY};
             newCompass = SOUTH;
           }
         }
       }

     }
   }
   
   //int index = 1;
   //while (currentX < width-INTERVAL && currentY < height-INTERVAL) {
   //  directions.add(getOneDirection(currentX, currentY, prevX, prevY, INTERVAL));
   //  prevX = currentX;
   //  prevY = currentY;     
   //  currentX = directions.get(index)[0];
   //  currentY = directions.get(index)[1];
   //  index++;
   //}
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
 
 //int[] getDirection(int index) {
 //  return directions.get(index);  
 //}
 
 //int getDirectionsSize() {
 //  return directions.size();  
 //}
 
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

  
  
}
