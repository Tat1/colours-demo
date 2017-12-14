/*
    Used the tickle code and adapted it to an animation interaction
 */
 
 //Called the font as two separate ones
PFont font; 
PFont font2;
PFont font3;

//Ball one
String message = "tickle";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text

boolean colourChanged = false;

//Ball two
String zmessage = "tickle";
float zx, zy; // New X and Y coordinates of the new text
float zhr, zvr; //New horizontal and vertical radius of the text

boolean zcolourChanged = false;

//Ball three
String tmessage = "tickle";
float tx, ty; // Third X and Y coordinates of the new text
float thr, tvr; //Third horizontal and vertical radius of the text

boolean tcolourChanged = false;

void setup() {
  size(640, 360);
  
  //Replaced create font with load font
  font = loadFont ("DSEG14Classic-Bold-96.vlw"); //for the first ball
  font2 = loadFont ("DSEG14Classic-Bold-96.vlw"); //for the second ball
  font3 = loadFont ("DSEG14Classic-Bold-96.vlw"); //for the second ball
  
  // Load the font
  textFont(font, 36);// for the first ball
  textAlign(CENTER, CENTER);
  
  //Load the font2
  textFont(font2, 36);
  textAlign(CENTER, CENTER);
  
  // Load the font3
  textFont(font3, 36);
  textAlign(CENTER, CENTER);
  
  //for the first ball
  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  x = width /1.5;
  y = height /1.5 ;
  
  //for the second ball
  zhr = textWidth(zmessage) / 2;
  zvr = (textAscent() + textDescent()) / 2;
  noStroke();
  zx = width /3;
  zy = height /3;
  
  //for the third ball
  thr = textWidth(tmessage) / 2;
  tvr = (textAscent() + textDescent()) / 2;
  noStroke();
  tx = width /2;
  ty = height /2;
}

    //created an if else statement
    void mousePressed() {
      
      //colour change for ball one
      if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
        colourChanged = !colourChanged;
      }
      
      //colour change for ball two
        else if (abs(mouseX - zx) < zhr &&
            abs(mouseY - zy) < zvr) {
              zcolourChanged = !zcolourChanged;
      }
      
      //colour change for ball three
      else if (abs(mouseX - tx) < thr &&
          abs(mouseY - ty) < thr) {
            tcolourChanged = !zcolourChanged;
      }
   }
    
 void draw() {
  // Instead of clearing the background, fade it by drawing
  // a semi-transparent rectangle on top
  fill(0, 10);
  rect(0, 0, width, height);

 //cursor for ball one
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
    fill(230, 0, 0);
  } else {
    fill (81, 164, 82);
  }
      ellipse (x, y, 60, 60); 
  
  //colour for ball two
  if (abs(mouseX - zx) < zhr &&
      abs(mouseY - zy) < zvr) {
    zx += random(-5, 5);
    zy += random(-5, 5);
   
    if (zx < 0) { zx = 0; }
    if (zy < 0) { zy = 0; }
    if (zx > width) { zx = width; }
    if (zy > height) { zy = height; }
  }
  // if the mousePressed happens the colour is changed if not it is left unchanged
   if (zcolourChanged) {
     fill (230, 0, 0);
    } else {
      fill (81, 164, 82);
    }
        ellipse (zx, zy, 60, 60);
        
 //cursor for ball three
   //If the cursor is over the object, change the position
   if (abs(mouseX - tx) < thr &&
       abs(mouseY - ty) < tvr) {
     tx += random(-5, 5);
     ty += random(-5, 5);
     
     if (tx < 0) { tx = 0; }
     if (ty < 0) { ty = 0; }
     if (tx > width) { tx = width; }
     if (ty > height) { ty = height; }
   }
   // if the mousePressed happens the colur is changed if not it is left unchanged
     if (tcolourChanged) {
       fill (81, 164, 82);
     } else{
       fill (230, 0, 0);
     }
         ellipse (tx, ty, 60, 60);
   }   
 /* 
  fill(140, 101, 211);
  ellipse (x, 40, 60, 60);
 
  fill (0, 173, 206);
  ellipse (40, y, 60, 60);
  
  fill (115, 235, 174);
  ellipse ( 70, x, 60, 60);
  
  fill (202, 185, 241);
  ellipse ( y, 70, 60, 60);  
  //text("tickle", x, y);
*/