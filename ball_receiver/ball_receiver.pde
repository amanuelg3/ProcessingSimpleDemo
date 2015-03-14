/**
 * oscAndroidReceiver
 */
 
import oscP5.*;
import netP5.*;
 
OscP5 oscP5;
 

NetAddress myRemoteLocation;
int size = 100;
void setup() {
  size(800,800);
  // start oscP5, listening for incoming messages at port 9999
  oscP5 = new OscP5(this, 5556);
  myRemoteLocation = new NetAddress("192.168.56.101", 5556);
 

}
 
void draw() {
  background(0); 
  fill(255);
  ellipse(400,400,size,size);
}
 

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage msg) {
  float ratio = msg.get(0).floatValue();
  size = int(ratio * 100);
 
}
