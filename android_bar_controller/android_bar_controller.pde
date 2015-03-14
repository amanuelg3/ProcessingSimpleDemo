/**
 * oscKeyboardSender
 */
 
import oscP5.*;
import netP5.*;
 
OscP5 oscP5;
NetAddress androidLocation;
int selectedY = 600;
int barWidth = 140;
float barHeight = 550;
int barLeftConnerX = 510;
int barLeftConnerY = 500;
float val = 0.18;

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

  textSize(90);
  text("Slider controll",280,200);
  fill(125,180,127); // light green for slider bg
  rect(barLeftConnerX,barLeftConnerY,barWidth,barHeight);
  fill(72,167,79);  // dark green for selected area bg
  rect(barLeftConnerX,selectedY,barWidth,barLeftConnerY + barHeight - selectedY);
  
  fill(255);
  textSize(60);
  text(val*100+"",barLeftConnerX +15,barLeftConnerY + barHeight +70);
}
void mousePressed(){
  if ( mouseX < barLeftConnerX || mouseX > ( barLeftConnerX + barWidth) ||
     mouseY < barLeftConnerY || mouseY > (barLeftConnerY + barHeight) ){
      return;
    }
    
  selectedY = mouseY;
  val = (barLeftConnerY + barHeight - selectedY) / barHeight;
  OscMessage msg = new OscMessage("/click");
  msg.add(val);

  /* send the message */
  oscP5.send(msg, androidLocation); 
  println("wtf :" + (barLeftConnerY + barHeight - selectedY) / barHeight);
  println("msg send: "+ val);

}

void mouseDragged(){
   if ( mouseX < barLeftConnerX || mouseX > ( barLeftConnerX + barWidth) ||
     mouseY < barLeftConnerY || mouseY > (barLeftConnerY + barHeight) ){
      return;
    }
    
  selectedY = mouseY;
  val = (barLeftConnerY + barHeight - selectedY) / barHeight ;
  
  OscMessage msg = new OscMessage("/drag");
  msg.add(val);

  /* send the message */
  oscP5.send(msg, androidLocation); 

}
