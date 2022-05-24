public class balloonList {
  Balloon first, last;
  
  balloonList() {
    first = new Balloon();
    last = new Balloon();
    
    first.next = last;
    last.prev = first;
  }
}
