#import('dart:html');

#source('Bug.dart');
#source('Logo.dart');
#source('Util.dart');

class test01 {

  double x = 300.0;
  double y = 100.0;
  int time = 0;
  
  List<Bug> bugs;
  Logo logo;
  
  int score = 0;
  
  test01() {
  }

  void run() {
    write("Kill the bugs before they kill Dart!");
    
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML = message;
    
    bugs = new List<Bug>();
    
    Bug bug = new Bug(this, 'img/bug01.png');
    bugs.add(bug);
    logo = new Logo('img/dartlogo.png');
    
    
    window.setInterval(() => detectColision(), 50);
    window.setInterval(() => createObjs(), 1000);
    
  }
  
  void createObjs() {
    Bug bug = new Bug(this, 'img/bug01.png');
    bugs.add(bug);

    time += 1;
  }

  void detectColision() {
    for (Bug bug in bugs) {
      if (distanceToLogo(bug) < 30) {
        bug.imgtag.remove();
      }
    }
  }

  double distanceToLogo(obj) {
    return distanceBetweenObjs(obj, logo);
  }
  
  double distanceBetweenObjs(obj1, obj2) {
    double dx = obj1.x - obj2.x;
    double dy = obj1.y - obj2.y;
    dx = dx*dx;
    dy = dy*dy;
    return Math.sqrt(dx + dy);
  }
}

void main() {
  test01 game = new test01();
  game.run();
}
