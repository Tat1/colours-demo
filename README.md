# colours-demo

An experimental animation that uses mouse interaction to allow the user to play around with the colours or to make it simpler a circular puzzle using colours.
![screen grab](https://github.com/Tat1/colours-demo/blob/master/Screen%20Shot%202017-11-30%20at%2014.28.42.png)

---

### Process

This code is based on the Processing example "tickle" as shown below

```
String message = "tickle";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text

void setup() {
  size(640, 360);

  // Create the font
  textFont(createFont("SourceCodePro-Regular.ttf", 36));
  textAlign(CENTER, CENTER);

  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  x = width / 2;
  y = height / 2;
}

void draw() {
  // Instead of clearing the background, fade it by drawing
  // a semi-transparent rectangle on top
  fill(204, 120);
  rect(0, 0, width, height);

  // If the cursor is over the text, change the position
  if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
    x += random(-5, 5);
    y += random(-5, 5);
  }
  fill(0);
  text("tickle", x, y);
}
```
![screen grab](https://github.com/Tat1/colours-demo/blob/master/Screen%20Shot%202017-12-07%20at%2011.24.39.png)

---

#### Step 1

I changed the tickle to an object which was a circle and with the tickle code it allowed me to interact and move the circle around the screen.
```
String message = "tickle";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text

void setup() {
  size(640, 360);


  textFont(createFont("SourceCodePro-Regular.ttf", 36));
  textAlign(CENTER, CENTER);

  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  x = width /2;
  y = height /2 ;
}

void draw() {
  // Instead of clearing the background, fade it by drawing
  // a semi-transparent rectangle on top
  fill(0, 10);
  rect(0, 0, width, height);

  // If the cursor is over the text, change the position
  if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
    x += random(-5, 5);
    y += random(-5, 5);
  }
  fill(0, 82, 165);
  ellipse (x, y, 60, 60);

}
```
![screen grab](https://github.com/Tat1/colours-demo/blob/master/Screen%20Shot%202017-12-07%20at%2012.18.17.png)

#### Step 2
I added four more circles to the current one and found that the four circles tickle when the middle one was moved.

```
String message = "tickle";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text

void setup() {
  size(640, 360);


  textFont(createFont("SourceCodePro-Regular.ttf", 36));
  textAlign(CENTER, CENTER);

  hr = textWidth(message) / 2;
  vr = (textAscent() + textDescent()) / 2;
  noStroke();
  x = width /2;
  y = height /2 ;
}

void draw() {
  // Instead of clearing the background, fade it by drawing
  // a semi-transparent rectangle on top
  fill(0, 10);
  rect(0, 0, width, height);

  // If the cursor is over the text, change the position
  if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
    x += random(-5, 5);
    y += random(-5, 5);
  }
  fill(0, 82, 165);
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
```
![screen grab](https://github.com/Tat1/colours-demo/blob/master/Screen%20Shot%202017-12-07%20at%2012.05.23.png)

I found that the circles moved outside of the screen and wasn't confide to the visible screen. In addition, I wanted different interactions to the circles such as changing the colour of each of the circles when pressed.

#### Step 3
Collaboration for the problems
```
@ -34,6 +34,11 @@ void draw() {
      abs(mouseY - y) < vr) {
    x += random(-5, 5);
    y += random(-5, 5);

    if (x < 0) { x = 0; }
    if (y < 0) { y = 0; }
    if (x > width) { x = width; }
    if (y > height) { y = height; }
  }
  fill(0, 82, 165);
  ellipse (x, y, 60, 60);
@ -48,7 +53,6 @@ void draw() {
  ellipse ( 70, x, 60, 60);

  fill (202, 185, 241);
  ellipse ( y, 70, 60, 60);

  ellipse ( y, 70, 60, 60);  
  //text("tickle", x, y);
}
```

Modified by [Nick](https://github.com/cassiel): avoid discs running off the edge.


```
@@ -9,6 +9,8 @@ String message = "tickle";
float x, y; // X and Y coordinates of text
float hr, vr;  // horizontal and vertical radius of the text

boolean colourChanged = false;

void setup() {
  size(640, 360);

@ -23,12 +25,21 @@ void setup() {
  y = height /2 ;
}

void draw() {
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



  // If the cursor is over the text, change the position
  if (abs(mouseX - x) < hr &&
      abs(mouseY - y) < vr) {
@ -40,7 +51,13 @@ void draw() {
    if (x > width) { x = width; }
    if (y > height) { y = height; }
  }
  fill(0, 82, 165);

  if (colourChanged) {
    fill(0, 82, 165);
  } else {
    fill (225);
  }

  ellipse (x, y, 60, 60);

  fill(140, 101, 211);
  ```

  Modified by [Sophi-4](https://github.com/sophi-4): changed the colour of one.

  Changes made to the code that allows the colour change and disc limitations
  ![screen grab](https://github.com/Tat1/colours-demo/blob/master/Screen%20Shot%202017-12-07%20at%2014.00.13.png)

  ![screen grab](https://github.com/Tat1/colours-demo/blob/master/Screen%20Shot%202017-12-07%20at%2014.03.15.png)

```
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
```
---
Next step was to change it into an interactive puzzle colour game.
I finally got the basics of moving each of the cirlces individually and changing each of their colours.
I made the two main colours red and green and the point is to get all of the colours to turn into the green colour.

![screen grab](https://github.com/Tat1/colours-demo/blob/master/Screen%20Shot%202017-12-11%20at%2022.22.26.png)
![screen grab](https://github.com/Tat1/colours-demo/blob/master/Screen%20Shot%202017-12-11%20at%2022.22.47.png)
![screen grab](https://github.com/Tat1/colours-demo/blob/master/Screen%20Shot%202017-12-11%20at%2022.23.17.png)
![screen grab](https://github.com/Tat1/colours-demo/blob/master/Screen%20Shot%202017-12-11%20at%2022.23.02.png)

```
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
    fill(81, 164, 82);
  } else {
    fill ( 230, 0, 0);
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
     fill (81, 164, 82);
    } else {
      fill (230, 0, 0);
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
       fill ( 81, 164, 82);
     } else{
       fill ( 230, 0, 0);
     }
         ellipse (tx, ty, 60, 60);
   }
   ```

   ---
   Change in background when clicked

![screen grab](https://github.com/Tat1/colours-demo/blob/master/Screen%20Shot%202017-12-14%20at%2011.06.03.png)

   Collaboration by [sophi-4](https://github.com/sophi-4) and [Tat1](https://github.com/Tat1)
