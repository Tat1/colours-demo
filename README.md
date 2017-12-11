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
  
