class Logo {
  double x;
  double y;
  Element imgtag;
  
  Logo(String image_source) {
    x = 300.0;
    y = 400.0;
    
    imgtag = new Element.tag('img');
    imgtag.attributes['src'] = image_source;
    document.body.nodes.add(imgtag);
    Util.abs(imgtag);
    Util.pos(imgtag, x, y);
  }
}
