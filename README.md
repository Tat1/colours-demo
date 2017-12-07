# colours-demo

An experimental animation that uses mouse interaction to allow the user to play around with the colours or to make it simpler a circular puzzle using colours. 
![screen grab](https://github.com/Tat1/colours-demo/blob/master/Screen%20Shot%202017-11-30%20at%2014.28.42.png)


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

I changed the code to focus on animations and how the user would interact with them. 
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

Modified by [Nick](https://github.com/cassiel): avoid discs running off the edge.

