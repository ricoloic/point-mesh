int amount = 300;
ArrayList<Point> points = new ArrayList<>();
int connectionDistance = 150;

void setup() {
  fullScreen();
  
  for (int i = 0;i < amount; i++) {
    points.add(new Point());
  }
}

void draw() {
  background(33);
  
  
  for (Point p1 : points) {
    for (Point p2 : points) { //<>//
      if (p1.connect(p2)) {
        float distance = dist(p1.pos.x, p1.pos.y, p2.pos.x, p2.pos.y);
        int alpha = floor(map(distance, 0, connectionDistance, 255, 0));
        
        stroke(255, alpha);
        strokeWeight(2);
        line(p1.pos.x, p1.pos.y, p2.pos.x, p2.pos.y);
      }
    }
  }
  
  for (Point p : points) {
    p.edge();
    p.update();
    p.show();
  }
}
