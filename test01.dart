#import('dart:html');

#source('Bug.dart');
#source('Logo.dart');
#source('Util.dart');
#source('Heart.dart');
class test01 {

  double x = 300.0;
  double y = 100.0;
  int time = 0;
  
  List<Bug> bugs;
  Logo logo;
  Heart heart1;
  Heart heart2;
  Heart heart3;
  int score = 0;
  int life = 3;
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
    
    heart2 = new Heart ('img/heart02.png');
    heart3 = new Heart ('img/heart02.png');
    heart3.x = 400.0;
    heart3.setPos();
    heart1 = new Heart ('img/heart02.png');
    heart1.x = 200.0;
    heart1.setPos();
   
    
    
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
      if (bug == null) {
        continue;
      }
        
      if (distanceToLogo(bug) < 30) {
        int i = bugs.indexOf(bug);
        bugs[i] = null;
       
        bug.imgtag.remove();
        damage();
        
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
  void damage(){
    life -= 1;
    print('life = $life');
    if (life == 2) {
      heart3.imgtag.remove();
      heart3 = new Heart('img/heart01.png');
      heart3.x = 400.0;
      heart3.setPos();
    }
    if (life == 1) {
      heart2.imgtag.remove();
      heart2 = new Heart('img/heart01.png');
      
    }
    if (life == 0) {
      heart1.imgtag.remove();
      heart1 = new Heart('img/heart01.png');
      heart1.x = 200.0;
      heart1.setPos();
    }
  }
}

void main() {
  test01 game = new test01();
  game.run();
}
