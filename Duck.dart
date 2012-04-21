class Duck {
  
  double x;
  double y;
  Element elem;
  
  Duck(String img) {
    x = 300.0;
    y = 100.0;
    
    
    
    elem = new Element.tag('img');
    document.body.nodes.add(elem);
    Util.abs(elem);
    Util.pos(elem, x, y);
    
  }
  
  move() {
    y += 10;
    Util.pos(elem, x, y);
  }
  
}
