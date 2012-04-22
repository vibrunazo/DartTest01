class Logo {
  double x;
  double y;
  ImageElement imgtag;
  
  Logo(String image_source) {
    x = (window.innerWidth / 2) - 25; // 300.0;
    y = (window.innerHeight) - 150; // 400.0;
    
    imgtag = new Element.tag('img');
    imgtag.attributes['src'] = image_source;
    document.body.nodes.add(imgtag);
    Util.abs(imgtag);
    Util.pos(imgtag, x, y);
    imgtag.width = 50;
  }
}
