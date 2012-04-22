class Heart {
  double x;
  double y;
  ImageElement imgtag;
  
  Heart(String image_source) {
    x = 300.0;
    y = 500.0;
    
    imgtag = new Element.tag('img');
    imgtag.attributes['src'] = image_source;
    document.body.nodes.add(imgtag);
    Util.abs(imgtag);
    Util.pos(imgtag, x, y);
    imgtag.width = 50;
  }  
   setPos(){
   
    Util.pos(imgtag, x, y);
  }
}
