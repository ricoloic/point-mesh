public class Point {
  public PVector pos;
  public PVector drift;
  
  public Point() {
    this.pos = new PVector(floor(random(width)), floor(random(height)));
    this.drift = new PVector(random(-1, 1), random(-1, 1));
  }
  
  void show() {
    stroke(255);
    strokeWeight(3);
    point(this.pos.x, this.pos.y);
  }
  
  void update() {
    this.pos.add(this.drift);
  }
  
  void edge() {
    if (this.pos.x < 0 || this.pos.x > width) {
      this.drift.x *= -1;
    }

    if (this.pos.y < 0 || this.pos.y > height) {
      this.drift.y *= -1;
    }
  }
  
  boolean connect(Point p) {
    if (p == this) return false;
    
    if (dist(p.pos.x, p.pos.y, this.pos.x, this.pos.y) < connectionDistance) {
      return true;
    }
    
    return false;
  }
}
