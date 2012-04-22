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
  
  loselogo(String image_source) {
    imgtag.width = 300;
    imgtag.attributes['src'] = image_source;
    document.body.nodes.add(imgtag);
    Util.abs(imgtag);
    x = (window.innerWidth / 2) - (imgtag.height / 2);
    y = (window.innerHeight / 1.3) - (imgtag.width / 2);
    Util.pos(imgtag, x, y);
  }
}
