class Icon {

  static final List<String> iconimgs = const  ["img/play01.png", "img/play02.png"];  
  
  double x;
  double y;
  double inix;
  double speed;
  ImageElement imgtag;
  int moveframe = 0;
  test01 game;
  
  Icon(this.game) {
    x = Math.random() * 600;
    y = 100.0;
    inix = x;
    speed = 4 + Math.random() * 3;
    
    imgtag = new Element.tag('img');
    imgtag.attributes['src'] = iconimgs[0];
    document.body.nodes.add(imgtag);
    Util.abs(imgtag);
    Util.pos(imgtag, x, y);
    imgtag.on.click.add((e) => click());
    imgtag.width = 50;
    window.setInterval(() => move(), 50);
  }
  
  move() {
    y += speed;
    x = inix + Math.sin(moveframe/6)*50;
     
    Util.pos(imgtag, x, y);
    
    moveframe++;
    double i = ((moveframe/6)%2);
    int imgindex = i.toInt();
    imgtag.attributes['src'] = iconimgs[imgindex];
  }
  
  click() {
    game.lose("NULL POINTER EXCEPTION!");
  }
  
  kill() {
    imgtag.remove();
  }
  
  
}
