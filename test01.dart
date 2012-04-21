#import('dart:html');

#source('Util.dart');

class test01 {

  test01() {
  }

  void run() {
    write("Hello World!");
    
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML = message;
//    document.query("#img").attributes.dynamic = 20;
    
    var pic = new Element.tag('img');
//    var pic = new ImageElement();
//ImageElement pic2 = new ImageElement;
//    pic.classes.add('avatar');
//    pic.classes.toggle('main');

    pic.attributes['src'] = 'img/hi00.png';
//    {
//      pic.testando;
//    }
    
    
    // checked mode só funciona no dartium?

    
    document.body.nodes.add(pic);
    
    pic.width = 100;
//    pic.on.click.add((e) => pic.width += 10);
    Util.abs(pic);
//    pic.on.click.add((e) => Util.pos(pic, 300.0, 300.0));
//    pic.on.click.add((e) => pic.remove());
    
//    double x = 200.0; double y = 100.00;
//    window.setInterval(() => Util.pos(pic, x, y+=10), 50);
//    Util.pos(pic, 300.0, 300.0);
    
    document.queryAll('img').forEach((el) {
      el.on.click.add((e) => print('Person clicked'));
    });
  }
}


void main() {
  new test01().run();
}
