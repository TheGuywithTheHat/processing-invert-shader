PImage image;
PShader shader;

PVector circle;
PVector velocity;

void setup() {
  size(1760, 212, P2D);
  image = loadImage("image.png");
  shader = loadShader("InvertFrag.glsl");
  
  circle = new PVector(width / 2, height / 2, 32);
  velocity = new PVector(random(-3, 3), random(-3, 3), 0);
}


void update() {
  if(circle.x + velocity.x <= 0 + circle.z || circle.x + velocity.x >= width - circle.z) {
    velocity.x = -velocity.x;
  }
  if(circle.y + velocity.y <= 0 + circle.z || circle.y + velocity.y >= height - circle.z) {
    velocity.y = -velocity.y;
  }
  circle.add(velocity);
}

void draw() {
  update();
  
  shader.set("circle", circle);
  shader(shader);
  image(image, 0, 0);
}
