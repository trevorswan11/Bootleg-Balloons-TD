public class balloonList {
  Balloon first, last;
  
  balloonList() {
    first = new Balloon();
    last = new Balloon();
    
    first.next = last;
    last.prev = first;
  }
  
  void add(Balloon balloon) {
    balloon.prev = last;
    balloon.next.prev = balloon;
    last.next = balloon;
    balloon.prev = first; 
  }
  
  Balloon getBalloonAt(int x, int y) {
    Balloon current = first;
    Balloon answer = null;
    while (current != null) {
      float distance = dist(x, y, current.currentX, current.currentY);
      float radius = current.size;
      if (distance-radius <= 0) {
        answer = current;  
      }
      current = current.next;
    }
    return answer;
  }
  
  
}
