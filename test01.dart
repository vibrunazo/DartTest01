#import('dart:html');

#source('Bug.dart');
#source('Logo.dart');
#source('Util.dart');

class test01 {

  double x = 300.0;
  double y = 100.0;
  
  List<Bug> bugs;
  Logo logo;
  
  test01() {
  }

  void run() {
    write("Hello World!");
    
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML = message;
    
    bugs = new List<Bug>();
    
    Bug bug = new Bug('img/hi00.png');
    bugs.add(bug);
    logo = new Logo('img/dartlogo.png');
    
    
//    window.setInterval(() => bug.move(), 50);
    window.setInterval(() => detectColision(), 50);
    
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
  new test01().run();
}
