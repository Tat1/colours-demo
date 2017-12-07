/**
 * Tickle. 
 * 
 * The word "tickle" jitters when the cursor hovers over.
 * Sometimes, it can be tickled off the screen.
 */

String message = "tickle";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text

boolean colourChanged = false;

void setup() {
  size(640, 360);
  
  // Create the font
  textFont(createFont("SourceCodePro-Regular.ttf", 36));
  textAlign(CENTER, CENTER);
  
  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  x = width /2;
  y = height /2 ;
}

    void mousePressed() {
      
      if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
        colourChanged = !colourChanged;
      }
   }
    
 void draw() {
  // Instead of clearing the background, fade it by drawing
  // a semi-transparent rectangle on top
  fill(0, 10);
  rect(0, 0, width, height);

 
  // If the cursor is over the object, change the position
  if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
    x += random(-5, 5);
    y += random(-5, 5);
    
    if (x < 0) { x = 0; }
    if (y < 0) { y = 0; }
    if (x > width) { x = width; }
    if (y > height) { y = height; }
  }
 // if the mousePressed happens the colour is changed if not it is left unchanged
  if (colourChanged) {
    fill(0, 82, 165);
  } else {
    fill (225);
  }
  
  ellipse (x, y, 60, 60); 
  
  fill(140, 101, 211);
  ellipse (x, 40, 60, 60);
 
  fill (0, 173, 206);
  ellipse (40, y, 60, 60);
  
  fill (115, 235, 174);
  ellipse ( 70, x, 60, 60);
  
  fill (202, 185, 241);
  ellipse ( y, 70, 60, 60);  
  //text("tickle", x, y);
}