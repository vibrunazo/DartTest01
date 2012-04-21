#import('dart:html');

#source('Bug.dart');
#source('Logo.dart');
#source('Util.dart');

class test01 {

  double x = 300.0;
  double y = 100.0;
  
  List<Bug> ducks;
  
  test01() {
  }

  void run() {
    write("Hello World!");
    
  }

  void write(String message) {
    // the HTML library defines a global "document" variable
    document.query('#status').innerHTML = message;
    
    Bug bug = new Bug('img/hi00.png');
    Logo logo = new Logo('img/dartlogo.png');
    
    
    window.setInterval(() => bug.move(), 50);
    window.setInterval(() => detectColision(), 50);
    
  }

  void detectColision() {
    
  }
  
}



void main() {
  new test01().run();
}
