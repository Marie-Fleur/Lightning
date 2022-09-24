PImage sky;
int i = 0;
PFont f;

float RESCALE = 1.5;
int PERSON_WIDTH = 150;
int PERSON_HEIGHT = 150;

int SLOW_RATE = 15;
int FAST_RATE = 60;

void setup() {
  size(800, 800);
  strokeWeight(2);
  sky = loadImage("runner.png");
  sky.resize((int)(sky.width * RESCALE), (int)(sky.height * RESCALE));
  frameRate(SLOW_RATE);
  f = createFont("Arial", 16, true);
}

void draw() {
  background(0, 0, 0, 15);
  i = i % 16;
  drawPerson(400, 300, i);
  i++;
  if (mousePressed) {
    drawLightning();
  }
}

void mousePressed() {
  frameRate(FAST_RATE);
}

void mouseReleased() {
  frameRate(SLOW_RATE);
}

void drawLightning() {
  int startX = 0;
  int startY = (int)((Math.random() * 251) + 250);
  int endX = 0;

  stroke((int)((Math.random()*256)+150), (int)((Math.random()*256) - 150), 0);
  frameRate(FAST_RATE);

  while (endX <= 450) {
    endX = startX + (int)(Math.random() * 9);
    int endY = startY + (int)(((Math.random() * 18) - 9));
    line(startX, startY, endX, endY);
    System.out.println(endX);
    startX = endX;
    startY = endY;
  }
}
void drawPerson(int x, int y, int i) {
  int pWidth = (int) (PERSON_WIDTH * RESCALE);
  int pHeight = (int) (PERSON_HEIGHT * RESCALE);
  int xi =  (i % 4) * pWidth;
  int yi =  (i / 4) * pHeight;
  PImage person = sky.get(xi, yi, pWidth, pHeight);
  image(person, x, y);
}
