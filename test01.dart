#import('dart:html');

#source('Bug.dart');
#source('Logo.dart');
#source('Icon.dart');
#source('Util.dart');

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
    icons = new List<Icon>();
    
    Bug bug = new Bug(this, 'img/bug01.png');
    bugs.add(bug);
    logo = new Logo('img/dartlogo.png');
    
    window.setInterval(() => detectColision(), 50);
    window.setInterval(() => createBugWave(), 8000);
    window.setInterval(() => createBugs(), 5000);
    window.setInterval(() => createIcons(), 7000);
    
  }
  
  void createIcons() {
    if (running) {
      Icon icon = new Icon(this, 'img/play01.png');
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
  
  void lose() {
    running = false;
    deleteBugs();
    deleteIcons();
  }
  
  deleteBugs() {
    if (bugs == null) return;
    for (Bug bug in bugs) {
      if (bug == null) continue;
      int i = bugs.indexOf(bug);
      bugs[i] = null;
      bug.kill();
      bug = null;
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
