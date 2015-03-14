/**
 * oscKeyboardSender
 */
 
import oscP5.*;
import netP5.*;
 
OscP5 oscP5;
NetAddress androidLocation;
int rectX = 500;
int rectY = 1100;
void setup() {
  size(1080,1920);
  frameRate(25);
  // start oscP5, listening for incoming messages at port 8888
  oscP5 = new OscP5(this, 8888);
  // Location of my Android Device
  androidLocation = new NetAddress("192.168.56.1", 5556);
  
}
 
void draw() {
  background(76,73,73); 
  rect(rectX,rectY, 150, 150, 8);
  textSize(90);
  text("Touch controller",280,200);
}
void mousePressed(){
  OscMessage myMessage = new OscMessage("/click");
  int x = int(mouseX * 0.72);
  int y = int(mouseY * 0.54);
  myMessage.add(x);
  myMessage.add(y);
  println("send x,y :"+ mouseX + ","+mouseY);
  /* send the message */
  oscP5.send(myMessage, androidLocation); 
  println("msg send");
  rectX= mouseX;
  rectY= mouseY;
}

void mouseDragged(){
  OscMessage myMessage = new OscMessage("/drag");
  int x = int(mouseX * 0.72);
  int y = int(mouseY * 0.54);
  myMessage.add(x);
  myMessage.add(y);
  
  /* send the message */
  oscP5.send(myMessage, androidLocation); 
  println("msg send");
  rectX= mouseX;
  rectY= mouseY;
}



