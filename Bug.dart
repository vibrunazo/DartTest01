class Bug {
  
  double x;
  double y;
  Element imgtag;
  
  Bug(String image_source) {
    x = 300.0;
    y = 100.0;
    
    imgtag = new Element.tag('img');
    imgtag.attributes['src'] = image_source;
    document.body.nodes.add(imgtag);
    Util.abs(imgtag);
    Util.pos(imgtag, x, y);
    imgtag.on.click.add((e) => imgtag.remove());
  }
  
  move() {
    y += 10;
    Util.pos(imgtag, x, y);
  }
  
}
