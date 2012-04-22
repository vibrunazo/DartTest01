class Icon {
  
  double x;
  double y;
  double speed;
  ImageElement imgtag;
  test01 game;
  
  Icon(this.game, String image_source) {
    x = Math.random() * 600;
    y = 100.0;
    speed = 4 + Math.random() * 3;
    
    imgtag = new Element.tag('img');
    imgtag.attributes['src'] = image_source;
    document.body.nodes.add(imgtag);
    Util.abs(imgtag);
    Util.pos(imgtag, x, y);
    imgtag.on.click.add((e) => click());
    imgtag.width = 50;
    window.setInterval(() => move(), 50);
  }
  
  move() {
    y += speed;
     
    Util.pos(imgtag, x, y);
  }
  
  click() {
    window.alert("NULL POINTER EXCEPTION!");
    
    game.lose();
  }
  
  kill() {
    imgtag.remove();
  }
  
  
}
