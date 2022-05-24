public class balloonList {
  balloonNode first, last;
  
  balloonList() {
    first = null;
    last = null;
    
    first.next = last;
    last.prev = first;
  }
  
  //add to the end of the list
  void add(Balloon b) { 
    balloonNode balloon= new balloonNode(b);
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
  
  void delete(Balloon target) {
    if(target != null && target != first && target != last) {
      target.prev.next = target.next;
      target.next.prev = target.prev;
    }
  }
  
  Boolean isEmpty() {
    return (last == null && first == null);  
  }
  
  
}
