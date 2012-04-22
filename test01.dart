#import('dart:html');

#source('Bug.dart');
#source('Logo.dart');
#source('Icon.dart');
#source('Util.dart');
#source('Heart.dart');

class test01 {

  double x = 300.0;
  double y = 100.0;
  int time = 0;
  int waves = 0;
  bool running = true;
  final int MAXWAVES = 20;
  
  List<Bug> bugs;
  List<Icon> icons;
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
//    document.style.position = 'absolute';
    
    bugs = new List<Bug>();
    icons = new List<Icon>();
    
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
    window.setInterval(() => createBugWave(), 8000);
    window.setInterval(() => createBugs(), 5000);
    window.setInterval(() => createIcons(), 7000);
    
  }
  
  void createIcons() {
    if (running) {
      Icon icon = new Icon(this);
      icons.add(icon);
    }
  }
  
  void createBugWave() {
    if (waves <= MAXWAVES && running) {
      window.setInterval(() => createBugs(), 5500);
      waves++;
    }
  }
  
  void createBugs() {
    if (running) {
      Bug bug = new Bug(this, 'img/bug01.png');
      bugs.add(bug);
      
      time += 1;
    }
  }

  void detectColision() {
    if (bugs == null) return;
    for (Bug bug in bugs) {
      if (bug == null) {
        continue;
      }
        
      if (distanceToLogo(bug) < 30) {
        
        killBug(bug);

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
  
  void damage([int dmg]){
    if (dmg != null) life -= dmg;
    else life -= 1;
    if (life <= 2) {
      heart3.imgtag.remove();
      heart3 = new Heart('img/heart01.png');
      heart3.x = 400.0;
      heart3.setPos();
    }
    if (life <= 1) {
      heart2.imgtag.remove();
      heart2 = new Heart('img/heart01.png');
      
    }
    if (life <= 0) {
      life = 0;
      heart1.imgtag.remove();
      heart1 = new Heart('img/heart01.png');
      heart1.x = 200.0;
      heart1.setPos();
      if (running) lose();
    }
  }

  void lose([String message]) {
    running = false;
    deleteBugs();
    deleteIcons();
    damage(3);
    logo.loselogo('img/problem.png');
    
    if (message != null) {
      window.alert(message);
    }
  }
  
  killBug(Bug bug) {
    if (bugs == null) return;
    int i = bugs.indexOf(bug);
    bugs[i] = null;
    bug.kill();
    bug = null;
  }
  
  deleteBugs() {
    if (bugs == null) return;
    for (Bug bug in bugs) {
      if (bug == null) continue;
      killBug(bug);
    }
    bugs = null;
  }
  
  deleteIcons() {
    if (icons == null) return;
    for (Icon icon in icons) {
      if (icon == null) continue;
      int i = icons.indexOf(icon);
      icons[i] = null;
      icon.kill();
      icon = null;
    }
    bugs = null;
  }
}

void main() {
  test01 game = new test01();
  game.run();
}
