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
  
  
}
