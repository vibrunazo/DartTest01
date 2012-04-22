class Bug {
  
  double x;
  double y;
  double speed;
  test01 game;
  
  static final List<String> bugtypeimgs = const  ["img/bug01-01.png", "img/bug01-02.png",
                                                  "img/bug02-01.png", "img/bug02-02.png",    
                                                  "img/bug03-01.png", "img/bug03-02.png",    
                                                  "img/bug04-01.png", "img/bug04-02.png"];    
  ImageElement imgtag;
  int imgindex;
  int imganimate;
  double imgdblindex, bugtype;

  
  Bug(this.game, String image_source) {
    x = Math.random() * window.innerWidth;
    y = 100.0;
    double speedbonus = Math.min((game.time/5).floor(), 10);
    speed = 2 + Math.random() * (2 + speedbonus) + speedbonus;
    
    imgtag = new Element.tag('img');
    imgindex = 0;
    bugtype = Math.random() * 4;
    bugtype = bugtype % 4;
    imgindex = (bugtype * 2).toInt();
    imgtag.attributes['src'] = bugtypeimgs[imgindex];
    imganimate = 1;
//    window.alert("imgindex="+imgindex);

    document.body.nodes.add(imgtag);
    Util.abs(imgtag);
    Util.pos(imgtag, x, y);
    imgtag.on.click.add((e) => click());
    imgtag.width = 50;
    window.setInterval(() => move(), 50);
  }
  
  move() {
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
    if (imganimate % 4 == 0) {
      if (imgindex == 0) {
        imgindex = 1;
      } else if (imgindex == 1) {
        imgindex = 0;
      } else if (imgindex == 2) {
        imgindex = 3;
      } else if (imgindex == 3) {
        imgindex = 2;
      } else if (imgindex == 4) {
        imgindex = 5;
      } else if (imgindex == 5) {
        imgindex = 4;
      } else if (imgindex == 6) {
        imgindex = 7;
      } else if (imgindex == 7) {
        imgindex = 6;
      }
//    window.alert("imgindex="+imgindex);
    
      imganimate = 0;
    }
    imgtag.attributes['src'] = bugtypeimgs[imgindex];
    imganimate = imganimate + 1;
    Util.pos(imgtag, x, y);
  }

  click() {
    game.score += 10;
    print("Score: ${game.score}");
    document.query('#score').text = "${game.score}";
    
    game.killBug(this);
    
  }
  
  kill() {
    imgtag.remove();
  }
  
  
}
