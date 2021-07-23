import peasy.PeasyCam;
PeasyCam peasyCam;

// Used to rotate the frame by incrementing x, y
float x = 0;
float y = 0;

void setup() {
  size(500, 500, P3D);
  frameRate(45); // Handy for Prof. Antonsen :-)
  peasyCam = new PeasyCam(this, 640);
}

void draw() {
  background(0);
  // Rotate the frame till we obtain the IAS/PCMI logo
  if (x < 2.9 && y < 2.9) {
    x += 0.015;
    y += 0.015;
    rotateX(x);
    rotateY(y);
  } else {
    rotateX(x);
    rotateY(y);
    
    // Rotate back without changing logo (using push, pop) and insert text
    push();
      rotateX(-29 * PI/239);
      rotateY(2 * PI/39);
      rotateZ(PI*-0.97);
      translate(-217, 77);
      
      textSize(70);
      fill(150);
      // Insert " IAS"
      String stringIAS = "IAS";
      float sw = textWidth(stringIAS);
      text(stringIAS, 30, 100);
      
      // Insert "|" 
      stroke(150);
      strokeWeight(1);
      line(46+sw, 40, 48+sw, 117);
      
      // Insert "PCMI"
      String stringPCMI = "PCMI";
      fill(0, 255, 0);
      text(stringPCMI, 51+sw+10, 100);
      
      // Insert "PARK CITY" 
      textSize(28);
      String stringPC = "PARK CITY";
      text(stringPC, 108, 146);
      
      // Insert "Math Institute"
      String stringMI = "MATHEMATICS INSTITUTE";
      text(stringMI, 8, 177);
      
      // Insert "A program of the IAS"
      textSize(14);
      fill(150);
      String stringAProgIAS = "A program of the Institute for Advanced Study";
      text(stringAProgIAS, 49, 201);
    pop();
  }

  // Draw the 3D logo itself
  strokeWeight(7);
  lights();

  // White lines
  stroke(255);
  lights();
  line(-100, 0, 0, 100, 0, 0);
  line(0, -100, 0, 0, 100, 0);
  line(0, 0, -100, 0, 0, 100);

  // Green lines
  stroke(0, 255, 0);
  // Front view (<> from the front)
  line(0, 100, 0, 100, 0, 0);
  line(100, 0, 0, 0, -100, 0);
  line(0, -100, 0, -100, 0, 0);
  line(-100, 0, 0, 0, 100, 0);

  // <> with z!=0 (<> as viewed from the sides)
  line(0, 100, 0, 0, 0, 100);
  line(0, 0, 100, 0, -100, 0);
  line(0, -100, 0, 0, 0, -100);
  line(0, 0, -100, 0, 100, 0);

  // Side-lines (<> as viewed from the top)
  line(-100, 0, 0, 0, 0, 100);
  line(-100, 0, 0, 0, 0, -100);
  line(100, 0, 0, 0, 0, 100);
  line(100, 0, 0, 0, 0, -100);
  
  // Uncomment if you wish to save the png images.
  //saveFrame("####.png");
}
