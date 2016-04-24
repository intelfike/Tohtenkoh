PFont myFont ;
void setup(){
  size(400, 500);
  textSize(32);
}

PImage img;
void draw(){
  img = loadImage("HAL.jpg");
  background(120);  
  text("HelloWorld", 15, 50);
  image(img, 100, 0);
}