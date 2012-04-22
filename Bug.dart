class Bug {
  
  double x;
  double y;
  double speed;
  ImageElement imgtag;
  test01 game;
  
  Bug(this.game, String image_source) {
    x = Math.random() * 600;
    y = 100.0;
    double speedbonus = Math.min((game.time/5).floor(), 10);
    speed = 2 + Math.random() * (2 + speedbonus) + speedbonus;
    
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
/*    if (Math.x - game.logo.x) {
      return;
    }
    if (y + 10 < game.logo.y) {
      return;
    }*/
    if (game.logo.x > x) {
      x += speed;
    }
    if (game.logo.x < x) {
      x -= speed;
    }
    if (game.logo.y > y) {
      y += speed;
    }  
    if (game.logo.y < y) {
      y -= speed;
    }      
    Util.pos(imgtag, x, y);
  }
  
  click() {
    game.score += 10;
    print("Score: ${game.score}");
    document.query('#score').text = "${game.score}";
    
    kill();
  }
  
  kill() {
    imgtag.remove();
  }
  
  
}
